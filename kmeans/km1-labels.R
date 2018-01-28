nearest <- function(x, V) {
 nV <- nrow(V);
 d <- rep(NA, nV);
 for(k in 1:nV) { d[k] <- sum( abs(x - V[k, 1:3]) ); }
 return( which.min(d) );
}

label <- function(df, V) {
 for(k in 1:nrow(df)) { df$labels[k] <- nearest(df[k, 1:3], V); }
 return(df);
}
