clear all;
close all;

p28y = [];

p27y = [];

p26y = [];

p25y = [];

p24y = [];

p23y = [];

p22y = [];

p21y = [];





















Z_fen_group = load('Z_fen_group_saved.mat');

Z_fen_group = Z_fen_group.Z_fen_group;

sampling_freq = 200;
xtt = 0:sampling_freq/(size(Z_fen_group,1)):sampling_freq-sampling_freq/(size(Z_fen_group,1));


subplot(2,4,1)
plot(xtt, Z_fen_group(:,7)) %p28
xlim([0 1])  
ylim([0 25]) 
xlabel('Frequency (Hz)');
ylabel('amplitude');
title({'FRF vs Experimental Spectrum - Y axis : Pillar 28'});
set(gca,'fontname','adobe caslon pro bold')

subplot(2,4,2)
plot(xtt, Z_fen_group(:,9)) %p27
xlim([0 1]) 
ylim([0 25]) 
xlabel('Frequency (Hz)');
ylabel('amplitude');
title({'FRF vs Experimental Spectrum - Y axis : Pillar 27'});
set(gca,'fontname','adobe caslon pro bold')

subplot(2,4,3)
plot(xtt, Z_fen_group(:,13)) %p26
xlim([0 1])  
ylim([0 25]) 
xlabel('Frequency (Hz)');
ylabel('amplitude');
title({'FRF vs Experimental Spectrum - Y axis : Pillar 26'});
set(gca,'fontname','adobe caslon pro bold')


subplot(2,4,4)
plot(xtt, Z_fen_group(:,15)) %p25
xlim([0 1])  
ylim([0 25]) 
xlabel('Frequency (Hz)');
ylabel('amplitude');
title({'FRF vs Experimental Spectrum - Y axis : Pillar 25'});
set(gca,'fontname','adobe caslon pro bold')


subplot(2,4,5)
plot(xtt, Z_fen_group(:,18))
xlim([0 1])  
ylim([0 25]) 
xlabel('Frequency (Hz)');
ylabel('amplitude');
title({'FRF vs Experimental Spectrum - Y axis : Pillar 24'});
set(gca,'fontname','adobe caslon pro bold')


subplot(2,4,6)
plot(xtt, Z_fen_group(:,20))
xlim([0 1])  
ylim([0 25])
xlabel('Frequency (Hz)');
ylabel('amplitude');
title({'FRF vs Experimental Spectrum - Y axis : Pillar 23'});
set(gca,'fontname','adobe caslon pro bold')


subplot(2,4,7)
plot(xtt, Z_fen_group(:,27))
xlim([0 1])  
ylim([0 25]) 
xlabel('Frequency (Hz)');
ylabel('amplitude');
title({'FRF vs Experimental Spectrum - Y axis : Pillar 22'});
set(gca,'fontname','adobe caslon pro bold')


% subplot(3,3,5)
% plot(xtt, Z_fen_group(:,25)) % removed captor p22,
% xlim([0 1])  

subplot(2,4,8)
plot(xtt, Z_fen_group(:,30))
xlim([0 1])  
ylim([0 25]) 
xlabel('Frequency (Hz)');
ylabel('amplitude');
title({'FRF vs Experimental Spectrum - Y axis : Pillar 21'});
set(gca,'fontname','adobe caslon pro bold')



height = 700;
width = 2500;

%sgtitle('I am a super title')
set(gcf,'position',[100,0,width,height])


% figure 
% plot(abs(fft(vvx)))



% subplot(3,3,5)
% plot(xtt, Z_fen_group(:,5))
% xlim([0 1])  