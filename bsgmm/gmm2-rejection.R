rm(list=ls());

set.seed(197);

GMM <- rbind(
 data.frame(mu=5, sigma=2, freq=0.2),
 data.frame(mu=30, sigma=2, freq=0.3),
 data.frame(mu=50, sigma=2, freq=0.5)
)

S1 <- 5*max(GMM$sigma);
X1 <- min(GMM$mu) - S1;
X2 <- max(GMM$mu) + S1;

print(GMM);

eval <- function(GMM, x) {
  s <- 0;

  for(k in 1:nrow(GMM)) {
     mk <- GMM$mu[k] - x;
     sk <- GMM$sigma[k] * GMM$sigma[k];
     wk <- GMM$freq[k];
     s <- s + wk*exp(-mk*mk/(2*sk) )/sqrt(2*pi*sk);
  }

  return(s);
}

n <- 20000;
X <- runif(n); X <- X1 * X + X2 * (1-X); 
Y <- runif(n);

sel <- rep(FALSE, n);
for(k in 1:n) {
  sel[k] <- Y[k] < eval(GMM, X[k]);
}

X <- X[sel];
hist(X, breaks=50);