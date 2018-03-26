rm(list=ls());


Year <- 2015:2020;
n <- length(Year);

ak <- rgamma(n, shape=40);
bk <- rgamma(n, shape=30);
ck <- rgamma(n, shape=10);

df <- data.frame(Apple=ak, Samsung=bk, Other=ck);
for(k in 1:nrow(df)) {
  ck <- unlist(df[k, ]);
  df[k, ] <- df[k, ] / sum(ck); 
}

df$Year <- Year;
print(df);