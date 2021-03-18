clear;
clc;

f = @(y) y - y^3;
df = @(y) 1 - 3*y^2;

y_0 = 0.1;
T = 2;
N= 100;

y_t = @(t) y_0/sqrt(y_0^2 - ( (y_0^2 - 1) * exp(-2*t) ) );

[sol_euler, info_euler] = euler_method(f, y_0, T, N);

[sol_backwards_euler, info_backwards_euler] = backwards_euler_method(f, df, y_0, T, N);

[sol_crank_nicholson, info_crank_nicholson] = crank_nicholson_method(f, df, y_0, T, N);


disp(sol_euler)
disp(sol_backwards_euler)
disp(sol_crank_nicholson)
disp(y_t(T))
