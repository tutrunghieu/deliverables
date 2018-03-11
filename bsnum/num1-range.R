rm(list=ls());
set.seed(197);

main <- function() {

#----- age in range
n <- 5000;
U1 <- runif(n);
A1 <- round(U1 * 18 + (1-U1) * 80);

#----- age via dirichlet
G1 <- rgamma(n, shape=0.2);
G2 <- rgamma(n, shape=0.4);
A2 <- round( (G1 * 18 + G2 * 80) / (G1 + G2) );


#----- combining
df <- data.frame(Age.Range=A1, Age.Dirichlet=A2);
print(head(df), row.names=F);

#----- testing
hist(df$Age.Range, breaks=50);

dev.new();
hist(df$Age.Dirichlet, breaks=50);


}

cat(rep('\n', 10)); main();
