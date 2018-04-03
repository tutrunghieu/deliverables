rm(list=ls());

D <- c();

for(y in 2015:2017) 
for(m in 1:12) 
{
 k <- length(D) + 1;
 D[k] <- paste0(y, '-', m, '-1');
}

df <- data.frame(
 date1=as.Date(D), 
 date2=as.Date(D) + 14
);

print(df, row.names=F);