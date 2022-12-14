% Author : Mustafa Kütük
%
% Description:
% This function takes the derivative of a given function.
%
% Inputs:
% 
% f : a user supplied function
%  
% Output :
% 
% f : value of the function
% df : derivative of the function wrt x value
% 
% Usage :
% 
% [f, df] = f(x) 

function [f, df] = f(x) 


% f = (x ^ 2 + 1) * (x - 1);
% df = 3 * x ^ 2 - 2 * x + 1;

f = (x - 1) ^ 2;
df = 2 * x - 2;

end

