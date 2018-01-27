rm(list = ls());
set.seed(197);

main <- function() {
 df <- data.frame( X=seq(-50, 50, 0.1) );
 df$Y <- 123*df$X + 456 + runif(nrow(df));

 cat('\n---- dataset -------\n');
 print(head(df), row.names=F);

 g <- split(df, runif(nrow(df))<0.7);

 cat('\n---- training -------\n');
 df <- g$`FALSE`; cat('training:', nrow(df), sum(df$X), sum(df$Y), '\n');
 print(head(df), row.names=F);


 cat('\n---- testing -------\n');
 df <- g$`TRUE`; cat('testing:', nrow(df), sum(df$X), sum(df$Y), '\n');
 print(head(df), row.names=F);


 cat('\n----THE END-------\n')
}

cat(rep('\n', 10)); main();
