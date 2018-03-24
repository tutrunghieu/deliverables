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

sampleWords <- function(n, Zk, TM) {
  T <- sample(1:length(Zk), n, replace=T, prob=Zk);
  X <- c();
  for(k in seq_along(T)) {
    tk <- T[k];
    Zk = TM[[tk]];
    X[k] <- sample(Zk$V, 1, prob=Zk$pV, replace=TRUE);
  }
  return(X);
} 

makeDataTable <- function(n, TM) {
 L <- ceiling(10 + 7*runif(n));
 Z <- c();
 X <- c();

for(k in 1:n) {
  Zk <- rgamma(length(TM), shape=0.05);
  Zk <- Zk / sum(Zk);
  Xk <- sampleWords(L[k], Zk, TM);

  Z[k] <- paste(Zk, collapse=' ');
  X[k] <- paste(Xk, collapse=' ');
}

 return( data.frame(L=L, Z=Z, X=X) );
}

TM <- makeTopicModel();
print( makeDataTable(1000, TM), row.names=F);