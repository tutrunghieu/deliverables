rm(list=ls());
set.seed(197);

n <- 9000;

df <- data.frame(U=runif(n));

for(k in 1:9) df[, paste0('X', k)] <- rgamma(n, shape=k/10);
for(k in 1:9) df[, paste0('X0', k)] <- rgamma(n, shape=k/100);
for(k in 1:9) df[, paste0('X00', k)] <- rgamma(n, shape=k/1000);



df$U <- NULL;
print(head(df));

dev.off();
hist(df$X1, breaks=50);

dev.new();
hist(df$X5, breaks=50);

dev.new();
hist(df$X9, breaks=50);

