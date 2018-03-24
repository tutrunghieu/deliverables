rm(list=ls());
set.seed(197);

V <- c("red", "green", "blue", "black", "white");
pV <- rgamma(length(V), shape=0.9);
pV <- pV / sum(pV);

print(data.frame(V, pV));

n <- 1000;
L <- ceiling(10 + 7*runif(n));
X <- c();
for(k in 1:n) {
  Xk <- sample(V, L[k], prob=pV, replace=TRUE);
  X[k] <- paste(Xk, collapse=' ');
}

print(data.frame(L=L, X=X), row.names=F);



 
