rm(list=ls());

# install.packages('jpeg');
library(jpeg);

#download the zip file http://people.csail.mit.edu/torralba/code/spatialenvelope/spatial_envelope_256x256_static_8outdoorcategories.zip
#copy the files inside to the folder data-MITSE-2001 in your desktop
setwd(paste0(Sys.getenv("USERPROFILE"), "/Desktop/data-MITSE-2001"));

makeVector3 <- function(imf) {
  cat('--- processing', imf, '----\n'); 
  ik <- readJPEG(imf);

  rk <- mean(ik[, , 1]);
  gk <- mean(ik[, , 2]);
  bk <- mean(ik[, , 3]);

  return(c(rk, gk, bk));
}

X <- list.files(path='.', pattern=".jpg$");

#comment the line below if you want to see the full dataset
X <- head(X, 10);

df <- head( data.frame(avgR=1, avgG=2, avgB=3), 0);
for(k in 1:length(X)) {
 vk <- makeVector3(X[k]);
 df[k, 1:3] <- vk;
}

df <- cbind(df, FileName=X);
print(df);


