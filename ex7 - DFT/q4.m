%% question 5
% a.
Fs = 12; N = 2; t = 0:(1/Fs):N-(1/Fs); f = 2; 
x = sin(2*pi*f*t);
figure(1);subplot(3,1,1);plot(x); title('The Original Signal'); ylabel('Amplitude (uV)'); xlabel('Time (sec)');
% b.
X = fft(x)/(length(x)/2); X = round(X);
non_zero_elements = find(abs(X) ~= 0);
figure(1);subplot(3,1,2);stem(abs(X)); title('The FFT'); ylabel('Amplitude (uV)'); xlabel('Frequency (Hz)');
% c.
x2 = circshift(x,3);
figure(1);subplot(3,1,3);plot(x); hold on; plot(x2); hold off;
title('Both Signals'); ylabel('Amplitude (uV)'); xlabel('Time (sec)');
legend('Original','Shifted');
% d
X2 = fft(x2)/length(x2); X2= round(X2);
X_phase = angle(X); X2_phase = angle(X2);
phase_shift = rad2deg(X_phase(non_zero_elements)-X2_phase(non_zero_elements))/180;
% e
k = 3; m = 2; N =length(x);
phase_shift_check = abs(exp(-1i*2*pi*k*m/N));