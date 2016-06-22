function A = symmetric_PD_matrix(n)

Q = randn(n,n);

eigen_mean = 2; 
% can be made anything, even zero 
% used to shift the mode of the distribution

A = Q' * diag(abs(eigen_mean+randn(n,1))) * Q;

return 