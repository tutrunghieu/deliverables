#download the zip file http://people.csail.mit.edu/torralba/code/spatialenvelope/spatial_envelope_256x256_static_8outdoorcategories.zip
#copy the files inside to the folder data-MITSE-2001 in your desktop

rm(list=ls());
setwd(paste0(Sys.getenv("USERPROFILE"), '/Desktop'));
set.seed(197);

source(paste0( Sys.getenv("USERPROFILE"), '/git/sharing/imclust/km1-feature-sel.R' ));
source(paste0( Sys.getenv("USERPROFILE"), '/git/sharing/imclust/km2-rendering-groups.R' ));

# install.packages('jpeg');
library(jpeg);


global <- list(
 image.folder=paste0(Sys.getenv("USERPROFILE"), "/Desktop/data-MITSE-2001"),
 model.folder=paste0(Sys.getenv("USERPROFILE"), "/Desktop/data-MITSE-2001-clust"),
 feature.file=paste0(Sys.getenv("USERPROFILE"), "/Desktop/data-MITSE-2001-clust/data-MITSE.csv"),
 model.file=paste0(Sys.getenv("USERPROFILE"), "/Desktop/data-MITSE-2001-clust/data-MITSE.rdata"), 
 result.file=paste0(Sys.getenv("USERPROFILE"), "/Desktop/data-MITSE-2001-clust/data-MITSE.html") 
);


loadData <- function(f) {
if( file.exists(f) ) return(read.csv(f));

X <- list.files(path=fd, pattern=".jpg$");

#comment the line below if you want to see the full dataset
# X <- head(X, 500);

df <- NULL;
for(k in 1:length(X)) {
 vk <- makePyramidAvg(X[k]);
 df <- rbind(df, vk);
}
row.names(df) <- X;

df <- cbind(data.frame(df));
write.csv(df, f);
return(df);
}


main <- function() {
df <- loadData(global$feature.file);
print(df[, c("X1", "X2", "X3", "X62", "X63")]);

md <- kmeans(df[, 2:ncol(df)], 15, nstart=1, iter.max=20); 
df$label <- md$cluster;

renderPage(df, global$result.file);
} 

cat(rep('\n', 10)); main();