function [xSol, nIter, info] = adjusted_newton_method(F, df, x0, tol, maxIter) 
%describe the function

if nargin<5
  maxIter = 10000;
end

nIter = 0;


x_k = x0;
info.xs = x0;
stopCond = false; 

delta = 1;

while (~stopCond && nIter <= maxIter)
    % Increment iterations
    nIter = nIter + 1;
    
    if( abs(F(x_k)/df(x_k)) > 1000)
        error('initial starting points bad');
    end
    
    % Update x_k
    x_k_1 = x_k;
    x_k = x_k - F(x_k)/df(x_k);
    
    info.xs = [info.xs x_k];
    
    stopCond =norm(x_k-x_k_1) < tol;
    
end

xSol = x_k;
end