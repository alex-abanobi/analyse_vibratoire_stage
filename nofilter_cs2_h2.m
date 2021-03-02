clear all
close all

%save('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\modeshape.mat','modeshape');
%save('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\modeshape02.mat','modeshape02');
modeshape = load('modeshape.mat');
modeshape = modeshape.modeshape;
modeshape02 = load('modeshape02.mat');
modeshape02 = modeshape02.modeshape02;

ZZ = load('ZZ.mat');
ZZ = ZZ.ZZ;


Z = ZZ;

Z_fen_group = zeros(180000,size(Z,2)/3);
G_fen_group = zeros(180000,size(Z,2)/3);


%ttv = [3.28, -4.52, 20.02, 9.4, 5.74, 12.43, 22.46, 34.21, 52.84, 60.19, 47.34, 23.7, -1.41, -6.49, 17.71];

tta = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% new rotation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

slopes_deg_for_other = load('slopes_deg_for_other.mat');
slopes_deg_for_other = slopes_deg_for_other.slopes_deg_for_other;

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
    
    Ax = [1, 0, 0; 0, cosd(tta), -sind(tta); 0, sind(tta), cosd(tta);]; %rotation matrix
    %Ay = [cosd(tta), 0, sind(tta); 0, 1, 0; -sind(tta), 0, cosd(tta); ]; %rotation matrix
    %Az = [cosd(tta), -sind(tta),0; sind(tta), cosd(tta),0; 0, 0, 1]; %rotation matrix
    
    
    %disp(tta);
    
    ZR(:,xxx:yyy) = ZR(:,xxx:yyy)*Ax; % rotating the data in three by three
    xxx = xxx+3;
    yyy = yyy+3;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% without filtration %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bac = 1;
for i=3:3:279
    Z_fen_group(:,bac) = abs(fft(ZR(:,i))); % take the fourier transform of 
    
    %G_fen(:,bac) = imag(fft(ZR(c:cc,i)));
    
    bac = bac + 1;
end % go to the next column of that same direction

%%%% external normalisation %%%%
Z_fen_group = fonc_fish2(Z_fen_group); % fish out the bad captors

%Z_fen_group = fonc_norm_mode(Z_fen_group);
%Z_fen_group = fonc_norm_ordinary5(Z_fen_group);

%Z_fen_group = fonc_norm_ordinary(Z_fen_group);
%Z_fen_group = fonc_norm_alreadyfished(Z_fen_group);
%Z_fen_group = fonc_norm_alreadyfished_step1(Z_fen_group);
%Z_fen_group = fonc_norm_mode1(Z_fen_group);
%Z_fen_group = fonc_norm_alreadyfished_all(Z_fen_group);


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

nuu = 1;
vvv_mode1 = load(strcat('vvx_mode',int2str(nuu),'.mat')); %%%% vvxmode is the numerical simulation on comsol
vv_mode1 = vvv_mode1.vvx; % 1948 * 1
gg = [23, 29, 32, 36, 38, 42, 44, 53, 57, 64]; % the list of the indices that carry the first 10 natural frequencies


save('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\nfZ_fen_group_CS2_Y_saved.mat','Z_fen_group');
save('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\nfZR_CS2_Y.mat','ZR');
