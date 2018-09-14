%% question 2
Fs = 8; N = 1; t = 0:(1/Fs):N-(1/Fs);
%% a.
x = 2*sin(2*pi*t*2);
X = fft(x)/(length(x)/2);
figure(1);subplot(2,1,1); plot(x); title('The Signal - a.'); xlabel('Time (sec)'); ylabel('Amplitude'); xticklabels(0:length(x)-1);
figure(1);subplot(2,1,2); stem(abs(X)); title('The FFT of the signal'); xlabel('Frequency (Hz)'); ylabel('Amplitude'); xticklabels(0:length(x)-1);
saveas(gcf,'2a.jpg')
%% b.
x = 3*cos(2*pi*t*3);
X = fft(x)/(length(x)/2);
figure(2);subplot(2,1,1); plot(x); title('The Signal - b.'); xlabel('Time (sec)'); ylabel('Amplitude'); xticklabels(0:length(x)-1);
figure(2);subplot(2,1,2); stem(abs(X)); title('The FFT of the signal'); xlabel('Frequency (Hz)'); ylabel('Amplitude'); xticklabels(0:length(x)-1);
saveas(gcf,'2b.jpg')
%% c.
x = 2*sin(2*pi*t*2)+3*cos(2*pi*t*3);
X = fft(x)/(length(x)/2);
figure(3);subplot(2,1,1); plot(x); title('The Signal - c.'); xlabel('Time (sec)'); ylabel('Amplitude'); xticklabels(0:length(x)-1);
figure(3);subplot(2,1,2); stem(abs(X)); title('The FFT of the signal'); xlabel('Frequency (Hz)'); ylabel('Amplitude'); xticklabels(0:length(x)-1);
saveas(gcf,'2c.jpg')
%% d.
Fs = 16; N = 1; t = 0:(1/Fs):N-(1/Fs);
x = 5*sin(2*pi*t*5);
X = fft(x)/(length(x)/2);
figure(4);subplot(2,1,1); plot(x); title('The Signal - d.'); xlabel('Time (sec)'); ylabel('Amplitude'); xticklabels(0:length(x)-1);
figure(4);subplot(2,1,2); stem(abs(X)); title('The FFT of the signal'); xlabel('Frequency (Hz)'); ylabel('Amplitude'); xticklabels(0:length(x)-1);
saveas(gcf,'2d.jpg')
