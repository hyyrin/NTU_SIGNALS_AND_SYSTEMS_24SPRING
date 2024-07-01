clear all; clc;
%%(a).1
x1_first = 1:1:20;
x1_second = 19:-1:1;
x1 = [x1_first, x1_second]; %merge first and second part
ans1 = figure();
n = 1:39;
stem(x1);

%%(a).2
n = 1:10;
x2(n >= 1 & n <= 10) = 1;
ans2 = figure();
stem(n, x2);

%%(b)
y = conv(x1, x2);
ans3 = figure();
stem(y);

%%(c)
N1 = length(x1);
N2 = length(x2);
matrix = zeros(N1 + N2 - 1, N2);
new_x2 = zeros(N2, 1);
for i = 1 : N2
    new_x2(i, 1) = 1;
end
for i = 1 : N2
    for j  = i : i + N1 - 1
       matrix(j, i) = x1(j - i + 1);
    end
end
y2 = matrix*new_x2;
ans4 = figure();
stem(y2);

%%(d)
x3 = [3, 9, 27];
x4 = [2, 4, 8, 16, 32];
ans5 = figure();
stem(x3);
ans6 = figure();
stem(x4);
y3 = conv(x3, x4);
ans7 = figure();
stem(y3);
N3 = length(x3);
N4 = length(x4);
matrix2 = zeros(N3 + N4 - 1, N4);
for i = 1 : N4
    for j = i : i + N3 - 1
        matrix2(j, i) = x3(j - i + 1);
    end
end
y4 = matrix2 * x4';
ans8 = figure();
stem(y4);
