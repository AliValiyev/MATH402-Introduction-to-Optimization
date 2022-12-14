% Author : Mustafa Kütük
%
% Description:
% This code part test routine of Newton's Armijo method to a given function.
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

x_01 = [-0.5; 1];
x_02 = [1.1; 1.1];
% f1 = Rosenbrock(x_01);
% f2 = Rosenbrock(x_02);
maxit = 10000;
alpha0 = 1;
c = 1e-4;
mu = 0.5;
amax = 100;
tol1 = 1e-3;
tol2 = 1e-6;
tol3 = 1e-9;

[x1, grad1, iters1] = Newton_armijo(@Rosenbrock, x_01, tol1, maxit, alpha0, c, mu, amax);
[x2, grad2, iters2] = Newton_armijo(@Rosenbrock, x_01, tol2, maxit, alpha0, c, mu, amax);
[x3, grad3, iters3] = Newton_armijo(@Rosenbrock, x_01, tol3, maxit, alpha0, c, mu, amax);

[x4, grad4, iters4] = Newton_armijo(@Rosenbrock, x_02, tol1, maxit, alpha0, c, mu, amax);
[x5, grad5, iters5] = Newton_armijo(@Rosenbrock, x_02, tol2, maxit, alpha0, c, mu, amax);
[x6, grad6, iters6] = Newton_armijo(@Rosenbrock, x_02, tol3, maxit, alpha0, c, mu, amax);

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
fprintf('              Results for x_0 = [-0.5; 1]              \n');
fprintf('\n');
fprintf('  Tol |  iteration  |                x value               |    Norm_Gradient\n');
fprintf('----- |-------------|--------------------------------------|--------------------\n');
fprintf(' 1e-3 |    %1i       |   [%1.12f; %1.12f]   |  %1.12f \n',iters1,x1(1,end),x1(2,end),grad1(end));
fprintf(' 1e-6 |    %1i       |   [%1.12f; %1.12f]   |  %1.18f \n',iters2,x2(1,end),x2(2,end),grad2(end));
fprintf(' 1e-9 |    %1i      |   [%1.12f; %1.12f]   |  %1.22f \n',iters3,x3(1,end),x3(2,end),grad3(end));
fprintf('\n');
fprintf('              Results for x_0 = [1.1; 1.1]             \n');
fprintf('\n');
fprintf('  Tol |  iteration  |                x value               |    Norm_Gradient\n');
fprintf('----- |-------------|--------------------------------------|--------------------\n');
fprintf(' 1e-3 |    %1i        |   [%1.12f; %1.12f]   |  %1.12f \n',iters4,x4(1,end),x4(2,end),grad4(end));
fprintf(' 1e-6 |    %1i        |   [%1.12f; %1.12f]   |  %1.18f \n',iters5,x5(1,end),x5(2,end),grad5(end));
fprintf(' 1e-9 |    %1i        |   [%1.12f; %1.12f]   |  %1.22f \n',iters6,x6(1,end),x6(2,end),grad6(end));


