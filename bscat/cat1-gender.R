rm(list=ls());
set.seed(197);

main <- function() {

#----- gender
n <- 1000;
G <- ifelse(runif(n)<0.7, "Male", "Female");

#----- role
U <- runif(n);
R <- ifelse(U<0.15, "Director", ifelse(U<0.15+0.3, "Manager", "Worker"));

#----- job title
nX <- c("Engineer", "Business", "Admin", "Driver", "Cleaner");
pX <- c(3, 4, 5, 2, 7); pX <- pX / sum(pX);
P <- sample(nX, prob=pX, size=n, replace=TRUE);  

#----- combining
df <- data.frame(Gender=G, Role=R, Profession=P);
print(head(df));

#----- testing
print( table(df$Gender) );
print( table(df$Role) );
print( table(df$Profession) );
}

main();
