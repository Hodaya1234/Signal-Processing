%% question 7
% defining the variables
Fs = 100; N = 5; t = 0:(1/Fs):N-(1/Fs);
x=sin(2*pi*t)+sin(2*pi*t+pi/4);
figure(1);subplot(4,1,1);plot(t,x);
title('The Original Signal'); xlabel('Time (sec)'); ylabel('Amplitude (uV)');
% finding a
% a represents the amplitude of the signal. we need to find the value of
% the of the abs of the fft in the index of the signal's frequencies
X = fft(x)/(length(x)/2);
figure(1);subplot(4,1,2);stem(abs(X))
signal_freq = 1;
signal_index = signal_freq*N+1;
a = abs(X(signal_index));
title('The FFT - Frequency'); xlabel('Frequency (Hz)'); ylabel('Amplitude (uV)');

% finding p 
% p represents the phase of the signal. we need to find the value of
% the of the angle of the fft in the index of the signal's frequencies
p = angle(X(signal_index))+pi/2;
subplot(4,1,3);stem(angle(X))
title('The FFT - Angle'); xlabel('Frequency (Hz)'); ylabel('Phase (radians)');

% plotting the new signal
x_new = a*sin(2*pi*t+p);
subplot(4,1,4);plot(x_new)
title('The Computed Signal Signal'); xlabel('Time (sec)'); ylabel('Amplitude (uV)');

