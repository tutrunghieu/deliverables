rm(list=ls());

rcat <- function(n, N, V) {
  for(k in 2:length(V)) V[k] <- V[k] + V[k-1];
  
  R <- runif(n);
  X <- c();
  
  for(k in 1:n) {
    ik <- which(R[k]<V)[1];
    X[k] <- N[ik];
  }

  return(X);
}

V <- c(0.1, 0.4, 0.5);
N <- c("red", "green", "blue");
X <- rcat(1000, N, V);
table(X);
