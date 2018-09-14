load('exr5data.mat')
event_vec = zeros(1,length(x1));
event_vec(eventtime) = 1;
%% a.
figure(1);
x1_corr = xcorr(x1,event_vec);
subplot(2,1,1);plot(x1_corr)
x2_corr = xcorr(x2,event_vec);
subplot(2,1,2);plot(x2_corr)

%% b.
figure(2);
cc_before = xcorr(x1,x2);
subplot(2,1,1);bar(cc_before)
shuffle_x1 = x1(randperm(length(x1)));
cc_after = xcorr(shuffle_x1,x2);
subplot(2,1,2);bar(cc_after)

%% c.
corr1 = corr(x1',x2');
corr2 = corr(shuffle_x1',x2');

