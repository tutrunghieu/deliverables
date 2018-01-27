rm(list = ls());
set.seed(197);

shuffle <- function(df) {
 N <- nrow(df);
 df <- df[order(runif(N)), ];
 
 f <- 1:N < 0.7*N;
 g <- list(bigger=df[f, ], smaller=df[!f, ]);
 
 return(g);
}


trainTest <- function(g, tt) {
 cat('\n---- Round', tt, '-------\n');

 df <- g$bigger;
 md <- lm(Y ~ X, df);
 e1 <- abs(predict(md, df) - df$Y);
 cat('training:', nrow(df), sum(df$X), sum(df$Y), '-----', max(e1), '\n');

 df <- g$smaller;
 e1 <- abs(predict(md, df) - df$Y);
 cat('testing:', nrow(df), sum(df$X), sum(df$Y), '-----', max(e1), '\n');
}


main <- function() {
 df <- data.frame( X=seq(-50, 50, 0.1) );
 df$Y <- 123*df$X + 456 + runif(nrow(df));

 cat('\n---- dataset -------\n');
 print(head(df), row.names=F);

 N <- nrow(df);
 df <- df[order(runif(N)), ];

 nk <- 5;  
 for(k in 1:nk) { g <- shuffle(df); trainTest(g, k); }
 cat('\n----THE END-------\n')
}

cat(rep('\n', 10)); main();
