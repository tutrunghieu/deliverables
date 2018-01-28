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
