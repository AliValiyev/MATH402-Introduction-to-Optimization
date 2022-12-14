% Author : Mustafa Kütük
%
% Description:
% 
% This function is written for the Rosenbrock function. It returns function
% value, gradient of the function and the Hessian of the function.
%
% Inputs:
% 
% x: Input point
% 
% Output :
% 
% f: function value
% df: gradient of the function
% Hess: Hessian of the function
% 
% Usage :
% 
% [f, df, Hess] = Rosenbrock(x)

function [f, df, Hess] = Rosenbrock(x)

f = 100 * (x(2) - x(1) .^ 2) ^ 2 + (1 - x(1)) ^ 2;
df = [100 * (-4 .* x(1) .* x(2) + 4 .* x(1) .^ 3) + 2 .* x(1) - 2; 100 * (2 .* x(2) - 2 .* x(1) .^ 2)];
Hess = [-400 .* x(2) + 1200 .* x(1) .^ 2 + 2, -400 .* x(1);
    -400 .* x(1), 200];

end



