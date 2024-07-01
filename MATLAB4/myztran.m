clear all; clc;
%exapnd transfer function
a = [1, -0.8, 0.39, -0.062, 0.005];
b = 0.09 * [1, 0, -2, 0, 1];

%%(a)
figure
subplot(3, 3, 1);
zplane(b, a);
title('zplane of H(z)');

%%(b)
[r, p, k] = residuez(b, a);
n = 0 : 20;
h = zeros(size(n));
for i = 1:length(r)
    h = h + r(i) * (p(i) .^ n);
end
for i = 1:length(k)
    h = h + k(i) * (n == 0); % Direct term affects only h[0]
end
subplot(3, 3, 2);
stem(n, h);
xlabel('n'), ylabel('h[n]'), title('h[n] vs n');

%%(c)
[H, w] = freqz(b, a);
%magnitude response
subplot(3, 3, 3);
plot(w, abs(H));
xlabel('ω'), ylabel('|H(z)|'), title('|H(z)| vs ω');
%phase response
phase = rad2deg(unwrap(angle(H)));
subplot(3, 3, 4);
plot(w, phase);
xlabel('ω'), ylabel('phase angle'), title('phase vs ω');

%%(e)
[z, p, k] = tf2zp(b, a);
sos = zp2sos(z, p, k);
%1~3numerator, 4~6 denominator
[H1, w1] = freqz(sos(1, 1:3), sos(1, 4:6));
[H2, w2] = freqz(sos(2, 1:3), sos(2, 4:6));
subplot(3, 3, 5);
plot(w1, abs(H1));
xlabel('ω'), ylabel('|H1(z)|'), title('|H1(z)| vs ω');
subplot(3, 3, 6);
plot(w2, abs(H2));
xlabel('ω'), ylabel('|H2(z)|'), title('|H2(z)| vs ω');
%|H1(z)| * |H2(z)|
H12 = (H1 .* H2);
subplot(3, 3, 7);
plot(w1, abs(H12));
xlabel('ω'), ylabel('|H1(z)*H2(z)|'), title('|H1(z)*H2(z)| vs ω');

%%(f)
x = [1, zeros(1, 20)];
y = filter(b, a, x);
subplot(3, 3, 8);
stem(n, y);
xlabel('n'), ylabel('y[n]'), title('y[n] vs n');
