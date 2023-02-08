% Author : Mustafa Kütük
%
% Description:
% This code part test routine of Symmetric Rank-1 Inverse Update method to 
% a given function.
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

x_01 = [-0.5; 1];
x_02 = [1.1; 1.1];
maxit = 10000;
alpha0 = 1;
c = 1e-4;
mu = 0.5;
amax = 100;
tol1 = 1e-3;
tol2 = 1e-6;
tol3 = 1e-9;
H0 = eye(2);

[x1, grad1, iters1] = SR1_inverse(@Rosenbrock, x_01, tol1, H0, maxit, alpha0, c, mu, amax);
[x2, grad2, iters2] = SR1_inverse(@Rosenbrock, x_01, tol2, H0, maxit, alpha0, c, mu, amax);
[x3, grad3, iters3] = SR1_inverse(@Rosenbrock, x_01, tol3, H0, maxit, alpha0, c, mu, amax);

[x4, grad4, iters4] = SR1_inverse(@Rosenbrock, x_02, tol1, H0, maxit, alpha0, c, mu, amax);
[x5, grad5, iters5] = SR1_inverse(@Rosenbrock, x_02, tol2, H0, maxit, alpha0, c, mu, amax);
[x6, grad6, iters6] = SR1_inverse(@Rosenbrock, x_02, tol3, H0, maxit, alpha0, c, mu, amax);

figure;
plot(0:iters1, grad1, 'ro', 'MarkerSize', 18);
hold on;
plot(0:iters2, grad2, 'b*', 'MarkerSize', 18);
hold on;
plot(0:iters3, grad3, 'k', 'LineWidth', 3);
hold on;
title('Norm of Gradient for x_0 = [-0.5; 1]', 'FontWeight', 'bold', 'FontSize', 36);
xlabel('Iterations', 'FontWeight', 'bold', 'FontSize', 36);
ylabel('Norm of Gradient', 'FontWeight', 'bold', 'FontSize', 36);
set(gca, 'FontWeight', 'bold', 'FontSize', 36);
legend('tol:1e-3','tol:1e-6','tol:1e-9');
grid on;

figure;
plot(0:iters4, grad4, 'ro', 'MarkerSize', 18);
hold on;
plot(0:iters5, grad5, 'b*', 'MarkerSize', 18);
hold on;
plot(0:iters6, grad6, 'k', 'LineWidth', 3);
hold on;
title('Norm of Gradient for x_0 = [1.1; 1.1]', 'FontWeight', 'bold', 'FontSize', 36);
xlabel('Iterations', 'FontWeight', 'bold', 'FontSize', 36);
ylabel('Norm of Gradient', 'FontWeight', 'bold', 'FontSize', 36);
set(gca, 'FontWeight', 'bold', 'FontSize', 36);
legend('tol:1e-3','tol:1e-6','tol:1e-9');
grid on;

clc;
% The SR-1 Inverse Update Method fails for x_0 = [-0.5; 1]
% Therefore, values of the last successful iterations are printed.
fprintf('              Results for x_0 = [-0.5; 1]              \n');
fprintf('\n');
fprintf('  Tol |  iteration  |                x value               |    Norm_Gradient\n');
fprintf('----- |-------------|--------------------------------------|--------------------\n');
fprintf(' 1e-3 |    %1i       |   [%1.12f; %1.12f]   |  %1.12f \n',iters1,x1(1,end-1),x1(2,end-1),grad1(end-1));
fprintf(' 1e-6 |    %1i       |   [%1.12f; %1.12f]   |  %1.18f \n',iters2,x2(1,end-1),x2(2,end-1),grad2(end-1));
fprintf(' 1e-9 |    %1i      |   [%1.12f; %1.12f]   |  %1.22f \n',iters3,x3(1,end-1),x3(2,end-1),grad3(end-1));
fprintf('\n');
fprintf('              Results for x_0 = [1.1; 1.1]             \n');
fprintf('\n');
fprintf('  Tol |  iteration  |                x value               |    Norm_Gradient\n');
fprintf('----- |-------------|--------------------------------------|--------------------\n');
fprintf(' 1e-3 |    %1i        |   [%1.12f; %1.12f]   |  %1.12f \n',iters4,x4(1,end),x4(2,end),grad4(end));
fprintf(' 1e-6 |    %1i        |   [%1.12f; %1.12f]   |  %1.18f \n',iters5,x5(1,end),x5(2,end),grad5(end));
fprintf(' 1e-9 |    %1i        |   [%1.12f; %1.12f]   |  %1.22f \n',iters6,x6(1,end),x6(2,end),grad6(end));


