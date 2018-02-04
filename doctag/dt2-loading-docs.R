rm(list = ls());
set.seed(197);

#################
# loading data
makeDataFrame <- function() {
 wf <- paste0(Sys.getenv("USERPROFILE"),"/Desktop/data-AVN-feb04");
 setwd(wf);

 items <- list.files(wf); 

 df <- data.frame();
 for(ik in items) {
#  cat('------', ik, '-----------\n');
   lk <- strsplit(readChar(ik, nchars=1e6), " ");
   ck <- table(lk);
   ck <- ck / sum(ck);

   k <- nrow(df) + 1;
   df[k, '_FN_'] <- ik;
   for(j in names(ck)) df[k, j] <- ck[j];
 }
 
 df[is.na(df) ] <- 0;
 return(df);
}

#################
# main function
main <- function() { 
  cat('\n---- data table -------\n')
  df <- makeDataFrame();
  print(head(df));

  cat('\n---- kmeans center -------\n')
  df[, "_FN_"] <- NULL; 
  md <- kmeans(df, 3);
  print(md$centers); 
 
 cat('\n----THE END-------\n')
}

cat(rep('\n', 10)); main();
