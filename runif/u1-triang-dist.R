rm(list=ls());

df <- data.frame(X1=runif(12345) - runif(12345));

##### testing the random variables
sf <- data.frame();
for(k in names(df)) {
 sf[k, "mean"] <- mean(df[, k]);
 sf[k, "var"] <- var(df[, k]);
 sf[k, "lower"] <- min(df[, k]);
 sf[k, "upper"] <- max(df[, k]);
}

print(sf);