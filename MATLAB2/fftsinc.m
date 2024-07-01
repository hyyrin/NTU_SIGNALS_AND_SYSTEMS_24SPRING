clear all; clc;

%%(a)
T = 100;
N = 1001;
N1 = (N - 1) / 2;
Ts = T / N1;
left = -500;
right = 500;
n = (left : right); %define range
x_n = sin(2 * pi * n * Ts) ./ (2 * pi * n * Ts);
x_n(right + 1) = 1;
figure
plot(n, x_n), xlabel('n'), ylabel('x[n]'), title('x[n] vs n');

%%(b)
X = fft(x_n);
abs_X = abs(X); %complex to abs value(magnitude)
ans = fftshift(abs_X);
figure
plot(2 * n * pi / N, ans), xlabel('ω'), ylabel('X(e^j^ω)'), title('magnitude of the fftoutput vs frequency ω');

%%(c)
func(x_n, n, left, right, N);

%%(d)
Tw = T / 2;
w_n = zeros(N);
w_n = (1 + cos(2 * pi * abs(n * Ts) / Tw)) / 2;
w_n(n < -(Tw / (2 * Ts))) = 0;
w_n(n > (Tw / (2 * Ts))) = 0;
figure
plot(n, w_n), xlabel('n'), ylabel('w[n]'), title('w[n] vs n');

%%(e)
y_n = x_n .* w_n; %DT multiplication
figure
plot(n, y_n), xlabel('n'), ylabel('y[n]'), title('y[n] vs n');

%%(f)
Y = fft(y_n);
abs_Y = abs(Y);
Y_ans = fftshift(abs_Y);
figure
plot(2 * pi * n / N, Y_ans), xlabel('ω'), ylabel('Y(e^j^ω)'), title('magnitude of the fft output vs frequency ω');

%%(c)'s function
function[] = func(x_n, n, left, right, N)
a = zeros(N);
for idx = 1 : N
    for idy = 1 : N
        a(idx) = a(idx) + x_n(idy) * exp(-1j * idx * 2 * pi * idy / N); %compute Xk
    end
end
b = abs(a);
c = zeros(right - left + 1);
for i = 1 : right + 1
    c(i) = b(right + i);
end
for i = 1 : right
    c(right + 1 + i) = b(i); 
end
figure
plot(2 * pi * n / N, c), xlabel('ω'), ylabel('X_k(e^j^ω)'), title('magnitude of X_k(e^j^ω) vs frequency ω');
end

