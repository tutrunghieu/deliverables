rm(list=ls());

# install.packages('jpeg');
library(jpeg);

#download the zip file http://people.csail.mit.edu/torralba/code/spatialenvelope/spatial_envelope_256x256_static_8outdoorcategories.zip
#copy the files inside to the folder data-MITSE-2001 in your desktop
setwd(paste0(Sys.getenv("USERPROFILE"), "/Desktop/data-MITSE-2001"));


divide4 <- function(x1, y1, x2, y2) {
 xm <- floor((x1+x2)/2);
 ym <- floor((y1+y2)/2); 

 r00 <- c(x1=x1, y1=y1, x2=xm, y2=ym);
 r10 <- c(x1=x1, y1=ym+1, x2=xm, y2=y2);
 r01 <- c(x1=xm+1, y1=y1, x2=x2, y2=ym);
 r11 <- c(x1=xm+1, y1=ym+1, x2=x2, y2=y2);

 l <- list( r00, r01, r10, r11 );
# print(l);
 return(l);
}

makePyramid <- function(ik) {  
  res <- data.frame(x1=1,y1=1,x2=ncol(ik),y2=nrow(ik), level=1);

  j <- 1; t <- 2;
  while(nrow(res) < 1 + 2*2 + 4*4) {
    w <- res[j, ];
    l <- divide4(w$x1[1], w$y1[1], w$x2[1], w$y2[1]);
    for(lk in l) { res[t, ] <- c(lk, level=w$level[1]+1); t <- t + 1; }
    j <- j + 1;
  }

  return(res);  
}

makePyramidAvg <- function(img) {
  ik <- readJPEG(img);
  df <- makePyramid(ik);
  
  res <- c();
  for(k in 1:nrow(df)) {
    x1 <- df[k, "x1"];
    x2 <- df[k, "x2"];
    y1 <- df[k, "y1"];
    y2 <- df[k, "y2"];

    r <- mean( ik[x1:x2, y1:y2, 1] );
    g <- mean( ik[x1:x2, y1:y2, 2] );
    b <- mean( ik[x1:x2, y1:y2, 3] );
    res <- c(res, r, g, b);
  }

  return(res);  
}


main <- function() {
X <- list.files(path='.', pattern=".jpg$");

#comment the line below if you want to see the full dataset
X <- head(X, 10);

df <- NULL;
for(k in 1:length(X)) {
 vk <- makePyramidAvg(X[k]);
 df <- rbind(df, vk);
}
row.names(df) <- X;

df <- cbind(data.frame(df));
print(df[, c("X1", "X2", "X3", "X62", "X63")]);
} 

cat(rep('\n', 10)); main();