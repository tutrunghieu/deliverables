rm(list=ls());
set.seed(197);

makeDistVector <- function(V) {
 pV <- rgamma(length(V), shape=0.9);
 return(list( V=V, pV=pV / sum(pV) ));
}

makeLanguageModel <- function() {
 LM <- list();
 LM[["*"]] <- makeDistVector( c("I", "we", "they") );

 LM[["I"]] <- makeDistVector( c("like", "love", "want") );
 LM[["we"]] <- makeDistVector( c("want", "like") );
 LM[["they"]] <- makeDistVector( c("love", "need") );

 LM[["like"]] <- makeDistVector( c("it", "you", "them") );
 LM[["love"]] <- makeDistVector( c("it", "you", "them") );
 LM[["want"]] <- makeDistVector( c("it", "you", "them") );
 LM[["need"]] <- makeDistVector( c("it", "you", "them") );

 LM[["it"]] <- makeDistVector( c("all", "more", "too") );


 for(t in LM) {
   cat('---------------\n');
   print(data.frame(V=t$V, pV=t$pV));
 }

 return(LM);
}

sampleWords <- function(n, TM) {
  X <- c();

  for(k in 1:n) {
    if(k==1) { Zk <- TM[['*']]; } else { Zk <- TM[[ X[k-1] ]]; }
    if( is.null(Zk) ) break;
    X[k] <- sample(Zk$V, 1, prob=Zk$pV, replace=TRUE);     
  }

  return(X);
}

makeDataTable <- function(n, TM) {
 X <- c();

for(k in 1:n) {
  Xk <- sampleWords(5, TM);
  X[k] <- paste(Xk, collapse=' ');
}

 return( data.frame(X=X) );
}

LM <- makeLanguageModel();
print( makeDataTable(1000, LM), row.names=F);
