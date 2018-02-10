rm(list=ls());

rdice <- function(n) 
{
  X <- runif(n);
  X <- ceiling(6*X);
  return(X);
}

X <- rdice(90000);
X <- table(X);
print(X/sum(X));

