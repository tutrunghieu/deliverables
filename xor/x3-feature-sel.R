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
df$X1 <- df$X - mean(df$X);
df$Y1 <- df$Y - mean(df$Y);
df$XY <- df$X1 * df$Y1;

x <- df[, c("X", "Y", "XY")];
y <- df[, "T"];

cat('----- model params -----\n');
md <- svm(x, y, type='C', kernel='polynomial', degree=1);
print(md);

cat('----- model error -----\n');
y1 <- predict(md, x); 
e1 <- (y != y1);

sf <- data.frame(y=y, y1=y1, e1=abs(e1) );
print(head(sf));
table(sf$y, sf$y1);

cat('----- error analysis -----\n');
df <- df[e1, ];
plot(df$X, df$Y, col=df$T, xlim=c(0, 320), ylim=c(0, 200));
} 

cat(rep('\n', 10)); main();