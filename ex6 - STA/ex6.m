% % Question 1
% load('exr6_sta.mat');
% norm_s = s - mean(s);
% s_times_f = norm_s.*fr;
% w = sum(s_times_f)/sum(fr,1);
% linear = w.*s;
% 
% sum_linear_rows = sum(linear,2);
% scatter(sum_linear_rows, fr);

%% Question 3
clear;

N = 10;
t = 0:1/N:1-(1/N);
x = 3*cos(2*pi*3*t)+ 1*cos(2*pi*6*t);
sk = zeros(N,N);
for k = 0:N-1
    sk(k+1,:) = exp(-1i*2*pi*k*t);
end;

result = zeros(N);
for k = 1:N
    result(k) = sum(sk(k).*x);
end;


%Sk=exp(-i*2*pi*n/N) for n=0,1,…,9 for k=0,1,2,…9. 