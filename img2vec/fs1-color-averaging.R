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
df <- data.frame(FileName=X);

for(k in 1:nrow(df)) {
 vk <- makeVector3(df$FileName[k]);
# df$avgR[k] <- vk[1]; 
# df$avgG[k] <- vk[2]; 
# df$avgB[k] <- vk[3]; 
}


