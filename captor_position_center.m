clear all;
close all;
% this is the pillar position (position of sensors that are located exactly at the pillars) 
% starting from pillar 0
% the hypothesis from professor Guéguen is that captors are spaced
% unifromly between pillars. 
% there is generally two captors between two pillars apart from the captors
% at the pillars themselves. 

pillar_sensor_position = [0,3,0;
                   0,3,46.7;
                   -2.56, 4, 95.5;
                   -7, 4, 145;
                   -14, 5, 195;
                   -22, 6, 240.5;
                   -30, 6, 290.5;
                   -37, 7, 338;
                   -31, 7, 388;
                   -24, 6.5, 437;
                   -15, 6.5, 485;
                   -8, 6.5, 535.5;
                   -4, 6.5, 582;
                   -1, 6.5, 632;
                   -1, 6.5, 680;
                   -5, 7, 729;
                   -6, 7, 781;
                   -2, 7, 829;
                   9, 7, 877;
                   29, 6, 922.5;
                   57, 5.5, 961.5;
                   92, 5, 995;
                   128, 3.5, 1027;
                   167, 3, 1060;
                   197, 1.5, 1097;
                   219, 1, 1136;
                   233, 0, 1179.5;
                   239, 0, 1222;
                   235, 1, 1267.5;
                   224, 2, 1313.5;
                   205, 3, 1352;];
 
               
pillar_sensor_position_y_increase = pillar_sensor_position;
pillar_sensor_position_y_increase(:,1) = bsxfun(@plus, pillar_sensor_position(:,1), 50);             

plot(pillar_sensor_position(:,3), pillar_sensor_position(:,1));              

hold on;

plot(pillar_sensor_position_y_increase(:,3), pillar_sensor_position_y_increase(:,1));  

               
               