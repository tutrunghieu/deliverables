rm(list = ls());
set.seed(197);

affine <- function(n, a, b) { 
 X <- runif(n); 
 return( a*X + b*(1-X) ); 
}

orthoSet <- function(n) {
 D1 <- data.frame(X1=affine(n, 100, 105), X2=runif(n), X3=runif(n));
 D2 <- data.frame(X1=runif(n), X2=affine(n, 200, 205), X3=runif(n));
 D3 <- data.frame(X1=runif(n), X2=runif(n), X3=affine(n, 300, 305));
 df <- rbind(D1, D2, D3);

 n <- nrow(df);
 df <- df[order(runif(n)), ];

 return(df);
}

nearest <- function(x, V) {
 nV <- nrow(V);
 d <- rep(NA, nV);
 for(k in 1:nV) { d[k] <- sum( abs(x - V[k, 1:3]) ); }
 p <- which.min(d);
 return(list( kmin=p, dmin=d[p] ));
}

kmeans.label <- function(df, V) {
 for(k in 1:nrow(df)) { 
    pk <- nearest(df[k, 1:3], V); 
    df$labels[k] <- pk$kmin;
    df$errors[k] <- pk$dmin; 
 }
 return(df);
}

kmeans.center <- function(df) {
  g <- split(df, df$labels);
  V <- NULL;
  for(gk in g) { V <- rbind(V, colMeans(gk)); }
  return(data.frame( V[, 1:3] ) );
}

main <- function() {
 cat('\n---- Dataset -------\n\n');
 df <- orthoSet(1000);
 print(head(df), row.names=F);

 cat('\n---- Vocab 1 -------\n\n');
 V1 <- data.frame(rbind(c(100, 0, 0), c(0, 200, 0), c(0, 0, 300)) );
 print(V1, row.names=FALSE); 

 for(k in 1:4) { 
  cat('\n---- Round ',k,'-------\n');
  df <- kmeans.label(df, V1);
  V1 <- kmeans.center(df);
  cat('total error:', mean(df$errors), max(df$errors), '\n');
 } 

 cat('\n----THE END-------\n')
}

cat(rep('\n', 20)); main();
