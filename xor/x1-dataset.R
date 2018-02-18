rm(list=ls());

df <- data.frame(X=320*runif(3000), Y=200*runif(3000));
df$T <- ifelse( (df$X-mean(df$X))*(df$Y-mean(df$Y)) < 0, "red", "blue");
print(head(df));

plot(df$X, df$Y, col=df$T, xlim=c(0, 320), ylim=c(0, 200));
