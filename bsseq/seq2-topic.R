rm(list=ls());
set.seed(197);

makeDistVector <- function(V) {
 pV <- rgamma(length(V), shape=0.9);
 return(list( V=V, pV=pV / sum(pV) ));
}

makeTopicModel <- function() {
 TM <- list();
 TM[[1]] <- makeDistVector( c("red", "green", "blue", "black", "white") );
 TM[[2]] <- makeDistVector( c("love", "hate", "come", "go") );
 TM[[3]] <- makeDistVector( c("here", "there", "this", "that", "it") );

 for(t in TM) {
   cat('---------------\n');
   print(data.frame(V=t$V, pV=t$pV));
 }

 return(TM);
}

makeDataTable <- function(n, TM) {
L <- ceiling(10 + 7*runif(n));
X <- c();
Z <- sample(1:3, n, replace=T);
for(k in 1:n) {
  Zk <- TM[[ Z[k] ]];
  Xk <- sample(Zk$V, L[k], prob=Zk$pV, replace=TRUE);
  X[k] <- paste(Xk, collapse=' ');
}

 return( data.frame(L=L, Z=Z, X=X) );
}

TM <- makeTopicModel();
print( makeDataTable(1000, TM), row.names=F);