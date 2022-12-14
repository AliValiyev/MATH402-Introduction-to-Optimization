% Author : Mustafa Kütük
%
% Description:
% 
% This function applies Newton's method with Armijo's conditions to a 
% given function.
%
% Inputs:
% 
% objective function: fhandle 
% initial guess: x0 
% tolerance value for the termination condition: ||∇f(xk)|| < tol 
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
% the number of iterations: ite.
% 
% Usage :
% 
% [X, Grad, it] = Newton_armijo(fhandle, x0, tol, maxit, alpha0, c, mu, amax)

function [X, Grad, it] = Newton_armijo(fhandle, x0, tol, maxit, alpha0, c, mu, amax)

k = 0;
[f, grad_f, hessian_f] = fhandle(x0(:,k+1));
Grad = norm(grad_f);
while (norm(grad_f) >= tol && k <= maxit)
    [f, grad_f, hessian_f] = fhandle(x0(:,k+1));
    p(:,k+1) = -inv(hessian_f) * grad_f;
    alpha = armijo(fhandle, x0(:, k+1), p(:,k+1), alpha0, c, mu, amax);
    x0(:,k+2) = x0(:,k+1) + alpha*p(:,k+1);
    [f, grad_f, hessian_f] = fhandle(x0(:,k+2));
    Grad(k+2) = norm(grad_f);
    k = k + 1;
end
X = x0;
it = k;

end