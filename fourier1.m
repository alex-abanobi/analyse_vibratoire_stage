function [PKS,LOCSE] = fourier1(n,dt, vector)
v_fft = fft(vector);
v_fftplot = abs(v_fft);
sampling_period = dt;
sampling_freq = 1/sampling_period;
xt = 0:sampling_freq/(length(vector)):sampling_freq-sampling_freq/(length(vector));
%xt = sampling_freq/(length(vector)):sampling_freq/(length(vector)):sampling_freq;
%xt = linspace(0,sampling_freq-sampling_freq/(length(vector)),length(v_fftplot));
% disp(length(xt));
% disp(length(vector));


figure(n);
plot(xt,v_fftplot);
hold on;
ylabel('La Norm de l''Amplitude (m)');
xlabel('Frequences (Hz)');
title('La transformée de Fourier');
grid on;
grid minor;



xIndex = find(v_fftplot == max(v_fftplot), 1, 'first');
maxXValue = xt(xIndex);



%disp(maxXValue)
xlim([0 100]);
ylim([0 1.11*max(v_fftplot)]);
% width=1200;
% height=600;
%set(gcf,'position',[100,100,width,height])

%disp(sqrt(v_fft))


% [PKS,LOCS]= findpeaks(vector);
% LOCSE = (1/dt)/length(vector) * LOCS;


end