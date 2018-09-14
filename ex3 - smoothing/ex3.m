%% Targil 3

%% Question 2

t=0:0.01:10 - 0.01; noise=randn(1,1000); x=ones(1,length(t)); signal = x+noise; k = 9;
original_snr = mean(ones) / std(signal); % calculating SNR of the original signal

% a - Rectangular Smoothing
window = ones(1,k).*(1/k); % calculating the window
signal_a = smoothByWindow(signal,window); % signal after smoothing
snr_a = mean(signal_a) / std(signal_a); % SNR after smoothing

% b - Triangle Smoothing
vec=  [1,2,3,4,5,4,3,2,1]; 
window = vec/sum(vec); % calculating the window
signal_b = smoothByWindow(signal,window); % signal after smoothing
snr_b = mean(signal_b) / std(signal_b); % SNR after smoothing

% c - trigonometric window
vec=  sin([0 , 1/8*pi , 2/8*pi , 3/8*pi , pi/2 , 5/8*pi , 6/8*pi , 7/8*pi, pi ]);
window = vec / sum(vec); % calculating the window
signal_c = smoothByWindow(signal,window); % signal after smoothing
snr_c = mean(signal_c) / std(signal_c); % SNR after smoothing

clear k noise t vec vec_1 vec_2 window x

figure(1);  % plotting all signals
subplot(4,1,1); plot(signal); title({'Question 2' ; 'Signal Before Smoothing'}); xlim([0,1000]);
xlabel('Time'); ylabel('Amplitude');
subplot(4,1,2); plot(signal_a); title('Signal With Rectangular Smoothing'); xlim([0,1000]); ylim([-5,5]);
xlabel('Time'); ylabel('Amplitude');
subplot(4,1,3); plot(signal_b); title('Signal With Triangle Smoothing'); xlim([0,1000]);  ylim([-5,5]);
xlabel('Time'); ylabel('Amplitude');
subplot(4,1,4); plot(signal_c); title('Signal With trigonometric Smoothing'); xlim([0,1000]);  ylim([-5,5]);
xlabel('Time'); ylabel('Amplitude');

clear 

%% Question 3

x = [0.25^2 , 2*0.25*0.5 , 2*(0.25^2) + 0.5^2 , 2*0.25*0.5, 0.25^2 ]; % calculating the vector
figure(2); bar(x); title('Question 3'); % plotting

clear
%% Question 4

x =randn(1,10000); % original noise
y=reshape(x,10,1000);
over_sample_x =mean(y); % oversampled noise
down_sample_x = downsample(x,10); % original noise with "jumps" of 10 elements

signal = ones(1,1000); % clean signal
over_sample_signal = signal + over_sample_x; % oversamples signal
down_sample_signal = signal + down_sample_x; % original signal with jumps

over_sample_snr = mean(over_sample_signal) / std(over_sample_x); % SNR of oversamples signal
original_snr = mean(signal) / std(down_sample_x); % SNR of signal with jumps

figure(3);  % plotting the signals
subplot(2,1,1); plot(down_sample_signal); title({'Question 4' ; 'Original Signal'});
subplot(2,1,2);plot(over_sample_signal); ylim([-2,5]); title('Over Sampled Signal');

clear

%% Question 5
k = 100000;
pure_signal = ones(1,k);
window = (ones(1,100)*(1/100));
all_trials = zeros(100,k); % calculating the window

signal_original = pure_signal + randn(1,k); % Original signal with noise
snr_original = mean(signal_original) / std(signal_original); % original signal SNR

%creating the all trials matrix
for i = 1 : 100 % Creating matrix of 100 trials
    noise = randn(1,k);
    all_trials(i,:) = pure_signal + noise ;
end

% a. Mean and then Smoothing
signal_a_mean = mean(all_trials,1); % mean on all signals
signal_a = smooth(signal_a_mean, 100); % smoothing on the mean signal
snr_a = mean(signal_a) / std(signal_a); % SNR calculation

% b. Smoothing and Mean
all_trials_smooth = zeros(100,k); % Creating a matrix for 100 smoothed signals
for i = 1 : 100
all_trials_smooth(i,:) = smooth(all_trials(i,:),100);
end

signal_b = mean(all_trials_smooth,1); % mean on all signals
snr_b = mean(signal_b)/ std(signal_b); % SNR calculation

figure(4);  % plotting
subplot(3,1,1); plot(signal_original); title({'Question 5' ; 'Original Signal'});  ylim([-5 , 5]);
subplot(3,1,2); plot(signal_a); title('Mean and Smooth Signal'); ylim([-5 , 5]);
subplot(3,1,3); plot(signal_b); title('Smooth and Mean Signal'); ylim([-5 , 5]);