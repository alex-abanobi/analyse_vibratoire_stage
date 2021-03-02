clear all;
close all;

Z_CS = load('Z_CS_citishark_complete93.mat');
Z_CS = Z_CS.Z_CS;

juka = '';

ends = ['002';'003';'004';'005';'006';'007';'008';'009';'010';'011';'012';'013';'014';'015';'016';'017';'018';'019';'020'];

mkdir('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\MAC_CITY\Citishark_Rotation8');
ccn = 1;
for oj = 1:19
fileID = fopen(strcat('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\MAC_CITY\Citishark_Rotation8\trancon',num2str(oj),'.',ends(oj,:)),'w+');
disp(fileID);
fprintf(fileID, strcat('Original file name: trancon',num2str(oj),'.',ends(oj,:),'\n'));
fprintf(fileID, strcat('Transformed into: trancon',num2str(oj),'.',ends(oj,:),'\n'));
fprintf(fileID, 'ReadCity version: 3.0\n');
fprintf(fileID, 'Station serial number: 005\n');
fprintf(fileID, 'Station software version: 0829\n');
fprintf(fileID, 'Channel number: 15\n');
fprintf(fileID, 'Starting date: 04.03.2006\n');
fprintf(fileID, 'Starting time: 15:31:34.572\n');
fprintf(fileID, 'Ending date: 04.03.2006\n');
fprintf(fileID, 'Ending time: 15:46:34.565\n');
%fprintf(fileID, 'Sample rate: 200 Hz\n');
fprintf(fileID, 'Sample rate: 13.33 Hz\n');
%fprintf(fileID, 'Sample number: 180000\n');
fprintf(fileID, 'Sample number: 12000\n');
fprintf(fileID, 'Recording duration: 15 mn\n');
fprintf(fileID, 'Conversion factor: 13107.2\n');
fprintf(fileID, 'Gain: 4\n');
fprintf(fileID, 'Clipped samples: 0.94%%\n');
fprintf(fileID, 'Latitude :   0  0.000 \n');
fprintf(fileID, 'Longitude:   0  0.000 \n');
fprintf(fileID, 'Altitude : 0 m\n');
fprintf(fileID, 'No. satellites: 0\n');
fprintf(fileID, 'Maximum amplitude: 32768 / 32768\n');
%fprintf(fileID, '\n');
%fprintf(fileID, '\n');

% I am going to do my own to be x, y, z
set = zeros(15,1);
if oj < 19
   
        eval(['trancon' num2str(oj) '= Z_CS(:,ccn:ccn+14);'])   
            %trancon1 = Z_CS(:,ccn+1:ccn+14);     
        for iij = 1:15
            juka = strcat(juka, '%-12.4f ');
        end
        juki = strcat(juka, ' \n');
        
        for jii = 1:size(Z_CS,1)
            eval(['set'  '= trancon' num2str(oj) '(jii,:);'])
            fprintf(fileID, juki, eval('set'));
            % fprintf(fileID, '\n');
        end
        juka = '';
        juki = '';
else
    eval(['trancon' num2str(19) '= Z_CS(:,271:279);']) 
        for iij = 1:9
            juka = strcat(juka, '%-12.4f ');
            %juka = strcat(juka, '%-5.0f ');
        end
        juki = strcat(juka, ' \n');
        
        for jii = 1:size(Z_CS,1)
            eval(['set'  '= trancon' num2str(oj) '(jii,:);'])
            fprintf(fileID, juki, eval('set'));
            % fprintf(fileID, '\n');
        end
        juka = '';
        juki = '';
end
   ccn = ccn + 15;
   
   
   
   
   
   
   
   
   
   
   
   fclose(fileID);
end




