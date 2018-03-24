rm(list=ls());

set.seed(197);

X <- -6;
n <- 7000;
for(k in 1:12) X <- X + runif(n);

print(data.frame( mu=mean(X), sigma=sd(X), sigma2=var(X) ));
hist(X, breaks=50);