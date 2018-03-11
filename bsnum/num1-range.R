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

#----- age via normal
A3 <- round( rnorm(n, mean=35, sd=3) );

#----- age via mixture of gaussian
X1 <-  rnorm(n, mean=5, sd=2);
X2 <-  rnorm(n, mean=60, sd=5);
sel <- ifelse(runif()<0.7, 1, 0);
A4 <- X1*sel + X2*(1-sel);


#----- combining
df <- data.frame(Age.Range=A1, Age.Dir=A2, Age.Around=A3);
print(head(df), row.names=F);

#----- testing
hist(df$Age.Range, breaks=50);

dev.new();
hist(df$Age.Dir, breaks=50);

dev.new();
hist(df$Age.Around, breaks=50);

}

cat(rep('\n', 10)); main();
