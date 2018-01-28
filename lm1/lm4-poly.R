rm(list = ls());
set.seed(197);

shuffle <- function(df) {
 N <- nrow(df);
 df <- df[order(runif(N)), ];
 
 f <- 1:N < 0.7*N;
 g <- list(bigger=df[f, ], smaller=df[!f, ]);
 
 return(g);
}

printCoef <- function(md, N) { 
  df <- coef(md);
  df <- data.frame(rbind(df));
  names(df) <- N;
  df <- df[, order(N)];
  print(df, row.names=FALSE);
}

trainTest <- function(g, tt) {
 df <- g$bigger; 
 df$X3 <- df$X*df$X*df$X; 
 df$X2 <- df$X*df$X; 
 md <- lm(Y ~ X3 + X2 + X, df);

 cat('\n---- Model params ------\n');
 printCoef(md, c("d", "a", "b", "c"));
 
 cat('\n---- Model errors -------\n');
 e1 <- abs(predict(md, df) - df$Y);
 cat('training --- ', nrow(df), sum(df$Y), '-----', max(e1), '\n');

 df <- g$smaller; 
 df$X3 <- df$X*df$X*df$X; 
 df$X2 <- df$X*df$X; 
 e1 <- abs(predict(md, df) - df$Y);
 cat('testing --- ', nrow(df), sum(df$Y), '-----', max(e1), '\n');
}


main <- function() {
 df <- data.frame( X=seq(-50, 50, 0.1) );
 df$Y <- 123*df$X*df$X*df$X + 234*df$X*df$X + 345*df$X + 456 + runif(nrow(df));

 cat('\n---- Dataset -------\n');
 print(head(df), row.names=F);

 trainTest(shuffle(df), 1);

 cat('\n----THE END-------\n')
}

cat(rep('\n', 20)); main();
