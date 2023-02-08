% Author : Mustafa Kütük
%
% Description:
% 
% This function applies Symmetric Rank-1 Inverse Update method with 
% Armijo's conditions to a given function.
%
% Inputs:
% 
% objective function: fhandle 
% initial guess: x0 
% tolerance value for the termination condition: ||∇f(xk)|| < tol 
% initial inverse matrix: H0
% maximum number of iteration: maxit 
% initial step–length: alpha0 
% Armijo constant: c 
% backtracking parameter: mu
% maximum number of iterations for Armijo iteration: amax 
% 
% Output :
% 
% a matrix X = [x0; x1; x2; ...] containing the whole iterations
% a matrix Grad containing ||∇f(xk)||
% the number of iterations: it
% 
% Usage :
% 
% [X, Grad, it] = SR1_inverse(fhandle, x0, tol, H0, maxit, alpha0, c, mu, amax)

function [X, Grad, it] = SR1_inverse(fhandle, x0, tol, H0, maxit, alpha0, c, mu, amax)

k = 0;
[f, grad_f, hessian_f] = fhandle(x0(:,k+1));
Grad = norm(grad_f);
while (norm(grad_f) >= tol && k <= maxit)
    p(:,k+1) = -H0 * grad_f;
    alpha = armijo(fhandle, x0(:, k+1), p(:,k+1), alpha0, c, mu, amax);
    x0(:,k+2) = x0(:,k+1) + alpha*p(:,k+1);
    s(:,k+1) = x0(:,k+2) - x0(:,k+1);
    grad_old = grad_f;
    [f, grad_f, hessian_f] = fhandle(x0(:,k+2));
    y(:,k+1) = grad_f - grad_old;
    Grad(k+2) = norm(grad_f);
    H0 = H0 + ((s(:,k+1)-H0*y(:,k+1))*(s(:,k+1)-H0*y(:,k+1))')/((s(:,k+1)-H0*y(:,k+1))'*y(:,k+1));
    k = k + 1;
end
X = x0;
it = k;

end