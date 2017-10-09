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
roundresults = zeros(6,repeats +1);

for i = 1:6
  roundresults(i, 1) = i;
endfor

trials = 1000;
for z = 1:repeats
counts = zeros(1,6);
for x = 1:trials

deck = [24,10,10,10,2,2,2];
hand = [0,0,0,0,0,0,0];
lands = [0,0];
resolvedyet = 0;
casts = 0;
cmc = 0;
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
  d= draw(deck, hand);
  hand(d)++;
  deck(d)--;
  if( hand(1) > 0)
    hand(1) --;
    lands(1) ++;
  endif
  for j = 0:5
    if( (7-j <= lands(1)+1 && casts == 0 ) && hand(7-j) > 0)
      casts = 1;
      hand(7-j) --;
      resolvedyet++;
      cmc = 6-j;
  endif
endfor
endwhile
counts(cmc)++;
endfor
for c = 1:6
roundresults(c,z+1) = counts(c);
endfor
endfor
#printf("Over %d simulated games, the first spell was cast on turn 4 %d%% of the time \n", trials, counter/trials*100)
printf("Over 10 experiments of 1000 games each, the frequency of games by first spell cmc was:")
roundresults
cmcfour = zeros(1,10);
for x = 1:repeats
  cmcfour(x)=roundresults(4,x+1);
endfor 
printf("\n the row corresponding to cmc 4 is \n")
cmcfour
printf("\n average: %s")
 mean(cmcfour)
printf("\n the probability of a given game having first spell cast cmc 4 is:  ")
mean(cmcfour)/1000
printf("\n very unlikely")

printf("\n standard deviation of probability: %s", std(cmcfour))
std(cmcfour)/1000
