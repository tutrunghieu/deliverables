
df <- NULL;

M <- c(0, 0);
V <- rbind(
  c(2, -1),
  c(-1, 5)
);

for(k in 1:5000) {
 vk <- M + V %*% rnorm(2);
 df <- rbind(df, t(vk));
}

df <- data.frame(df);
print(head(df));

plot(df$X1, df$X2);
