collatz <- function(n, acc=c()) {
  if(n==1) return(c(acc, 1));
  collatz(ifelse(n%%2==0, n/2, 3*n +1), c(acc, n))} 
