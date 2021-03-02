clear all
close all

%save('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\modeshape.mat','modeshape');
%save('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\modeshape02.mat','modeshape02');
modeshape = load('modeshape.mat');
modeshape = modeshape.modeshape;
modeshape02 = load('modeshape02.mat');
modeshape02 = modeshape02.modeshape02;

Z = load('Z.mat');
Z = Z.Z;

Z_fen = zeros(12000,29);
G_fen = zeros(12000,29);
Z_fen_group = zeros(12000,size(Z,2)/3);
G_fen_group = zeros(12000,size(Z,2)/3);


%ttv = [3.28, -4.52, 20.02, 9.4, 5.74, 12.43, 22.46, 34.21, 52.84, 60.19, 47.34, 23.7, -1.41, -6.49, 17.71];

tta = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% new rotation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

slopes_deg_for_other = load('slopes_deg_for_other.mat');
slopes_deg_for_other = slopes_deg_for_other.slopes_deg_for_other;
%slopes_deg_for_other = - slopes_deg_for_other;

%ROTATION CS1
xxx = 1;
yyy = 3;



wpe_x = 1;
ZR = zeros(size(Z,1),size(Z,2));  % this will put it back in x y z form because before it was in z x y
for wd_x = 2:3:size(Z,2)
    ZR(:,wpe_x) = Z(:,wd_x);
    wpe_x = wpe_x + 3;
end


wpe_y = 2;
for wd_y = 3:3:size(Z,2)
    ZR(:,wpe_y) = Z(:,wd_y);
    wpe_y = wpe_y + 3;
end


wpe_z = 3;
for wd_z = 1:3:size(Z,2)
    ZR(:,wpe_z) = Z(:,wd_z);
    wpe_z = wpe_z + 3;
end


for ww = 1:size(Z,2)/3 % because one captor carries three columns of Z, H1 and H2
    
        if ww < 4
        tta = slopes_deg_for_other(1);
        
        elseif ww < 8
        tta = slopes_deg_for_other(2);

        elseif ww < 11
        tta = slopes_deg_for_other(3);

        elseif ww < 15
        tta = slopes_deg_for_other(4);

        elseif ww < 18
        tta = slopes_deg_for_other(5);

        elseif ww < 22
        tta = slopes_deg_for_other(6);

         elseif ww < 26
        tta = slopes_deg_for_other(7);

         elseif ww < 29
        tta = slopes_deg_for_other(8);

         elseif ww < 33
        tta = slopes_deg_for_other(9);

         elseif ww < 36
        tta = slopes_deg_for_other(10);

         elseif ww < 40
        tta = slopes_deg_for_other(11);

         elseif ww < 44
        tta = slopes_deg_for_other(12);
        
        elseif ww < 47
        tta = slopes_deg_for_other(13);

         elseif ww < 51
        tta = slopes_deg_for_other(14);

         elseif ww < 55
        tta = slopes_deg_for_other(15);
          
         elseif ww < 58
        tta = slopes_deg_for_other(16);
        
        elseif ww < 62
        tta = slopes_deg_for_other(17);
        
        
        elseif ww < 65
        tta = slopes_deg_for_other(18);
        
        
        elseif ww < 73
        tta = slopes_deg_for_other(19);
        
        elseif ww < 76
        tta = slopes_deg_for_other(20);
        
        elseif ww < 80
        tta = slopes_deg_for_other(21);
        
        elseif ww < 83
        tta = slopes_deg_for_other(22);
        
        elseif ww < 87
        tta = slopes_deg_for_other(23);
        
        elseif ww < 90
        tta = slopes_deg_for_other(24);
        
        
        elseif ww < 94
        tta = slopes_deg_for_other(25);
        
        elseif ww < 96
        tta = slopes_deg_for_other(26);
        
        
        elseif ww < 100
        tta = slopes_deg_for_other(27);
        
        elseif ww < 102
        tta = slopes_deg_for_other(28);
        
        elseif ww < 106
        tta = slopes_deg_for_other(29);
        
        elseif ww <= 112
        tta = slopes_deg_for_other(30);


        end
    
    %Ax = [1, 0, 0; 0, cosd(tta), -sind(tta); 0, sind(tta), cosd(tta);]; %rotation matrix
    %Ay = [cosd(tta), 0, sind(tta); 0, 1, 0; -sind(tta), 0, cosd(tta); ]; %rotation matrix
    Az = [cosd(tta), -sind(tta),0; sind(tta), cosd(tta),0; 0, 0, 1]; %rotation matrix
    
    
    %disp(tta);
    
    ZR(:,xxx:yyy) = ZR(:,xxx:yyy)*Az; % rotating the data in three by three
    xxx = xxx+3;
    yyy = yyy+3;
end



%averaging with windows of 1 minute size and overlap of 30 seconds
dd=1;
for jjc = 2:3:size(Z,2) 
c = 1;
cc = 12000;
for i=1:29
    Z_fen(:,i) = abs(fft(ZR(c:cc,jjc))); % take the fourier transform of 
    
    G_fen(:,i) = imag(fft(ZR(c:cc,jjc)));
    %every minute (12000) and overlap 30 seconds (6000)
    c = c + 6000;
    cc = cc + 6000;
    
    % Z_fen is the matrix that contains the FFT little 1min 30sec overlap 
end

Z_fen_moy = zeros(size(Z_fen,1),1); % initialize the matrix that will hold
G_fen_moy = zeros(size(G_fen,1),1); % initialize the matrix that will hold


for j = 1:size(Z_fen,1)
    Z_fen_moy(j,1) = mean(Z_fen(j,:)); % take the mean horizontally of all 
    G_fen_moy(j,1) = mean(G_fen(j,:)); % take the mean horizontally of all 

    %the columns. The FT is the same along a column no matter how many 
    %subsets windows of that column you make
end


Z_fen_group(:,dd) = Z_fen_moy;
G_fen_group(:,dd) = G_fen_moy;

dd = dd + 1;
end % go to the next column of that same direction


%%%% external normalisation %%%%
Z_fen_group = fonc_fish(Z_fen_group); % fish out the bad captors
Z_fen_group22 = Z_fen_group;
%Z_fen_group = fonc_norm_mode(Z_fen_group);
Z_fen_group = fonc_norm_ordinary5(Z_fen_group);

%Z_fen_group = fonc_norm_ordinary(Z_fen_group);
%Z_fen_group = fonc_norm_alreadyfished(Z_fen_group);
%Z_fen_group = fonc_norm_alreadyfished_step1(Z_fen_group);
%Z_fen_group = fonc_norm_mode1(Z_fen_group);
Z_fen_group2 = fonc_norm_alreadyfished_all(Z_fen_group22);


%%%% THIS IS WHERE YOU TRY TO EXTRACT PHASE INFORMATION..

G_fen_sign = zeros(size(G_fen_group,1),size(G_fen_group,2));

for hik = 1:size(Z_fen_group,2)
    for hij = 1:size(Z_fen_group,2)

        if G_fen_group(hik,hij) < 0
            G_fen_sign(hik,hij) = -1;
        else
            G_fen_sign(hik,hij) = 1;
        end
    end
end
G_fen_sign = fonc_fish(G_fen_sign);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 


% for pik = 1:size(Z_fen_group,2)
%     for pij = 1:size(Z_fen_group,2)
% 
%         if G_fen_group(pik,pij) < 0
%             G_fen_sign(pik,pij) = -1;
%         else
%             G_fen_sign(pik,pij) = 1;
%         end
%     end
% end
% G_fen_sign = fonc_fish(G_fen_sign);

for nuu = 1:10
%nuu = 2;
vvv_mode1 = load(strcat('vvy_mode',int2str(nuu),'.mat')); %%%% vvxmode is the numerical simulation on comsol
vv_mode1 = vvv_mode1.vvy; % 1948 * 1
gg = [23, 29, 32, 36, 38, 42, 44, 53, 57, 64]; % the list of the indices that carry the first 10 natural frequencies


save('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\Z_fen_group_CS1_Y_saved.mat','Z_fen_group');
save('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ZR_CS1_Y.mat','ZR');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [aa,bb] = fourier1(1,(1/200),Z_fen_moy);
[PKS,LOCS]= findpeaks(Z_fen_moy);
LOCSE = ((200)/length(Z_fen_moy)) * LOCS;


figure
cd1 = 0:(1/60):(12000/60);
cd2 = linspace(0,size(Z_fen_group,2),12001);
plot(cd1,cd2);
clims = [0 1];
h = imagesc((Z_fen_group)/10, clims);
%h = imagesc((Z_fen_group)/100000, clims);
hold on
set(h, 'XData', [1,cd2(end)]);
set(h, 'YData', [0,cd1(end)]);
ylim([0,2])
set(gca,'fontname','adobe caslon pro bold')
hcb = colorbar('SouthOutside');
colorTitleHandle = get(hcb,'Title');
titleString = ('Amplitude of the Modal Frequencies');
set(colorTitleHandle ,'String',titleString);
xlabel('Sensors (1-93) along the bridge deck : Y-axis')
ylabel('Modal Frequencies (Hz)')
title({'Evolution of modal frequencies as a function of the position of the', 'sensors (1-93) along the bride deck, Y direction, Line CS1 (windowed and averaged)'});
height = 500;
width = 700;
set(gcf,'position',[100,0,width,height])

%sampling_freq = 200;


%interp
%sgolay
% for xa = 1:112
%     %figure
%     xtt = 0:sampling_freq/(length(Z_fen_moy)):sampling_freq-sampling_freq/(length(Z_fen_moy));
%     plot(xtt,Z_fen_group(:,xa))
%     xlim([0,6])
%     grid on
%     grid minor
%     xlabel('Fréquences (Hz)')
%     ylabel('Amplitude')
%     title(strcat('Spectre du capteur  ',int2str(xa), ' suivant l''axe H2 pour le channel CS1'))
%     set(gca,'fontname','adobe caslon pro bold')
%     saveas(gcf,strcat('spectreh2_sansnorm_cs1/cap',int2str(xa),'.png'))
% end
% 
% 




%save('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ndist.mat','ndist')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%% THIS IS THE PLACE WHERE I TRY TO MAKE SURE THAT THE LENGTH 
%%%%%% OF THE SPACING VECTOR IS THE SAME 93 FOR BOTH THE NUMERICAL AND THE 
%%%%%%%%%%% EXPERIEMENTAL DATA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
corresponding1 = load('corresponding1.mat');
corresponding1 = corresponding1.corresponding1;

grandpositions93 = load('grandpositions93.mat');
grandpositions93 = grandpositions93.grandpositions93;

jup = 1;
vv_mode1_1 = zeros(93,1);
for yu = 1:length(corresponding1)
    vv_mode1_1(jup) = vv_mode1(corresponding1(yu));
    jup = jup + 1;
end



%%%$$$$$$$$$$$$$$$ MODE SHAPE $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
figure
jado = anormb(vv_mode1_1,Z_fen_group2(gg(nuu),:));
aa = plot(grandpositions93(:,1), jado);
hold on;
ba = plot(grandpositions93(:,1), flip(Z_fen_group2(gg(nuu),:))); % exp
La = [ba;aa];
legend(La,'Experimental Model','Numerical Model', 'Location','NorthWest');
grid on;
grid minor;
xlim([0 max(grandpositions93(:,1))])
set(gca,'fontname','adobe caslon pro bold')
xlabel('Spatial distance along Y-axis (m)')
ylabel('Amplitude of the mode shape')
title({strcat('Mode Shape ', int2str(nuu), ': Y-axis - Line CS1'),'Normalisation with averaging of 2 points around normalized frequency'});
height = 500;
width = 700;
set(gcf,'position',[100,0,width,height])

%%%$$$$$$$$$$$$$$$ MODE SHAPE $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
figure
jado = anormb(vv_mode1_1,Z_fen_group(gg(nuu),:));
aa = plot(grandpositions93(:,1), jado);
hold on;
ba = plot(grandpositions93(:,1), flip(Z_fen_group(gg(nuu),:))); % exp
La = [ba;aa];
legend(La,'Experimental Model','Numerical Model', 'Location','NorthWest');
grid on;
grid minor;
xlim([0 max(grandpositions93(:,1))])
set(gca,'fontname','adobe caslon pro bold')
xlabel('Spatial distance along Y-axis (m)')
ylabel('Amplitude of the mode shape')
title({strcat('Mode Shape ', int2str(nuu), ': Y-axis - Line CS1'),'Normalisation without averaging around normalized frequency'});
height = 500;
width = 700;
set(gcf,'position',[100,0,width,height])

end