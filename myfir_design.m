function [bi,bq]=myfir_design(N,nb)
output_file='output.xlsx';
writecell({'bi','bq','f0'},output_file);
f_cut_off=2000;
f_sampling=10000;

f_nyq=f_sampling/2;
f0=f_cut_off/f_nyq;

b=fir1(N,f0);
[h1,w1]=freqz(b);
bi=floor(b*2^(nb-1));
bq=bi/2^(nb-1);
[h2,w2]=freqz(bq);
writecell({'bi','bq','f0'},output_file,'WriteMode','append');
plot(w1/pi, 20*log10(abs(h1)));
hold on;
plot(w2/pi, 20*log10(abs(h2)));
grid on;
xlabel('Normalized frequency');
ylabel('dB');
end
