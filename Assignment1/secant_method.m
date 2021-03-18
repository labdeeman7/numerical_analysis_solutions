function [xSol, nIter, info] = secant_method(F, x0, x1, tol, maxIter) 
%describe the function

if nargin<5
  maxIter = 10000;
end

nIter = 0;
x_k_1 = x0;
x_k = x1;
info.xs = [x0, x1];
stopCond = false; 

while (~stopCond && nIter <= maxIter)
    % Increment iterations
    nIter = nIter + 1;
    
    % Update x_k
    x_k_1 = info.xs(nIter);
    x_k = x_k -  (F(x_k) * (x_k - x_k_1))/( F(x_k) - F(x_k_1)) ;
    
    info.xs = [info.xs x_k];
    
    stopCond =norm(x_k -x_k_1) < tol; 
end

xSol = x_k;
end