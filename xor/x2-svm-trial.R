rm(list=ls());

# install.packages("e1071");
library(e1071);

set.seed(197);

makeData <- function() {
df <- data.frame(X=320*runif(3000), Y=200*runif(3000));
df$T <- ifelse( (df$X-mean(df$X))*(df$Y-mean(df$Y)) < 0, "red", "blue");
print(head(df));

# plot(df$X, df$Y, col=df$T, xlim=c(0, 320), ylim=c(0, 200));
return(df);
}


main <- function() {
df <- makeData();

x <- df[, c("X", "Y")];
y <- df[, "T"];

md <- svm(x, y, type='C', kernel='polynomial', degree=2);
y1 <- predict(md, x); 

sf <- data.frame(y=y, y1=y1, e1=abs(y != y1) );
print(head(sf));
table(sf$y, sf$y1);

df <- df[sf$e1==1, ];
plot(df$X, df$Y, col=df$T, xlim=c(0, 320), ylim=c(0, 200));
} 

cat(rep('\n', 10)); main();