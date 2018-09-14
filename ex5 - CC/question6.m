%% a.
load('exr5Datax1.mat')
auto_corr = xcorr(x1);
%% b.

%% c.
auto_corr(length(x1)) = [];
isi_vector = diff(auto_corr);
isi_std = std(isi_vector);
isi_mean = mean(isi_vector);
isi_cv = isi_std/isi_mean;

[counts,centers] = hist(isi_vector,1000);
counts = counts ./ sum(counts);





