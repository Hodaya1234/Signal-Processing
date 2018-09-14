Fs = 1000;
Time = 1;
t = 0:1/Fs:Time;
f =5;
phase = 0.35;

x1 = sin(f*2*pi*t);
x2 = sin(f*2*pi*t+phase);
corr = xcorr(x1, x2);

[~,peak_corr] = max(corr);
[~,peak_original] = max(xcorr(x1,x1));

index_diff = peak_corr - peak_original;

cycle = Fs*(1/f); % sample rate divided by the signal rate - how many indices in a cycle
part_of_cycle = index_diff / cycle;
real_diff = part_of_cycle*2*pi;
