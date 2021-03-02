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
%xtt = 0:sampling_freq/(size(Z_fen_group,1)):sampling_freq-sampling_freq/(size(Z_fen_group,1));
xtt = 0:sampling_freq/(size(Z_fen_group,1)):1;
xvv = 0:0.01:1;

Z_fen_group(1,:) = Z_fen_group(1,:)*0;
joc1 = anormb(p28y(:,2),Z_fen_group(1:61,7));
joc2 = anormb(p27y(:,2),Z_fen_group(1:61,9));
joc3 = anormb(p26y(:,2),Z_fen_group(1:61,13));
joc4 = anormb(p25y(:,2),Z_fen_group(1:61,15));
joc5 = anormb(p24y(:,2),Z_fen_group(1:61,18));
joc6 = anormb(p23y(:,2),Z_fen_group(1:61,20));
joc7 = anormb(p22y(:,2),Z_fen_group(1:61,27));
joc8 = anormb(p21y(:,2),Z_fen_group(1:61,30));

subplot(2,4,1)
b = plot(xtt, Z_fen_group(1:61,7)); %p28
hold on;
a = plot(xvv, joc1); %p28
xlim([0 1])  
%ylim([0 25]) 
xlabel('Frequency (Hz)');
ylabel('amplitude');
title({'FRF vs Experimental Spectrum - Y axis : Pillar 28'});
set(gca,'fontname','adobe caslon pro bold')
L = [a;b];
legend(L,'Numerical Model','Experimental Model', 'Location','NorthEast');
grid on;
grid minor;


subplot(2,4,2)
b = plot(xtt, Z_fen_group(1:61,9)); %p27
xlim([0 1]) 
%ylim([0 25]) 
hold on;
a = plot(xvv, joc2); %p28
xlabel('Frequency (Hz)');
ylabel('amplitude');
title({'FRF vs Experimental Spectrum - Y axis : Pillar 27'});
set(gca,'fontname','adobe caslon pro bold')
L = [a;b];
legend(L,'Numerical Model','Experimental Model', 'Location','NorthEast');
grid on;
grid minor;


subplot(2,4,3)
b = plot(xtt, Z_fen_group(1:61,13)); %p26
xlim([0 1])  
%ylim([0 25])
hold on;
a = plot(xvv, joc3); %p28
xlabel('Frequency (Hz)');
ylabel('amplitude');
title({'FRF vs Experimental Spectrum - Y axis : Pillar 26'});
set(gca,'fontname','adobe caslon pro bold')
L = [a;b];
legend(L,'Numerical Model','Experimental Model', 'Location','NorthEast');
grid on;
grid minor;




subplot(2,4,4)
b = plot(xtt, Z_fen_group(1:61,15)); %p25
xlim([0 1])  
%ylim([0 25]) 
hold on;
a = plot(xvv, joc4); %p28
xlabel('Frequency (Hz)');
ylabel('amplitude');
title({'FRF vs Experimental Spectrum - Y axis : Pillar 25'});
set(gca,'fontname','adobe caslon pro bold')
L = [a;b];
legend(L,'Numerical Model','Experimental Model', 'Location','NorthEast');
grid on;
grid minor;


subplot(2,4,5)
b = plot(xtt, Z_fen_group(1:61,18));
xlim([0 1])  
%ylim([0 25]) 
hold on;
a = plot(xvv, joc5); %p28
xlabel('Frequency (Hz)');
ylabel('amplitude');
title({'FRF vs Experimental Spectrum - Y axis : Pillar 24'});
set(gca,'fontname','adobe caslon pro bold')
L = [a;b];
legend(L,'Numerical Model','Experimental Model', 'Location','NorthEast');
grid on;
grid minor;


subplot(2,4,6)
b = plot(xtt, Z_fen_group(1:61,20));
xlim([0 1])  
%ylim([0 25])
hold on;
a = plot(xvv, joc6); %p28
xlabel('Frequency (Hz)');
ylabel('amplitude');
title({'FRF vs Experimental Spectrum - Y axis : Pillar 23'});
set(gca,'fontname','adobe caslon pro bold')
L = [a;b];
legend(L,'Numerical Model','Experimental Model', 'Location','NorthEast');
grid on;
grid minor;


subplot(2,4,7)
b = plot(xtt, Z_fen_group(1:61,27));
xlim([0 1])  
%ylim([0 25]) 
hold on;
a = plot(xvv, joc7); %p28
xlabel('Frequency (Hz)');
ylabel('amplitude');
title({'FRF vs Experimental Spectrum - Y axis : Pillar 22'});
set(gca,'fontname','adobe caslon pro bold')
L = [a;b];
legend(L,'Numerical Model','Experimental Model', 'Location','NorthEast');
grid on;
grid minor;

% subplot(3,3,5)
% plot(xtt, Z_fen_group(:,25)) % removed captor p22,
% xlim([0 1])  

subplot(2,4,8)
b = plot(xtt, Z_fen_group(1:61,30));
xlim([0 1])  
%ylim([0 25]) 
hold on;
a = plot(xvv, joc8); %p28
xlabel('Frequency (Hz)');
ylabel('amplitude');
title({'FRF vs Experimental Spectrum - Y axis : Pillar 21'});
set(gca,'fontname','adobe caslon pro bold')
L = [a;b];
legend(L,'Numerical Model','Experimental Model', 'Location','NorthEast');
grid on;
grid minor;



height = 700;
width = 2500;

%sgtitle('I am a super title')
set(gcf,'position',[100,0,width,height])


% figure 
% plot(abs(fft(vvx)))



% subplot(3,3,5)
% plot(xtt, Z_fen_group(:,5))
% xlim([0 1])  