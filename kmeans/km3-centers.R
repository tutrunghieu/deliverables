kmeans.center <- function(df) {
  g <- split(df, df$labels);
  V <- NULL;
  for(gk in g) { V <- rbind(V, colMeans(gk)); }
  return(data.frame( V[, 1:3] ) );
}

