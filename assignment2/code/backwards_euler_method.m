function [sol, info] = backwards_euler_method(f, df, y_0, T, N)
    h = T/N;
    y = y_0;
    info.ys = y;
    info.h = h;
    tol = 1e-4;
    
    for i = 1:N
        z = @(x) y + (h* f(x)) - x;    
        dz = @(x) h * df(x) - 1;
        
        %a - newton
        [xSol_newton, nIter_newton, info_newton] = adjusted_newton_method(z, dz, y, tol);
        y = xSol_newton;
        info.ys = [info.ys, y];
    end
    sol = y;
end