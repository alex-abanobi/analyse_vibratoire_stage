function ZR2 = rotation2(ZR2)

xxx = 1;
yyy = 3;

slopes_deg_for_other = load('slopes_deg_for_other.mat');
slopes_deg_for_other = slopes_deg_for_other.slopes_deg_for_other;
for ww = 1:size(ZR2,2)/3 % because one captor carries three columns of Z, H1 and H2
    
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
    
    ZR2(:,xxx:yyy) = ZR2(:,xxx:yyy)*Az; % rotating the data in three by three
    xxx = xxx+3;
    yyy = yyy+3;
end
end