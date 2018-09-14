%% quesstion 3
% a.
N = 2; Fs = 100; t = 0:(1/Fs):N-(1/Fs);
x = 2*sin(2*pi*t*2)+3*cos(2*pi*t*3);
figure(1);subplot(3,2,1);plot(t,x);
subplot(3,2,1);plot(t,x); title('The Signal a.'); ylabel('Amplitude (uV)'); xlabel('Time (sec)'); 
X = fft(x)/(length(x)/2); subplot(3,2,2);stem(abs(X)); title('The FFT a.'); xlabel('Frequency (Hz)'); ylabel('Amplitude (uV)'); 

% b.
f_remove = 2;
f_index = [f_remove*N+1,length(x)-(f_remove*N)+1];
X_new = X; X_new(f_index) = 0;
subplot(3,2,4); stem(abs(X_new)); title('The FFT b.'); xlabel('Frequency (Hz)'); ylabel('Amplitude (uV)');
x_new = ifft(X_new)*(length(x)/2);
subplot(3,2,3);plot(t,x_new); title('The Signal b.'); ylabel('Amplitude (uV)'); xlabel('Time (sec)');
% c.
f_remove = 3;
f_index = [f_remove*N+1,length(x)-(f_remove*N)+1];
X_new = X; X_new(f_index) = 0;
subplot(3,2,6); stem(abs(X_new)); title('The FFT c.'); xlabel('Frequency (Hz)'); ylabel('Amplitude (uV)');
x_new = ifft(X_new)*(length(x)/2);
subplot(3,2,5);plot(t,x_new); title('The Signal c.'); ylabel('Amplitude (uV)'); xlabel('Time (sec)');

