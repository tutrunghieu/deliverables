rm(list=ls());
set.seed(197);

main <- function() {

n <- 1000;
U1 <- runif(n);
X1 <- ifelse(U1 < 0.25, "Apple", 
      ifelse(U1 < 0.5, "Berry", 
      ifelse(U1 < 0.75, "Cherry", 
      "Orange")));

U1 <- runif(n);
X2 <- ifelse(U1 < 0.25, "Apple", ifelse(U1 < 0.5, "Berry", ifelse(U1 < 0.75, "Cherry", "Orange")));

X3 <- sapply(X1, function(x) {
 U1 <- runif(1);
 if(x=='Apple') { ifelse(U1 < 1/3, "Cherry", ifelse(U1 < 2/3, "Berry", "Orange")); }
 else if(x=='Berry') { ifelse(U1 < 1/3, "Cherry", ifelse(U1 < 2/3, "Apple", "Orange")); }
 else if(x=='Cherry') { ifelse(U1 < 1/3, "Berry", ifelse(U1 < 2/3, "Apple", "Orange")); }
 else { ifelse(U1 < 1/3, "Cherry", ifelse(U1 < 2/3, "Apple", "Berry")); }
});


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
