gpuDevice(2);
%Generate a 10000 x 10000 matrix of random numbers from normal distribution.
fprintf('Generating a 10000 x 10000 matrix of random numbers from normal distribution.\n')
tic; X1 = randn(10000, 'gpuArray'); toc;


% Matrix inverse
fprintf('Matrix inverse: ');
tic; Y = inv(X1); toc;


% Solving linear system
fprintf('Solving linear system: ');
b = randn(10000, 1, 'gpuArray');
tic; Y = X1\b; toc;


% Matrix factorisation
fprintf('LU decomposition: ');
tic; [Y1, Y2] = lu(X1); toc;

fprintf('QR decomposition: ');
tic; [Y1, Y2] = qr(X1); toc;

fprintf('SVD decomposition: ');
tic; Y = svd(X1); toc;

fprintf('Eigen-decomposition: ');
tic; Y = eig(X1); toc;

fprintf('Cholesky decomposition: ');
X2 = symmetric_PD_matrix(10000);
X2 = gpuArray(X2);
tic; Y = chol(X2); toc;


% Others
fprintf('Matrix Multiplication: ');
tic; X1 * X2; toc;      % Matrix Multiplication

reset(gpuDevice(2));
fprintf('Matrix square root for 5000 x 5000 matrix: ');
X3 = randn(5000, 'gpuArray');
tic; Y = sqrt(complex(X3)); toc;  % Matrix square root

b = randn(10000, 1, 'gpuArray');
fprintf('Fast Fourier Transform: ');
tic; b2 = fft(b); toc;   % Fast Fourier Transform

fprintf('Inverse Fast Fourier Transform: ');
tic; b = ifft(b2); toc;  % Inverse Fast Fourier Transform