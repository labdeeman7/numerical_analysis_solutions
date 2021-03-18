function [sol, info] = quad_simpsons(f, a, b, N)
    h = (b-a)/N;
    xs = zeros(1,N);
    for i = 1:(2*N+1)
       xs(i) = a + (i - 1)*h/2; 
    end
   
    sol = 0;
    
    for i = 1:(2*N+1)
        if(i == 1 || i == 2*N+1)
            w = h/6;    
        elseif( mod(i,2) == 0)
            w = 4*h/6;
        else
            w = 2*h/6;
        end      
        
        sol = sol + (f(xs(i))*w);
    end
    info.xs = xs;
    info.h = h;
end