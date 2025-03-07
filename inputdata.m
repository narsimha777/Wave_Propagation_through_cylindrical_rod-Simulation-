data = readtable('signal.xlsx');
u0 = data(:, 2);
u0 = table2array(u0);
u0 = u0';
E = 200*10^9;
d = 6506;
c = sqrt(E/d);
dt = 5e-8;
nt = 10000;
L = 0.5;
n = 500;
dx = L/(n-1);
lambda = (c*dt/dx)^2;
tmax = (nt-1)*dt;
time = linspace(0, tmax, nt);
u = zeros(1001, nt);
u(1, :) = [u0, zeros(1, nt-length(u0))];

for n = 2:nt-1
    for i = 2:1000
       u(i, n+1) = 2*u(i, n) - u(i, n-1) + lambda*(u(i+1, n)-2*u(i,n)+u(i-1, n));
    end
end

plot(time*1e-1, u(2, :), 'r', 'LineWidth', 2);
xlabel('time(ms)');
ylabel('displacement(u = 1)');

