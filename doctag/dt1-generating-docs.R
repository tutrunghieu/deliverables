rm(list = ls());
set.seed(197);

makeCenters <- function() {
  src <- list(
    list(X=c(red=0.3, green=0.5, blue=0.2), Y='adjectives'),
    list(X=c(come=0.3, go=0.4, love=0.2, hate=0.1), Y='verbs'),
    list(X=c(this=0.5, that=0.5, here=0.6, there=0.3), Y='nouns') 
  );

  return(src);
}

makeObjects <- function(src) {
 wf <- paste0(Sys.getenv("USERPROFILE"),"/Desktop/data-AVN-feb04");
 if(! file.exists(wf) ) dir.create(wf);

 for(k in 1:1000) {
  rk <- sample(1:3, 1);
  Xk <- src[[rk]]$X;
  Yk <- src[[rk]]$Y;
  Lk <- sample(100:300, 1);
  Wk <- sample(names(Xk), Lk, prob=Xk, replace=TRUE);
  cat(Wk, file=paste0(wf, '/file', k, '-', Yk, '.txt') );
}

 return(0);
}

main <- function() {
 cf <- makeCenters();
 makeObjects(cf);
 cat('\n----THE END-------\n')
}

cat(rep('\n', 10)); main();
