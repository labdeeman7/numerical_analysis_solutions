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
    
    if(df(x_k) < 0.1)
        a_k = info.xs(1) + 10 ^ delta ;
        b_k = info.xs(1) - 10 ^ delta;
        c_k = 10000;
        for i = 1:10
            c_k = (a_k + b_k)/2;
            % Update a_k and b_k
            if (F(c_k)*F(b_k) > 0)
                b_k = c_k; 
            else
                a_k = c_k;
            end
        end
        
        x_k = c_k;
        delta = delta + 1;
    end
    
    % Update x_k
    x_k_1 = x_k;
    x_k = x_k - F(x_k)/df(x_k);
    
    info.xs = [info.xs x_k];
    
    stopCond =norm(x_k-x_k_1) < tol;
    
end

xSol = x_k;
end