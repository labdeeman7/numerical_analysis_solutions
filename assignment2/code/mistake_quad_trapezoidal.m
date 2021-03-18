function [sol, info] = mistake_quad_trapezoidal(f, a, b, N)
    h = (b-a)/N;
    xs = a:h:b;
    len = length(xs);   
    sol = ( f(xs(1)) * h) +  ( f(xs(end)) * h);
    
    for i = 2:(len-1)
        sol = sol + (f(xs(i))*h);
    end
    info.xs = xs;
    info.h = h;
end