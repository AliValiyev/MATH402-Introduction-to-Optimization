% Author : Mustafa Kütük
%
% Description:
% This code part test routine of Newton's method to a given function.
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

x_0 = 1.8;
f1 = f(x_0);
maxit = 1000;
tol1 = 1e-3;
tol2 = 1e-6;
tol3 = 1e-9;

[x1, hist1, hist_err1, iters1] = Newton(f1, x_0, tol1, maxit);
[x2, hist2, hist_err2, iters2] = Newton(f1, x_0, tol2, maxit);
[x3, hist3, hist_err3, iters3] = Newton(f1, x_0, tol3, maxit);


clc;
fprintf('  Tol | iteration  |      x value       |    error\n');
fprintf('----- |------------|--------------------|--------------\n');
fprintf(' 1e-3 |    %1i      |   %1.12f   |  %1.12f \n',iters1,x1,hist_err1(end));
fprintf(' 1e-6 |    %1i      |   %1.12f   |  %1.12f \n',iters2,x2,hist_err2(end));
fprintf(' 1e-9 |    %1i      |   %1.12f   |  %1.12f \n',iters3,x3,hist_err3(end));





