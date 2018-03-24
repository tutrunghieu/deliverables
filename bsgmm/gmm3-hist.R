rm(list=ls());

set.seed(197);

makeHist <- function(GMM) {
 n <- 5000;
 X <- rnorm(n);

 for(k in seq_along(X)) {
  rk <- sample(1:3, 1, replace=TRUE, prob=GMM$freq);
  X[k] <- GMM$mu[rk] + GMM$sigma[rk] * X[k];
 }

 return( hist(X, breaks=50) );
}

GMM <- rbind(
 data.frame(mu=5, sigma=2, freq=0.2),
 data.frame(mu=30, sigma=2, freq=0.3),
 data.frame(mu=50, sigma=2, freq=0.5)
)
print(GMM);

h <- makeHist(GMM);
print(data.frame(h$mids, h$density));

X <- sample(h$mids, 1000, prob=h$density, replace=T);
hist(X, breaks=100);
