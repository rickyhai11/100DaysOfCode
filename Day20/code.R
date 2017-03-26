library(plyr)
library(mixAK)
# trace function
tr <- function(X) sum(diag(X))

# random matrix type 1
rmat_1 <- function(n=3, p=3, min=-1, max=1){
  matrix(runif(n*p, min, max), ncol=p)
}

# random matrix type 2, sparse
rmat_2 <- function(p=3) {
  diag(p)[, sample(1:p, p)]
}

# generate random rotation matrix Q. Based on Q find 
# optimal scaling factor c and calculate loss function value
#
one_sample <- function(n=2, p=2)
{
  Q <- mixAK::rRotationMatrix(n=1, dim=p) %*%         # random rotation matrix det(Q) = 1
    diag(sample(c(-1,1), p, rep=T))                   # additional reflections, so det(Q) in {-1,1}
  s <- tr( t(Q) %*% t(A1) %*% B1 ) / norm(A1, "F")^2  # scaling factor c
  rss <- norm(s*A1 %*% Q - B1, "F")^2 +               # get residual sum of squares
    norm(A2 %*% Q - B2, "F")^2 
  c(s=s, rss=rss)
}

# find c and rss or many random rotation matrices
#
set.seed(10)  # nice case for 3 x 3
n <- 3
p <- 3
A1 <- round(rmat_1(n, p), 1)
B1 <- round(rmat_1(n, p), 1)
A2 <- rmat_2(p)
B2 <- rmat_2(p)

x <- plyr::rdply(40000, one_sample(3,3)) 
plot(x$s, x$rss, pch=16, cex=.4, xlab="c", ylab="L(Q)", col="#00000010")
