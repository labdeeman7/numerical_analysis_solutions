clear;
clc;

f = @(x) sin(x);
a = 0;
b= pi/2;


%% Get solutions
N = 20;
[sol_quad_trapezoidal_h, info_quad_trapezoidal_h] = mistake_quad_trapezoidal(f, a, b, N);

N_2 = 40;
[sol_quad_trapezoidal_h_2, info_quad_trapezoidal_h_2] = mistake_quad_trapezoidal(f, a, b, N_2);

%% calculate error values for h/2 and h
error_trapezoidal_h = abs(1 - sol_quad_trapezoidal_h);  
error_trapezoidal_h_2 = abs(1 - sol_quad_trapezoidal_h_2);  
r_trapezoidal = log2( error_trapezoidal_h/error_trapezoidal_h_2 );



%% Errors trapezoidal
N= 2.^(0:10);

h_trapezoidal = zeros(size(N),'like', N);
E_trapezoidal = zeros(size(N),'like', N);

for i = 1:length(N)
    [sol_trapezoidal_final, info_trapezoidal_final] = mistake_quad_trapezoidal(f, a, b, N(i));
    E_trapezoidal(i) = abs(1 - sol_trapezoidal_final);
    h_trapezoidal(i) = info_trapezoidal_final.h;
end
figure(2) 
loglog(h_trapezoidal,E_trapezoidal, '-o');
grid on
title('log log mistake trapezoidal')
xlabel('h') 
ylabel('errors')


r_array =  log2(E_trapezoidal(1: (end-1) ) ./ E_trapezoidal(2:end) );

disp(r_array)