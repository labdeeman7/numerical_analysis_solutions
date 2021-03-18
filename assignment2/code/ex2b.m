clear;
clc;

f = @(y) y - y^3;
df = @(y) 1 - 3*y^2;
tol = 0.01;

y_0 = 0.1;
T = 1;
y_t = @(t) y_0/sqrt(y_0^2 - ( (y_0^2 - 1) * exp(-2*t) ) );


%% Euler decay rate
N= 1;
nIter = 1;
stopCond = false;
maxIter = 15;

h_euler = [];
E_euler = [];
r_euler = [];

while (~stopCond && nIter <= maxIter)
    [sol_euler, info_euler] = euler_method(f, y_0, T, N);
    
    E_euler =  [ E_euler , abs(y_t(T) - sol_euler)] ;
    h_euler = [h_euler, info_euler.h];
    
    if (nIter >1)
        r_euler = [r_euler , E_euler(nIter-1)/E_euler(nIter)];
    end
    
    
    if (nIter >2)
        stopCond = abs( r_euler(nIter-2) - r_euler(nIter-1) ) < tol...
        && abs(E_euler(nIter) - round(E_euler(nIter)) ) < tol ;
    end
    nIter = nIter +1;
    N = 2 * N;
end

decay_rate_euler = round(r_euler(end));

%% backwards euler decay rate
N= 1;
nIter = 1;
stopCond = false;
maxIter = 15;

h_back = [];
E_back = [];
r_back = [];

while (~stopCond && nIter <= maxIter)
    [sol_back, info_back] = backwards_euler_method(f, df, y_0, T, N);
    
    E_back =  [ E_back , abs(y_t(T) - sol_back)] ;
    h_back = [h_back, info_back.h];
    
    if (nIter >1)
        r_back = [r_back , E_back(nIter-1)/E_back(nIter)];
    end
    
    
    if (nIter >2)
        stopCond = abs( r_back(nIter-2) - r_back(nIter-1) ) < tol...
        && abs(E_back(nIter) - round(E_back(nIter)) ) < tol ;
    end
    nIter = nIter +1;
    N = 2 * N;
end

decay_rate_back = round(r_back(end));

%% crank nicholson decay rate

N= 1;
nIter = 1;
stopCond = false;
maxIter = 15;

h_crank = [];
E_crank = [];
r_crank = [];

while (~stopCond && nIter <= maxIter)
    [sol_crank, info_crank] = crank_nicholson_method(f, df, y_0, T, N);
    
    E_crank =  [ E_crank , abs(y_t(T) - sol_crank)] ;
    h_crank = [h_crank, info_crank.h];
    
    if (nIter >1)
        r_crank = [r_crank , E_crank(nIter-1)/E_crank(nIter)];
    end
    
    
    if (nIter >2)
        stopCond = abs( r_crank(nIter-2) - r_crank(nIter-1) ) < tol...
        && abs(E_crank(nIter) - round(E_crank(nIter)) ) < tol ;
    end
    nIter = nIter +1;
    N = 2 * N;
end

decay_rate_crank = round(r_crank(end));

%% check if rate not changing 

    

