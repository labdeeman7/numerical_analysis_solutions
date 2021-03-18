clear;
clc;

F = @(x) x^3 + 2*x^2 + 10*x - 20;
df = @(x) 3*x^2 + 4*x + 10;
x0 = 1;
tol = 1e-4;

%b - newton
% [xSol_newton, nIter_newton, info_newton] = newton_method(F, df, x0, tol);

%c - secant 
x0 = 0;
x1 = 1;
[xSol_secant, nIter_secant, info_secant] = secant_method(F, x0, x1, tol);

%d - bisection
a_k = 1;
b_k = 2;
% [xSol_bisection, nIter_bisection, info_bisection] = ...
%                     bisection_method(F, a_k, b_k, tol);