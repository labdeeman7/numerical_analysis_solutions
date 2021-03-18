M = 200;
x = -1.8:1/M:1.8;
y = 1/2 - 1./(1+ M*abs(x-1.05));
% y = sin(x);
% y = 0.5.* x + 5;
plot(x,y)
grid on