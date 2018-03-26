rm(list=ls());
set.seed(1977);

a <- c(1, 2, 3, 4);
b <- c(9, 8, 7, 6);

n <- 1000;

df <- as.data.frame(t(a));

for(k in 1:n) {
 vk <- rgamma(2, shape=0.05);
 df[k, ] <- cbind(a, b) %*% vk / sum(vk);
}

print(head(df));


