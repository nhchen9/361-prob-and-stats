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

counts = zeros(6,6);
trials = 10000;

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
if(turns <= 6)
  counts(turns, cmc)++;
endif
endfor
#printf("Over %d simulated games, the first spell was cast on turn 4 %d%% of the time \n", trials, counter/trials*100)
counts
probabilities = counts/10000
