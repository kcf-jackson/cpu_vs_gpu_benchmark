rm(list = ls())

CPU_benchmark <- function(n) {
	benchmark_labels <- c("Generate Matrix", "SVD", "QR", "Inverse", "Cholesky", "Multiplication")
	time_vec <- seq_along(benchmark_labels)
	#CPU
	time_vec[1] <- system.time({A <- matrix(rnorm(n^2), n, n)})[3]
	time_vec[2] <- system.time({A_svd <- svd(A)})[3]
	time_vec[3] <- system.time({A_qr <- qr(A)})[3]
	time_vec[4] <- system.time({A_inv <- solve(A)})[3]
	A2 <- clusterGeneration::genPositiveDefMat(n)$Sigma
	time_vec[5] <- system.time({A_chol <- chol(A2)})[3]
	B <- matrix(rnorm(n^2), n, n)
	time_vec[6] <- system.time({C <- A %*% B})[3]
	names(time_vec) <- benchmark_labels
	time_vec
}

GPU_benchmark <- function(n) {
	benchmark_labels <- c("Generate Matrix", "SVD", "QR", "Inverse", "Cholesky", "Multiplication")
	time_vec <- seq_along(benchmark_labels)
	library(gmatrix)
	time_vec[1] <- system.time({A <- gmatrix(grnorm(n^2), n, n)})[3]
	time_vec[2] <- system.time({A_svd <- svd(A)})[3]
	time_vec[3] <- system.time({A_qr <- qr(A)})[3]
	time_vec[4] <- system.time({A_inv <- solve(A)})[3]
	A2 <- clusterGeneration::genPositiveDefMat(n)$Sigma
	A2 <- as.gmatrix(A2)
	time_vec[5] <- system.time({A_chol <- chol(A2)})[3]
	B <- gmatrix(grnorm(n^2), n, n)
	C <- gmatrix(grnorm(n^2), n, n)
	time_vec[6] <- system.time({gmm(A, B, C)})[3]	
	names(time_vec) <- benchmark_labels
	time_vec
}


benchmark_labels <- c("Generate Matrix", "SVD", "QR", "Inverse", "Cholesky", "Multiplication")
cpu_time_vec <- gpu_time_vec <- seq_along(benchmark_labels)

n <- 1000;
iter <- 10;

library(magrittr)
CPU_matrix_cal <- purrr::map(rep(n, iter), CPU_benchmark) %>% do.call(rbind, .)
GPU_matrix_cal <- purrr::map(rep(n, iter), GPU_benchmark) %>% do.call(rbind, .)

