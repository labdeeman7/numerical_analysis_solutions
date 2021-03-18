function [xSol, nIter, info] = adjusted_secant_method(F, x0, x1, tol, maxIter) 
%describe the function

if nargin<5
  maxIter = 10000;
end

nIter = 0;
x_k_1 = x0;
x_k = x1;
info.xs = [x0, x1];
stopCond = false; 
delta = 1;

while (~stopCond && nIter <= maxIter)
    % Increment iterations
    nIter = nIter + 1;
    x_k_1 = info.xs(nIter);
    
    if(F(x_k) - F(x_k_1) < 0.1)
        a_k = info.xs(1) + 2 * delta ;
        b_k = info.xs(1) - 2 * delta;
        c_k = 10000;
        for i = 1:5
            c_k = (a_k + b_k)/2;
            % Update a_k and b_k
            if (F(c_k)*F(b_k) > 0)
                b_k = c_k; 
            else
                a_k = c_k;
            end
        end
        
        x_k_1 = a_k;
        x_k = b_k;
        delta = delta + 1;
    end
    
    % Update x_k and x_k_1
    
    x_k = x_k -  (F(x_k) * (x_k - x_k_1))/( F(x_k) - F(x_k_1)) ;
    
    info.xs = [info.xs x_k];
    
    stopCond =norm(x_k -x_k_1) < tol; 
    

xSol = x_k;
end