clear;
clc;

F = @(x) tanh(x);
df = @(x) 1 - tanh(x)^2;
x0 = -5;
tol = 1e-4;

%a - newton
[xSol_newton, nIter_newton, info_newton] = adjusted_newton_method(F, df, x0, tol);

%b - secant 
x0 = -5;
x1 = -4;
[xSol_secant, nIter_secant, info_secant] = adjusted_secant_method(F, x0, x1, tol);

%c - bisection
a_k = -5;
b_k = 1;
[xSol_bisection_c, nIter_bisection_c, info_bisection_c] = ...
                    adjusted_bisection_method(F, a_k, b_k, tol);

%d - bisection
a_k = 5;
b_k = 10;
[xSol_bisection_d, nIter_bisection_d, info_bisection_d] = ...
                    adjusted_bisection_method(F, a_k, b_k, tol);