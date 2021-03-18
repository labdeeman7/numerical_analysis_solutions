function [sol, info] = euler_method(f, y_0, T, N)
    h = T/N;
    y = y_0;
    info.h = h;
    info.ys = y;
    for i = 1:N
        y = y + h * f(y);
        info.ys = [info.ys, y];
    end
    sol = y;
end