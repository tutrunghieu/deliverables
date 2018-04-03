
makeGammaSel <- function(a = 0.123) {

 a <- strsplit(as.character(a), '');
 a <- unlist(a);
 a <- a[seq_along(a)>2];

 X <- 'X';
 for(k in seq_along(a)) {
   a[k] <- paste0(X, a[k]);
   X <- paste0(X, '0');
 }

 return(a);
}

makeGammaSel(0.192);