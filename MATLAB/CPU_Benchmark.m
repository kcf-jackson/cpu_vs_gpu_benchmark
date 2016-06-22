%Generate a 10000 x 10000 matrix of random numbers from normal distribution.
fprintf('Generating a 10000 x 10000 matrix of random numbers from normal distribution.\n')
tic; X1 = randn(10000); toc;


% Matrix inverse
fprintf('Matrix inverse: ');
tic; Y = inv(X1); toc;
% Solving linear system
fprintf('Solving linear system: ');
b = randn(10000, 1);
tic; Y = X1\b; toc;


% Matrix factorisation
fprintf('LU decomposition: ');
tic; Y = lu(X1); toc;

fprintf('QR decomposition: ');
tic; Y = qr(X1); toc;

fprintf('SVD decomposition: ');
tic; Y = svd(X1); toc;

fprintf('Eigen-decomposition: ');
tic; Y = eig(X1); toc;

fprintf('Cholesky decomposition: ');
X2 = symmetric_PD_matrix(10000);
tic; Y = chol(X2); toc;


% Others
fprintf('Matrix Multiplication: ');
tic; X1 * X2; toc;      % Matrix Multiplication

fprintf('Matrix square root: ');
tic; Y = sqrt(X1); toc;  % Matrix square root

fprintf('Fast Fourier Transform: ');
tic; b2 = fft(b); toc;   % Fast Fourier Transform

fprintf('Inverse Fast Fourier Transform: ');
tic; b = ifft(b2); toc;  % Inverse Fast Fourier Transform