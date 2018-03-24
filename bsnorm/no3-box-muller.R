rm(list=ls());

set.seed(197);

n <- 7000;
U1 <- runif(n);
U2 <- runif(n);
X <- sqrt(-2*log(U1))*cos(2*pi*U2)

print(data.frame( mu=mean(X), sigma=sd(X), sigma2=var(X) ));
hist(X, breaks=50);