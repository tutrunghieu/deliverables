rm(list=ls());
set.seed(197);

rcat <- function(n, X, P) {

C <- P;
for(k in 2:length(C)) C[k] <- C[k] + C[k-1];
# print(C);

res <- c();
U <- runif(n);
for(k in 1:n) {
  Uk <- U[k];
  rk <- which(Uk < C);
  res[k] <- X[ rk[1] ];
}

return(res);
}

main <- function() {

nX <- c("Engineer", "Business", "Admin", "Driver", "Cleaner");
pX <- c(3, 4, 5, 2, 7); pX <- pX / sum(pX);
C1 <- rcat(1000, nX, pX);  


nX <- c("Alice", "Bob", "Cody");
pX <- c(0.3, 0.2, 0.5); pX <- pX / sum(pX);
C2 <- rcat(1000, nX, pX);  

print( head( data.frame(Cat1=C1, Cat2=C2)) );
print( table(C1) );
print( table(C2) );
}

main();
