clear all;
close all;
grandpositions93 = load('grandpositions93.mat');
grandpositions93 = grandpositions93.grandpositions93;


grandpositions94 = load('grandpositions94.mat');
grandpositions94 = grandpositions94.grandpositions94;



pillar_sensor_position_cs1_down = load('pillar_sensor_position_cs1_down.mat');
pillar_sensor_position_cs1_down = pillar_sensor_position_cs1_down.pillar_sensor_position_cs1_down;


pillar_sensor_position_cs1_down2 = load('pillar_sensor_position_cs1_down2.mat');
pillar_sensor_position_cs1_down2 = pillar_sensor_position_cs1_down2.pillar_sensor_position_cs1_down2;

figure
b = plot3(grandpositions94(:,1), grandpositions94(:,2),grandpositions94(:,3));              
hold on;
a = plot3(grandpositions93(:,1), grandpositions93(:,2),grandpositions93(:,3));                       
            
hold on;
c = scatter3(grandpositions93(:,1), grandpositions93(:,2),grandpositions93(:,3),20,'b','filled'); 
d = scatter3(grandpositions94(:,1), grandpositions94(:,2),grandpositions94(:,3),20,'g','filled'); 

e = scatter3(pillar_sensor_position_cs1_down(:,1), pillar_sensor_position_cs1_down(:,2),pillar_sensor_position_cs1_down(:,3),20,'k','filled'); 
f = scatter3(pillar_sensor_position_cs1_down2(:,1), pillar_sensor_position_cs1_down2(:,2),pillar_sensor_position_cs1_down2(:,3),20,'r','filled'); 



grid on;
grid minor;

set(gca,'fontname','adobe caslon pro bold')
xlabel('Distance along the absolute X-axis (m)')
ylabel('Distance along the absolute Y-axis (m)')
zlabel('Distance along the absolute Z-axis (m)')
% absolute there means that the axis is not following the shape of the
% bridge but from a fixed reference position.

title({'3D shape of the bridge deck and position of sensors from interpolated positions taking the positions', 'of the pillars from the numerical model in COMSOL software and interpolating a constant distance between sensors that are between two pillars'});
La2 = [a;b;c;d;e;f];
legend(La2,'Line - CS1','Line - CS2', 'Sensors on line - CS1','Sensors on line - CS2', 'Position of pillars - CS1','Position of pillars - CS2','Location','NorthWest');  

figure
e = scatter(pillar_sensor_position_cs1_down(:,1), pillar_sensor_position_cs1_down(:,2),'r','filled'); 
hold on;
f = plot(pillar_sensor_position_cs1_down(:,1), pillar_sensor_position_cs1_down(:,2),'r'); 

