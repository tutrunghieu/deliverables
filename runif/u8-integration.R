rm(list=ls());

mci <- function(n, a, b, M, f) 
{
  X <- runif(n);
  X <- X*a + (1-X)*b;
  Y <- M * runif(n);
  under <- sum(Y < f(X));
  return(M*abs(b-a)*under/n);
}

v <- mci(500000, -5, 5, 1, function(x) { dnorm(x, 0, 1); });
print(v);
