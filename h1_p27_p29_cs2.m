clear all
close all
load('D:\abanobi\Documents\STAGE ISTERRE\gueguen\Archive\ERGATZ\CS2\060304_1326.002.mat')

vector = Z(:,2);
dt = 0.005;
sampling_period = dt;
sampling_freq = 1/sampling_period;
xt = 0:sampling_freq/(length(vector)):sampling_freq-sampling_freq/(length(vector));

Z_fen = zeros(12000,29);
Z_fen_group = zeros(12000,size(Z,2)/3);


tta = 3.28; % angle of rotation

A = [cosd(tta), -sind(tta),0; sind(tta), cosd(tta),0; 0, 0, 1]; %rotation matrix


xxx = 1;
yyy = 3;
for ww = 1:size(Z,2)/3
    Z(:,xxx:yyy) = Z(:,xxx:yyy)*A; % rotating the data in three by three
    xxx = xxx+3;
    yyy = yyy+3;
end




%averaging with windows of 1 minute size and overlap of 30 seconds
dd=1;
for jjc = 2:3:size(Z,2) % 1 for Z, 2 for H1, 3 for H2... this is done per column..
c = 1;
cc = 12000;
for i=1:29
    Z_fen(:,i) = abs(fft(Z(c:cc,jjc))); % take the fourier transform of 
    %every minute (12000) and overlap 30 seconds (6000)
    c = c + 6000;
    cc = cc + 6000;
    
    % Z_fen is the matrix that contains the FFT little 1min 30sec overlap 
end

Z_fen_moy = zeros(size(Z_fen,1),1); % initialize the matrix that will hold

for j = 1:size(Z_fen,1)
    Z_fen_moy(j,1) = mean(Z_fen(j,:)); % take the mean horizontally of all 
    %the columns. The FT is the same along a column no matter how many 
    %subsets windows of that column you make
end


Z_fen_group(:,dd) = Z_fen_moy;
dd = dd + 1;
end % go to the next column of that same direction


% [aa,bb] = fourier1(1,(1/200),Z_fen_moy);
[PKS,LOCS]= findpeaks(Z_fen_moy);
LOCSE = ((200)/length(Z_fen_moy)) * LOCS;

figure
cd1 = 0:(1/60):(12000/60);
cd2 = linspace(0,6,12001);
plot(cd1,cd2);
h = imagesc(Z_fen_group);
hold on
set(h, 'XData', [1,cd2(end)]);
set(h, 'YData', [0,cd1(end)]);
ylim([0,20])
set(gca,'fontname','adobe caslon pro bold')
hcb = colorbar('SouthOutside');
colorTitleHandle = get(hcb,'Title');
titleString = ('Amplitudes des fréquences modales');
set(colorTitleHandle ,'String',titleString);

xlabel('Capteurs (1-6) de la travée (P27-P29) suivant l''axe H1')
ylabel('Frequences modales (Hz)')
title({'Evolution des fréquences modales en fonction de la position des capteurs', 'suivant l''axe H1'});
% height = 700;
% width = 900;
% set(gcf,'position',[100,-200,width,height])



figure
xtt = 0:sampling_freq/(length(Z_fen_moy)):sampling_freq-sampling_freq/(length(Z_fen_moy));
plot(xtt,Z_fen_moy)
xlim([0,20])
grid on
grid minor
xlabel('Fréquences (Hz)')
ylabel('Amplitude')
title('Spectre de la capteur 6 de la travée (P27-P29) suivant l''axe H1')
set(gca,'fontname','adobe caslon pro bold')


%figure
%imagesc(xtt, Z_fen_group)