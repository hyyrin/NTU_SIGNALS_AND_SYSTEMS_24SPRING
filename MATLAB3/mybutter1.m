clear all; clc;

%%(a)
Ts = 1 / 20;
n = 1 : 100;
xn = cos(2 * pi * (n - 1) * Ts);
figure
plot(n, xn), xlabel('n'), ylabel('x[n]'), title('x[n] vs n');

figure
%%(b)
[b1, a1] = butter(3, 0.05);
y1 = filter(b1, a1, xn);
[H1, W1] = freqz(b1, a1);
subplot(3, 3, 1), plot(W1, 20 * log10(abs(H1))), xlabel('ω'), ylabel('dB'), title('magnitude response vs w');
subplot(3, 3, 2), plot(W1, rad2deg(unwrap(angle(H1)))), xlabel('ω'), ylabel('degree'), title('phase response vs w');
subplot(3, 3, 3), plot(n, y1), xlabel('n'), ylabel('y[n]'), title('output signal y[n] vs n');

%%(c)
[b2, a2] = butter(7, 0.05);
y2 = filter(b2, a2, xn);
[H2, W2] = freqz(b2, a2);
subplot(3, 3, 4), plot(W2, 20 * log10(abs(H2))), xlabel('ω'), ylabel('dB'), title('magnitude response vs w');
subplot(3, 3, 5), plot(W2, rad2deg(unwrap(angle(H2)))), xlabel('ω'), ylabel('degree'), title('phase response vs w');
subplot(3, 3, 6), plot(n, y2), xlabel('n'), ylabel('y[n]'), title('output signal y[n] vs n');

%%(d)
[b3, a3] = butter(3, 0.5);
y3 = filter(b3, a3, xn);
[H3, W3] = freqz(b3, a3);
subplot(3, 3, 7), plot(W3, 20 * log10(abs(H3))), xlabel('ω'), ylabel('dB'), title('magnitude response vs w');
subplot(3, 3, 8), plot(W3, rad2deg(unwrap(angle(H3)))), xlabel('ω'), ylabel('degree'), title('phase response vs w');
subplot(3, 3, 9), plot(n, y3), xlabel('n'), ylabel('y[n]'), title('output signal y[n] vs n');

