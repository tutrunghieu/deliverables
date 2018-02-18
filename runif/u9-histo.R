X <- runif(1000);
hist(X, breaks=50);

X <- runif(10000) - runif(10000);
hist(X, breaks=50);

X <- rnorm(10000);
hist(X, breaks=50);
