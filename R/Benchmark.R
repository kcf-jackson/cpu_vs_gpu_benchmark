n <- 1000;

#CPU
system.time({A <- matrix(rnorm(n^2), n, n)})
system.time({A_svd <- svd(A)})
system.time({A_qr <- qr(A)})
system.time({A_inv <- solve(A)})
A2 <- clusterGeneration::genPositiveDefMat(n)$Sigma
system.time({A_chol <- chol(A2)})
B <- matrix(rnorm(n^2), n, n)
system.time({C <- A %*% B})


#GPU
library(gmatrix)
system.time({A <- gmatrix(grnorm(n^2), n, n)})
system.time({A_svd <- svd(A)})
system.time({A_qr <- qr(A)})
system.time({A_inv <- solve(A)})
A2 <- as.gmatrix(A2)
system.time({A_chol <- chol(A2)})
B <- as.gmatrix(B)
C <- as.gmatrix(C)
system.time({gmm(A, B, C)})
