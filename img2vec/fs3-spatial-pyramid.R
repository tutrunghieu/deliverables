#install.packages('caret');
#library(caret);

install.packages('jpeg');
library(jpeg);

setwd('C:/Users/henrytu/Desktop/data-MITSE-2001');

ik <- readJPEG('coast_arnat59.jpg');
print(dim(ik));

