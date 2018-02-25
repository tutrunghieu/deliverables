rm(list=ls()); 

# install.packages("e1071");
library(e1071);

set.seed(197);

main <- function() {
df <- iris;
x <- subset(df, select=-c(Species));
y <- subset(df, select=c(Species));

md <- svm(x, y, type='C', kernel='polynomial', degree=3);
# print(md);

y1 <- predict (md, subset(df, select=-c(Species))); 
e1 <- abs(y1 != df$Species);

sf <- data.frame(y=y, y1=y1, e1);
print(head(sf));
table(sf$y, sf$y1);
} 

cat(rep('\n', 10)); main();