rm(list=ls());

n <- 500;
Y <- 2000 + ceiling(5*runif(n));
M <- ceiling(12*runif(n));
D <- ceiling(31*runif(n)); 

df <- data.frame(D, M, Y);
# print(df, row.names=F);
# summary(df);

df$paste <- apply(df[, c(3, 2, 1)], 1, paste, collapse='-');
print(df, row.names=F);

df$sel <- try(as.Date(df$paste, format='%Y-%m-%d') );
print(df, row.names=F);


