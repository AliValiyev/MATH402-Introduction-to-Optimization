% Author : Mustafa Kütük
%
% Description:
% 
% This function is used to find the step length of Armijo's condition.
%
% Inputs:
% 
% fhandle: a function handle  
% x: current iterate  
% p: descent direction
% alpha0: initial step length 
% c: Armijo constant 
% mu: backtracking parameter 
% amax: maximum number of iterations
% 
% Output :
% 
% alpha: step length that satisfies Armijo condition
% 
% Usage :
% 
% [alpha] = armijo(fhandle, x, p, alpha0, c, mu, amax)

function [alpha] = armijo(fhandle, x, p, alpha0, c, mu, amax)

j = 0;

[f, gradx, ~] = feval(fhandle, x);

[fh, ~, ~] = feval(fhandle, x+alpha0*p);

while ((fh >= f + c * alpha0 * gradx' * p) && (j <= amax)) 
    
    alpha0 = alpha0 * mu;
    
    a = x + alpha0 * p;
    
    [fh, ~, ~] = feval(fhandle, a);
    
    j = j + 1; 
    
end

alpha = alpha0;

end


