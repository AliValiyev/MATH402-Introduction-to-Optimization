% Author : Mustafa Kütük
%
% Description:
% This function applies Newton's method to a given function.
%
% Inputs:
% 
% f : a user supplied function
% x_0 : initial guess
% tol : a positive real number (the stopping tolerance)
% maxit: a positive integer specifying the max number of iterations allowed.
% 
% Output :
% 
% x : approximate solution to f(x) = 0
% hist : an array (a vector) of the values of x_k
% hist_err : an array (a vector) of the error, i.e., x^* - x_k
% iter : the number of iterations taken
% 
% Usage :
% 
% [x, hist, hist_err, iters] = Newton(f, x_0, tol, maxit) 

function [x, hist, hist_err, iters] = Newton(f1, x_0, tol, maxit) 

hist(1) = x_0;
hist_err(1) = 1 - x_0;
iters = 1;
while (abs(f(x_0)) > tol && iters < maxit)
    [f1, df1] = f(x_0);
    x_0 = x_0 - (f1./df1);
    iters = iters + 1;
    hist(iters) = x_0;
    hist_err(iters) = 1 - x_0;
end
x = x_0;


end