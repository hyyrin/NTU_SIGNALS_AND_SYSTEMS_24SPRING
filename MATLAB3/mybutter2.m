clear all; clc;

figure
%%(a)
Ts = 0.002;
M = 1000;
n = 1 : 1000;
f1 = 100;
xn = cos(2 * pi * (n - 1) * Ts) + 2 * cos(2 * pi * f1 * (n - 1) * Ts);
subplot(3, 1, 1), plot(n, xn), xlabel('n'), ylabel('x[n]'), title('x[n] vs n');

%%(b)
[b, a] = butter(16, 0.3, 'low');
yn = filter(b, a, xn);
subplot(3, 1, 2), plot(n, yn), xlabel('n'), ylabel('y[n]'), title('y[n] vs n');

%%(c)
[b, a] = butter(16, [0.3, 0.5], 'bandpass');
yn = filter(b, a, xn);
subplot(3, 1, 3), plot(n, yn), xlabel('n'), ylabel('y[n]'), title('y[n] vs n');
