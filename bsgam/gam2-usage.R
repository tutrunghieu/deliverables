rm(list=ls());
set.seed(197);


makeGammaSel <- function(a = 0.123) {

 a <- strsplit(as.character(a), '');
 a <- unlist(a);
 a <- a[seq_along(a)>2];

 X <- 'X';
 sel <- rep(0, length(a));
 for(k in seq_along(a)) {
   sel[k] <- a[k] == '0';
   a[k] <- paste0(X, a[k]);
   X <- paste0(X, '0');
 }

 return(a[!sel]);
}

file1 <- paste0(Sys.getenv("USERPROFILE"),"/Desktop/gamma-samples.csv");
gt <- read.csv(file1);

print(head(df), row.names=F);

rgamma.TAB <- function(n, shape=0.1) { 
 rows <- ceiling(nrow(gt) * runif(n)); 
 cols <- makeGammaSel(shape);
 df <- gt[rows, cols];
 df$sum <- rowSums(df);
 print(head(df), row.names=F);

 return(df$sum);
}

X <- rgamma.TAB(1000, shape=0.309);
