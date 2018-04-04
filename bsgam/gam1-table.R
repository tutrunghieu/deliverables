rm(list=ls());
set.seed(197);


makeGammaTable <- function(n=9000) {
 df <- data.frame(U=runif(n));

 for(k in 1:9) df[, paste0('X', k)] <- rgamma(n, shape=k/10);
 for(k in 1:9) df[, paste0('X0', k)] <- rgamma(n, shape=k/100);
 for(k in 1:9) df[, paste0('X00', k)] <- rgamma(n, shape=k/1000);

 df$U <- NULL;
 return(df);
}

df <- makeGammaTable();
file1 <- paste0(Sys.getenv("USERPROFILE"),"/Desktop/gamma-samples.csv");
write.csv(df, file1, row.names=F);

print(head(df[, 1:9]), row.names=F);