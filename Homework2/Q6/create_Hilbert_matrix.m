% Author : Mustafa Kütük
%
% Description:
% 
% This function creates a Hilbert matrix for a given size n.
%
% Inputs:
% 
% n: the size of matrix
%  
% Output :
% 
% a Hilbert matrix A
% 
% Usage :
% 
% A = create_Hilbert_matrix(n)

function A = create_Hilbert_matrix(n)

for i = 1:n
    for j = 1:n
        A(i,j) = 1 / (i + j - 1);
    end
end


end