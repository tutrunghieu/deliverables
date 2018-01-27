rm(list = ls());
set.seed(197);

main <- function() {
 df <- data.frame( X=seq(-50, 50, 0.1) );
 df$Y <- 123*df$X + 456 + runif(nrow(df));

 cat('\n---- dataset -------\n');
 print(head(df), row.names=F);

 f <- runif(nrow(df));
 f <- sapply(f, function(x) { if(x<0.7) {"bigger"} else {"smaller"} });
 g <- split(df, f);

 cat('\n---- training/bigger -------\n');
 df <- g$bigger; cat('training:', nrow(df), sum(df$X), sum(df$Y), '\n');
 print(head(df), row.names=F);


 cat('\n---- testing/smaller -------\n');
 df <- g$smaller; cat('testing:', nrow(df), sum(df$X), sum(df$Y), '\n');
 print(head(df), row.names=F);


 cat('\n----THE END-------\n')
}

cat(rep('\n', 10)); main();
