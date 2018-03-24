rm(list=ls());

n <- 9000;
X <- rnorm(n);
h <- hist(X, breaks=50);
print(data.frame(h$mids, h$density));

X <- sample(h$mids, 5000, prob=h$density, replace=T);

print(data.frame( mu=mean(X), sigma=sd(X), sigma2=var(X) ));
hist(X, breaks=50);