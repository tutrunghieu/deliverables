##### drawing 12345 samples from X ~ N(0, 1)
X <- rep(-6, 12345);
for(k in 1:12) X <- X + runif(length(X));

##### you can create N(12, 3) from N(0, 1) as well
df <- data.frame(X1=X, X2=12 + 3*X);

##### testing the random variables
sf <- data.frame();
for(k in names(df)) {
 sf[k, "mean"] <- mean(df[, k]);
 sf[k, "var"] <- var(df[, k]);
 sf[k, "sd"] <- sd(df[, k]);
}

print(sf);

