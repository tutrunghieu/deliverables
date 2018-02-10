rm(list=ls());

rcoin <- function(n, p) 
{
  X <- ifelse(runif(n)<p, "head", "tail");
  return(X);
}

X <- rcoin(1000, 0.1);
table(X);
