rm(list=ls());
set.seed(197);

main <- function() {
n <- 1000;
G <- ifelse(runif(n)<0.7, "Male", "Female");

U <- runif(n);
R <- ifelse(U<0.15, "Director", ifelse(U<0.15+0.3, "Manager", "Worker"));



df <- data.frame(Gender=G, Role=R);
print(head(df));

print( table(df$Gender) );
print( table(df$Role) );
}

main();
