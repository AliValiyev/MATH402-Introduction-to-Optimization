% Author : Mustafa Kütük
%
% Description:
% 
% This function applies Conjugate Gradient method to solve Ax=b.
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

function [X, res, it] = conj_grad(A, b, x0, tol, maxit)

k = 0;
r0 = A*x0-b;
p0 = -r0;
res(k+1) = norm(r0);
while (res(end) >= tol && k <= maxit)
    alpha(k+1) = (r0(:,k+1)'*r0(:,k+1))/(p0(:,k+1)'*A*p0(:,k+1));
    x0(:,k+2) = x0(:,k+1) + alpha(k+1)*p0(:,k+1);
    r0(:,k+2) = r0(:,k+1) + alpha(k+1)*A*p0(:,k+1);
    beta(k+1) = (r0(:,k+2)'*r0(:,k+2))/(r0(:,k+1)'*r0(:,k+1));
    p0(:,k+2) = -r0(:,k+2) + beta(k+1)*p0(:,k+1);
    res(k+2) = norm(r0(:,k+2));
    k = k+1;
end
X = x0;
it = k;

end