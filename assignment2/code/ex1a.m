clear;
clc;

f = @(x) sin(x);
a = 0;
b= pi/2;
N = 10;

[sol_quad_midpoint, info_quad_midpoint] = quad_midpoint(f, a, b, N);
[sol_quad_trapezoidal, info_quad_trapezoidal] = quad_trapezoidal(f, a, b, N);
[sol_quad_simpsons, info_quad_simpsons] = quad_simpsons(f, a, b, N);

disp(sol_quad_midpoint)
disp(sol_quad_trapezoidal)
disp(sol_quad_simpsons)
