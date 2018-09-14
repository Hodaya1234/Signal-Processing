%% Question 1
Fs = 100.0;
Time = 2;
f = 20.0;
phase = 0.5;
phase_shift_1 = find_phase_shift(Fs, f, phase, Time);
phase_shift_2 = find_phase_shift(Fs, f / 2, phase, Time);
phase_shift_3 = find_phase_shift(Fs, f / 3, phase, Time);
phase_shift_4 = find_phase_shift(Fs, f / 4, phase, Time);
phase_shift_5 = find_phase_shift(Fs, f / 5, phase, Time);

% conclusion: the bigger Fs/f is, the result is more accurate

%% Question 4
t=0:0.001:3;
signal=sin(20*pi*t) + rand(1,length(t))*5;
res = xcorr(signal, signal);
plot(res)
title('CC Signal')
xlabel('Time(milisec)')
ylabel('Amplitude')

%% Question 5
load('ccMusic.mat');
ySnip = ySnip';

ccHeathens = xcorr(yHeathens, ySnip);
%max_ccHeathens = max(ccHeathens);
ccHurt = xcorr(yHurt, ySnip);
%max_ccHurt = max(ccHurt);
ccSilence = xcorr(ySilence, ySnip);
%max_ccSilence = max(ccSilence);
%result = max(max_ccHeathens, max_ccHurt, max_ccSilence);

figure(1)
subplot(1, 3, 1); plot(ccHeathens); title('Heathens CC');
subplot(1, 3, 2); plot(ccHurt);title('Hurt CC');
subplot(1, 3, 3); plot(ccSilence);title('Silence CC');
figure(2)
plot([ccHeathens;ccHurt;ccSilence])


%% Question 6
boardSize =10;
mat1 = [ones(boardSize,boardSize) zeros(boardSize,boardSize) ones(boardSize,boardSize) zeros(boardSize,boardSize) ];
mat2 = [zeros(boardSize,boardSize) ones(boardSize,boardSize) zeros(boardSize,boardSize) ones(boardSize,boardSize)];
 
mat=[mat1; mat2; mat1; mat2; ];

My = [1 1; -1 -1];
Mx = [1 1; -1 -1]';

deriv_x = conv2(mat, Mx);
deriv_y = conv2(mat, My);
result_mat = sqrt(deriv_x .^2 + deriv_y .^2);

figure(1);subplot(2,3,2);imshow(mat); title('Original Image')
subplot(2,3,4); imshow(deriv_x); title('X derivative')
subplot(2,3,5); imshow(deriv_y); title('Y derivative')
subplot(2,3,6); imshow(result_mat); title('X and Y derivatives')

figure(2);subplot(2,3,2);imshow(mat, [-3 3]); title('Original Image')
subplot(2,3,4); imshow(deriv_x, [-3 3]); title('X derivative')
subplot(2,3,5); imshow(deriv_y, [-3 3]); title('Y derivative')
subplot(2,3,6); imshow(result_mat, [-3 3]); title('X and Y derivatives')