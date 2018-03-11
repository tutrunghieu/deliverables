rm(list=ls());
set.seed(197);

main <- function() {

n <- 1000;
U3 <- U1 <- runif(n);
X1 <- ifelse(U1 < 0.25, "Apple", 
      ifelse(U1 < 0.5, "Berry", 
      ifelse(U1 < 0.75, "Cherry", 
      "Orange")));

U1 <- runif(n);
X2 <- ifelse(U1 < 0.25, "Apple", ifelse(U1 < 0.5, "Berry", ifelse(U1 < 0.75, "Cherry", "Orange")));

U1 <- 1 - U3;
X3 <- ifelse(U1 < 0.25, "Apple", 
      ifelse(U1 < 0.5, "Berry", 
      ifelse(U1 < 0.75, "Cherry", "Orange")));


#----- combining
df <- data.frame(Slot1=X1, Slot2=X2, Slot3=X3);
print(head(df, 20),  row.names=F);

#----- testing
wf <- df[X1==X2 & X2==X3, ];
cat('\n---winning----\n');
cat(nrow(wf)/n, 1/(4*4));


#----- testing
cat('\n\n');
print( table(X1) );
print( table(X2) );
print( table(X3) );
}

cat(rep('\n', 10)); main();
