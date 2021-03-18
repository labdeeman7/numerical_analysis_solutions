function [sol, info] = quad_midpoint(f, a, b, N)
    h = (b-a)/N;
    xs = zeros(1,N);
    for i = 1:N
       xs(i) = a + (i - 0.5)*h; 
    end
    
    len = length(xs);
    sol = 0;
    
    for i = 1:(len)
        sol = sol + (f(xs(i))*h);
    end
    info.xs = xs;
    info.h = h;
end