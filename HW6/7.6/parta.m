1;
function retval = cmdeck (deck)
  retval = zeros(1,7);
  for x = 1:7
    for y = 1:x
      retval(x) = retval(x) + deck(y);
  endfor
  endfor
endfunction
function retval = draw (deck, hand)
  i = 0;
  retval = 1;
  tempcmd = cmdeck(deck);
  i = unifrnd(1,60);
  for x = 1:7
    if(i <= tempcmd(x))
      retval = x;
      return;
endif
endfor
end

repeats = 10;
roundresults = zeros(1,repeats);
trials = 1000;

for z = 1:repeats
counts = zeros(1,10);
for x = 1:trials
deck = [10,10,10,10,2,2,16];
hand = [0,0,0,0,0,0,0];
lands = [0,0];
resolvedyet = 0;
casts = 0;
for x = 1:7
  d= draw(deck, hand);
  hand(d)++;
  deck(d)--;
end
turns = 0;

while(resolvedyet == 0)
  turns++;
  lands(1) = lands(1) + lands(2);
  lands(2) = 0;
  if(turns > 1)
  d= draw(deck, hand);
  hand(d)++;
  deck(d)--;
  endif
  if( hand(1) > 0)
    hand(1) --;
    lands(1) ++;
  endif
  for j = 2:7
    if((j <= lands(1)+1 && casts == 0 ) && hand(j) > 0)
      casts = 1;
      hand(j) --;
      resolvedyet++;
  endif
endfor
endwhile
if(turns <=10)
counts(turns)++;
endif
endfor
roundresults(z) = counts(4);
endfor
#printf("Over %d simulated games, the first spell was cast on turn 4 %d%% of the time \n", trials, counter/trials*100)
printf("Over 10 experiments of 1000 games each, the frequency of games in which the first spell was cast turn four is:  \n")
roundresults
printf("\n The empirical probability of the first spell in a given game being cast on turn 4 is: \n")
mean(roundresults/trials)
printf("\n The standard deviation in probability of the first spell in a given game being cast on turn 4 is: \n")
std(roundresults/trials)


