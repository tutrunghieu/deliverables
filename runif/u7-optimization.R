rm(list=ls());

argmax <- function(n, a, b, f) 
{
  X <- runif(n);
  X <- X*a + (1-X)*b;
  Y <- f(X);
  res <- list(X=X, Y=Y, opt=which.max(Y) );
  return(res);
}

a <- argmax(10000, -10, 10, function(x) { 4 - (x-3)*(x-3) });
sel <- a$opt;
print(data.frame( X=a$X[sel], Y=a$Y[sel] ));
