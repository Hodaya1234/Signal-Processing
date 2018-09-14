x = floor(randn(1,50));
x(x~=0) = 1;
my_vec = [x,zeros(1,100)];

vec_auto = xcorr(my_vec);
figure(1);plot(vec_auto)
[a,b] = diff(vec_auto);
figure(2);plot(a,b)