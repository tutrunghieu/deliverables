rm(list=ls());

D <- ceiling( 365*runif(100) );
D <- as.Date("2010-1-1") + D;

df <- data.frame(
 date1=as.Date(D), 
 date2=as.Date(D) + 14
);

print(df, row.names=F);