rm(list=ls());
set.seed(197);

main <- function() { 

cat('\n-----generating data----\n');
x <- runif(1000)*10;
y <- exp(0.123*x*x + 0.234*x + 0.345 + runif(1000)*1e-6);
df <- data.frame(x=x, y=y);
print(head(df));

cat('\n-----building model----\n');
df$x2 <- df$x * df$x;
df$logY <- log(df$y);
md <- lm(logY ~ x2 + x, df);
print(md);

cat('\n-----predict on old data----\n');
df$y1 <- exp( predict(md, df) );
df$e1 <- abs(df$y - df$y1);
print(head(df));

cat('\n-----THE END----\n');
}

tt <- main();