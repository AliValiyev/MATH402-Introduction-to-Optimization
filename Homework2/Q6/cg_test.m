% Author : Mustafa Kütük
%
% Description:
% This code part is the test routine of Conjugate Gradient method for 
% given inputs.
%
% Inputs:
% 
% matrix A(nxn)
% vector b(nx1)
% initial guess: x0 
% tolerance value for the termination condition: ||r_k|| < tol 
% maximum number of iteration: maxit 
%  
% Output :
% 
% a matrix X = [x0; x1; x2; ...] containing the whole iterations
% a vector res containing ||r_k||
% the number of iterations: it
% 
% Usage :
% 
% [X, res, it] = conj_grad(A, b, x0, tol, maxit)

n = [5, 8, 12, 20];
maxit = 1000;
tol = 1e-6;
for i=1:size(n,2)
    x0{i} = zeros(n(i),1);
    b{i} = ones(n(i),1);
end

for i=1:size(n,2)
    A{i} = create_Hilbert_matrix(n(i));
end

for i=1:size(n,2)
    [X{i}, res{i}, it{i}] = conj_grad(A{i}, b{i}, x0{i}, tol, maxit);
end

clc;
fprintf('  n |  iteration  |                x value                                         |    Norm of residual\n');
fprintf('----|-------------|----------------------------------------------------------------|--------------------\n');
fprintf(' 5  |    %1i        |   [%1.4f; %1.4f; %1.4f; %1.4f; %1.4f]          |  %1.10f \n',it{1},X{1}(:,end),res{1}(end));
fprintf(' 8  |    %1i       |   [%1.4f; %1.4f; %1.4f; %1.4f; %1.4f; \n', it{2},X{2}(1:5,end));
fprintf('    |             |    %1.4f; %1.4f; %1.4f]                      |  %1.10f \n', X{2}(6:8,end),res{2}(end));
fprintf(' 12 |    %1i       |   [%1.4f; %1.4f; %1.4f; %1.4f; %1.4f; \n', it{3},X{3}(1:5,end));
fprintf('    |             |    %1.4f; %1.4f; %1.4f; %1.4f;  \n', X{3}(6:9,end));
fprintf('    |             |    %1.4f; %1.4f; %1.4f]                    |  %1.10f \n', X{3}(10:12,end),res{3}(end));
fprintf(' 20 |    %1i       |   [%1.4f; %1.4f; %1.4f; %1.4f; %1.4f; \n', it{4},X{4}(1:5,end));
fprintf('    |             |    %1.4f; %1.4f; %1.4f; %1.4f; \n', X{4}(6:9,end));
fprintf('    |             |    %1.4f; %1.4f; %1.4f; %1.4f; \n', X{4}(10:13,end));
fprintf('    |             |    %1.4f; %1.4f; %1.4f; %1.4f; \n', X{4}(14:17,end));
fprintf('    |             |    %1.4f; %1.4f; %1.4f]                 |  %1.10f \n', X{4}(18:20,end),res{4}(end));



