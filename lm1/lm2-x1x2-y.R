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
 md <- lm(Y ~ X1 + X2, df);

 cat('\n---- Model params ------\n');
 printCoef(md, c("c", "a", "b"));
 
 cat('\n---- Model errors -------\n');
 e1 <- abs(predict(md, df) - df$Y);
 cat('training --- ', nrow(df), sum(df$Y), '-----', max(e1), '\n');

 df <- g$smaller; 
 e1 <- abs(predict(md, df) - df$Y);
 cat('testing --- ', nrow(df), sum(df$Y), '-----', max(e1), '\n');
}

affine <- function(n, a, b) {
  X <- runif(n);
  return( a*X + b*(1-X) );
}

main <- function() {
 df <- data.frame( X1=affine(1000, -50, 50), X2=affine(1000, -3, 7) );
 df$Y <- 123*df$X1 + 456*df$X2 + 789 + runif(nrow(df));

 cat('\n---- Dataset -------\n');
 print(head(df), row.names=F);

 trainTest(shuffle(df), 1);

 cat('\n----THE END-------\n')
}

cat(rep('\n', 20)); main();
