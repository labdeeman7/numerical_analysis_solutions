function [xSol, nIter, info] = bisection_method(F, a_k, b_k, tol, maxIter) 
%describe the function

if nargin<5
  maxIter = 10000;
end

nIter = 0;
info.as = a_k;
info.bs = b_k;
info.cs = [];
stopCond = false;
c_k = 10000;
delta = 1;

while (~stopCond && nIter <= maxIter)
    % Increment iterations
    nIter = nIter + 1;
    
    c_k_1 = c_k;
    c_k = (a_k + b_k)/2;
    
    
    % Update a_k and b_k
    if (F(c_k)*F(b_k) > 0)
        b_k = c_k; 
    else
        a_k = c_k;
    end
    
    info.cs = [info.cs c_k];
    info.as = [info.as a_k];
    info.bs = [info.bs b_k];
    
    stopCond = norm(c_k - c_k_1) < tol;
    
    if(stopCond)
        ySol = F(c_k);
        if( norm(ySol) > 1e-2)
            a_k = (info.as(1) - (10*delta));
            b_k = (info.bs(1) + (10*delta));
            delta = delta + 1;
            stopCond = false;
        end
    end
end



xSol = c_k;
end