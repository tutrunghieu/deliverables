rm(list=ls());

rcoin <- function(n, p) 
{
  X <- ifelse(runif(n)<p, "head", "tail");
  return(X);
}

df <- data.frame(X1=rcoin(1000, 0.1), X2=rcoin(1000, 0.5));
table(df$X1);
table(df$X2);

