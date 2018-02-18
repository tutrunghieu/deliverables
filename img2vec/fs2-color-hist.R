rm(list=ls());

# install.packages('jpeg');
library(jpeg);

#download the zip file http://people.csail.mit.edu/torralba/code/spatialenvelope/spatial_envelope_256x256_static_8outdoorcategories.zip
#copy the files inside to the folder data-MITSE-2001 in your desktop
setwd(paste0(Sys.getenv("USERPROFILE"), "/Desktop/data-MITSE-2001"));

makeVector4096 <- function(img) {
  ik <- readJPEG(img);

  rk <- c(255*ik[, , 1]);
  gk <- c(255*ik[, , 2]);
  bk <- c(255*ik[, , 3]);

  V <- rep(0, 4096);

  for(k in 1:length(rk)) {
     r <- floor(rk[k]/16); 
     g <- floor(gk[k]/16); 
     b <- floor(bk[k]/16);
     cat(r, g, b, '\n'); 
     tk <- r + g*16 + b*256; 
     V[tk] <- V[tk] + 1; 
  }

  return(V);
}

main <- function() {
X <- list.files(path='.', pattern=".jpg$");

#comment the line below if you want to see the full dataset
X <- head(X, 10);

df <- NULL;
for(k in 1:length(X)) {
 vk <- makeVector4096(X[k]);
 df <- rbind(df, vk);
}
row.names(df) <- X;

df <- cbind(data.frame(df));
print(df[, c("X1", "X2", "X3", "X4095", "X4096")]);
} 

cat(rep('\n', 10)); main();