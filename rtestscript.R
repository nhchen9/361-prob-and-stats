sol = 0
r = .51
n=1000
sol = 0
for (x in c(0:5)){
    print (x)
    print(choose(5,x)*choose(30,(7-x))/choose(35,7))
    sol = sol + (choose(5,x)*choose(30,(7-x))/choose(35,7))
}
sol

factorial(2.4)

for ( x in c(1:10)){
  print(runif(1,0,1))
}

#pi is initial state probability distribution
# use runif - random uniform
# p after n = pi*stochastic matrix to the nth

x = matrix(c(.4,.1,.5,.2,.25,.55,.7,.1,2),nrow = 3, ncol = 3, byrow=TRUE)
probs = c( .2, .1, .3, .4)
cprobs = c( .2, .3, .6, 1)
counts = c(0,0,0,0)

y = runif (1000,0,1)
for ( x in c(1:1000)){
  check = 0
  for( i in c(1:4)){
    if( (y[x] < cprobs[i]) & (check == 0)){
      counts[i] = counts[i]+1
      check = 1
    }
  }
  
}w

