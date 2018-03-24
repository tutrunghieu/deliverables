rm(list=ls());

set.seed(197);

X <- 5 + 2*rnorm(7000);
print(data.frame( mu=mean(X), sigma=sd(X), sigma2=var(X) ));
hist(X, breaks=50);