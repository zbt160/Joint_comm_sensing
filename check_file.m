% % Define a matrix
% A = [1 2 3; 4 5 6; 7 8 9];
% 
% % Compute the SVD of the matrix
% [U, S, V] = svd(A);
% 
% % Compute the rank-1 approximation of the matrix
% A_rank1 = S(1,1) * U(:,1) * V(:,1)';
% 
% % Display the original and rank-1 approximation matrices
% disp('Original matrix:');
% disp(A);
% disp('Rank-1 approximation:');
% disp(A_rank1);



% Define a square matrix A
A = [2 1 1; 1 2 1; 1 1 2];

% Compute the Cholesky decomposition of A
L = chol(A, 'lower');

% Extract the vector a from the Cholesky decomposition
a = L(:,1);

% Compute A as the product of a and its Hermitian transpose
A_decomp = a * a';

% Display the original matrix and the decomposition
disp('Original matrix:');
disp(A);
disp('Decomposed matrix:');
disp(A_decomp);