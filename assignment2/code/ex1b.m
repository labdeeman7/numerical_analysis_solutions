clear;
clc;

f = @(x) sin(x);
a = 0;
b= pi/2;

%% Get solutions
N = 1;
[sol_quad_midpoint_h, info_quad_midpoint_h] = quad_midpoint(f, a, b, N);
[sol_quad_trapezoidal_h, info_quad_trapezoidal_h] = quad_trapezoidal(f, a, b, N);
[sol_quad_simpsons_h, info_quad_simpsons_h] = quad_simpsons(f, a, b, N); 

N_2 = 2;
[sol_quad_midpoint_h_2, info_quad_midpoint_h_2] = quad_midpoint(f, a, b, N_2);
[sol_quad_trapezoidal_h_2, info_quad_trapezoidal_h_2] = quad_trapezoidal(f, a, b, N_2);
[sol_quad_simpsons_h_2, info_quad_simpsons_h_2] = quad_simpsons(f, a, b, N_2);

%% calculate error values for h/2 and h

error_midpoint_h = abs(1 - sol_quad_midpoint_h);  
error_trapezoidal_h = abs(1 - sol_quad_trapezoidal_h);  
error_simpsons_h = abs(1 - sol_quad_simpsons_h); 

error_midpoint_h_2 = abs(1 - sol_quad_midpoint_h_2);
error_trapezoidal_h_2 = abs(1 - sol_quad_trapezoidal_h_2);  
error_simpsons_h_2 = abs(1 - sol_quad_simpsons_h_2);  

%% Calculate r

r_midpoint = log2( error_midpoint_h/error_midpoint_h_2 )
r_trapezoidal = log2( error_trapezoidal_h/error_trapezoidal_h_2 )
r_simpsons = log2( error_simpsons_h/error_simpsons_h_2 )

%% errors 

N= 2.^(0:10);

%% Errors midpoint
h_midpoint = zeros(size(N),'like', N);
E_midpoint = zeros(size(N),'like', N);

for i = 1:length(N)
    [sol_midpoint_final, info_midpoint_final] = quad_midpoint(f, a, b, N(i));
    E_midpoint(i) = abs(1 - sol_midpoint_final);
    h_midpoint(i) = info_midpoint_final.h;
end
figure 
loglog(h_midpoint,E_midpoint, '-o');
grid on
title('log log plot midpoint')
xlabel('h') 
ylabel('errors')


%% Errors trapezoidal
h_trapezoidal = zeros(size(N),'like', N);
E_trapezoidal = zeros(size(N),'like', N);

for i = 1:length(N)
    [sol_trapezoidal_final, info_trapezoidal_final] = quad_trapezoidal(f, a, b, N(i));
    E_trapezoidal(i) = abs(1 - sol_trapezoidal_final);
    h_trapezoidal(i) = info_trapezoidal_final.h;
end
figure(2) 
loglog(h_trapezoidal,E_trapezoidal, '-o');
grid on
title('log log plot trapezoidal')
xlabel('h') 
ylabel('errors')



%% Errors simpsons
h_simpsons = zeros(size(N),'like', N);
E_simpsons = zeros(size(N),'like', N);

for i = 1:length(N)
    [sol_simpsons_final, info_simpsons_final] = quad_simpsons(f, a, b, N(i));
    E_simpsons(i) = abs(1 - sol_simpsons_final);
    h_simpsons(i) = info_simpsons_final.h;
end
figure(3)
loglog(h_simpsons,E_simpsons, '-o');
grid on
title('log log plot simpsons')
xlabel('h') 
ylabel('errors')



