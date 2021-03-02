clear all;
close all;


GSF = load('GSF.mat');
GSF = GSF.GSF;
GSF = GSF.*(1e6);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% INSERTING STUFF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% reff3 = zeros(19,1);
% reff3(2:19) = (6:5:91); 
% reff3(1) = 5;
% 
% cb = 16;
% cb2 = 273;
% 
% %inserting stuff
% for uiu = 1:18
%     GSF(:,cb+3:cb2+3) = GSF(:,cb:cb2);
%     GSF(:,cb:cb+2) = GSF(:,((reff3(uiu)*3)-2):(reff3(uiu)*3)); 
%     
%     cb = cb + 18;
%     cb2 = cb2 + 3;
% end
% GSF(:,328:330) = GSF(:,((reff3(19)*3)-2):(reff3(19)*3));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

juka = '';

ends = ['002';'003';'004';'005';'006';'007';'008';'009';'010';'011';'012';'013';'014';'015';'016';'017';'018';'019';'020'];


ends2 = ['021';'022';'023';'024';'025';'026';'027';'028';'029';'030';'031';'032';'033';'034';'035';'036';'037';'038';'039'];

mkdir('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\MAC_CITY\Citishark_Rotation10');
ccn = 1;
for oj = 1:19
fileID = fopen(strcat('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\MAC_CITY\Citishark_Rotation10\trancon',num2str(oj),'.',ends(oj,:)),'w+');
disp(fileID);
fprintf(fileID, strcat('Original file name: trancon',num2str(oj),'.',ends(oj,:),'\n'));
fprintf(fileID, strcat('Transformed into: trancon',num2str(oj),'.',ends(oj,:),'\n'));
fprintf(fileID, 'ReadCity version: 3.0\n');
fprintf(fileID, 'Station serial number: 005\n');
fprintf(fileID, 'Station software version: 0829\n');
fprintf(fileID, 'Channel number: 18\n');
fprintf(fileID, 'Starting date: 04.03.2006\n');
fprintf(fileID, 'Starting time: 15:31:34.572\n');
fprintf(fileID, 'Ending date: 04.03.2006\n');
fprintf(fileID, 'Ending time: 15:46:34.565\n');
fprintf(fileID, 'Sample rate: 200 Hz\n');
fprintf(fileID, 'Sample number: 180000\n');
%fprintf(fileID, 'Sample number: 12000\n');
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
   
        eval(['trancon' num2str(oj) '= GSF(:,ccn:ccn+17);'])   
            %trancon1 = GSF(:,ccn+1:ccn+14);     
        for iij = 1:18
            juka = strcat(juka, '%-14.0f ');
        end
        juki = strcat(juka, ' \n');
        
        for jii = 1:size(GSF,1)
            eval(['set'  '= trancon' num2str(oj) '(jii,:);'])
            fprintf(fileID, juki, eval('set'));
            % fprintf(fileID, '\n');
        end
        juka = '';
        juki = '';
else
    eval(['trancon' num2str(19) '= GSF(:,325:336);']) 
        for iij = 1:12
            juka = strcat(juka, '%-14.0f ');
            %juka = strcat(juka, '%-5.0f ');
        end
        juki = strcat(juka, ' \n');
        
        for jii = 1:size(GSF,1)
            eval(['set'  '= trancon' num2str(oj) '(jii,:);'])
            fprintf(fileID, juki, eval('set'));
            % fprintf(fileID, '\n');
        end
        juka = '';
        juki = '';
end
   ccn = ccn + 18;
   
   fclose(fileID);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% CS2 SECTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ccn = 1;
for oj = 20:38
fileID = fopen(strcat('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\MAC_CITY\Citishark_Rotation10\trancon',num2str(oj),'.',ends2((oj-19),:)),'w+');
disp(fileID);
fprintf(fileID, strcat('Original file name: trancon',num2str(oj),'.',ends2((oj-19),:),'\n'));
fprintf(fileID, strcat('Transformed into: trancon',num2str(oj),'.',ends2((oj-19),:),'\n'));
fprintf(fileID, 'ReadCity version: 3.0\n');
fprintf(fileID, 'Station serial number: 005\n');
fprintf(fileID, 'Station software version: 0829\n');
fprintf(fileID, 'Channel number: 18\n');
fprintf(fileID, 'Starting date: 04.03.2006\n');
fprintf(fileID, 'Starting time: 15:31:34.572\n');
fprintf(fileID, 'Ending date: 04.03.2006\n');
fprintf(fileID, 'Ending time: 15:46:34.565\n');
fprintf(fileID, 'Sample rate: 200 Hz\n');
fprintf(fileID, 'Sample number: 180000\n');
%fprintf(fileID, 'Sample number: 12000\n');
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
set = zeros(18,1);
if oj < 38
   
        eval(['trancon' num2str(oj) '= GSF(:,ccn:ccn+17);'])   
            %trancon1 = GSF(:,ccn+1:ccn+14);     
        for iij = 1:18
            juka = strcat(juka, '%-14.0f ');
        end
        juki = strcat(juka, ' \n');
        
        for jii = 1:size(GSF,1)
            eval(['set'  '= trancon' num2str(oj) '(jii,:);'])
            fprintf(fileID, juki, eval('set'));
            % fprintf(fileID, '\n');
        end
        juka = '';
        juki = '';
else
    eval(['trancon' num2str(38) '= GSF(:,325:336);']) 
        for iij = 1:12
            juka = strcat(juka, '%-14.0f ');
            %juka = strcat(juka, '%-5.0f ');
        end
        juki = strcat(juka, ' \n');
        
        for jii = 1:size(GSF,1)
            eval(['set'  '= trancon' num2str(oj) '(jii,:);'])
            fprintf(fileID, juki, eval('set'));
            % fprintf(fileID, '\n');
        end
        juka = '';
        juki = '';
end
   ccn = ccn + 18;
   
   fclose(fileID);
end

%GSF

%save('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\GSF_used.mat','GSF');

