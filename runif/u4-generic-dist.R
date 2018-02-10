rm(list=ls());

reject <- function(n, a, b, M, f) {
  
  X <- c();

  k=1;
  while(k<=n) {
    xk <- runif(1);
    xk <- a*xk + b*(1-xk);
    yk <- M*runif(1);
    if(yk > f(xk)) next;
    X[k] <- xk;
    k <- k + 1;
  }

  return(X);
}

X <- reject(10000, -5, 15, 1, function(x) { 0.5*dnorm(x, 1, 0.5) + 0.3*dnorm(x, 5, 0.5) });
hist(X, breaks=100, xlim=c(-2, 8));
