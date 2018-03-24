rm(list=ls());

set.seed(197);

n <- 20000;
U1 <- runif(n);
U1 <- -5*U1 + 5*(1-U1);

F1 <- exp(-U1*U1/2)/sqrt(2*pi);

U2 <- runif(n);

X <- U1[U2 < F1];

print(data.frame(U1, F1, U2));
print(data.frame( mu=mean(X), sigma=sd(X), sigma2=var(X) ));
hist(X, breaks=50);