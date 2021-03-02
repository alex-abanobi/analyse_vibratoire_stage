clear all;
close all;

% nfZR_CS1_X = load('nfZR_CS1_X.mat');
% nfZR_CS1_X = nfZR_CS1_X.nfZR_CS1_X;

% nfZR_CS1_X = load('nfZR_CS1_X.mat');
% nfZR_CS1_X = nfZR_CS1_X.nfZR_CS1_X;
% nfZR_CS1_X = nfZR_CS1_X.*(1e6);
% 
% nfZR_CS2_X = load('nfZR_CS2_X.mat');
% nfZR_CS2_X = nfZR_CS2_X.nfZR_CS2_X;
% nfZR_CS2_X = nfZR_CS2_X.*(1e6);



nfZR_CS1_X = load('nfZR_CS1_X.mat');
nfZR_CS1_X = nfZR_CS1_X.ZR;
nfZR_CS1_X = nfZR_CS1_X.*(1e6);


nfZR_CS2_X = load('nfZR_CS2_X.mat');
nfZR_CS2_X = nfZR_CS2_X.ZR;
nfZR_CS2_X = nfZR_CS2_X.*(1e6);


LETMESEE = nfZR_CS2_X;


nfZR_CS2_X(:,274:330) = zeros(180000,57);

reff3 = zeros(19,1);
reff3(2:19) = (6:5:91); 
reff3(1) = 5;

cb = 16;
cb2 = 273;

%inserting stuff
for uiu = 1:18
    nfZR_CS2_X(:,cb+3:cb2+3) = nfZR_CS2_X(:,cb:cb2);
    nfZR_CS2_X(:,cb:cb+2) = nfZR_CS1_X(:,((reff3(uiu)*3)-2):(reff3(uiu)*3)); 
    
    cb = cb + 18;
    cb2 = cb2 + 3;
end
nfZR_CS2_X(:,328:330) = nfZR_CS1_X(:,((reff3(19)*3)-2):(reff3(19)*3));



juka = '';

ends = ['002';'003';'004';'005';'006';'007';'008';'009';'010';'011';'012';'013';'014';'015';'016';'017';'018';'019';'020'];


ends2 = ['021';'022';'023';'024';'025';'026';'027';'028';'029';'030';'031';'032';'033';'034';'035';'036';'037';'038';'039'];

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
   
        eval(['trancon' num2str(oj) '= nfZR_CS1_X(:,ccn:ccn+14);'])   
            %trancon1 = nfZR_CS1_X(:,ccn+1:ccn+14);     
        for iij = 1:15
            juka = strcat(juka, '%-14.4f ');
        end
        juki = strcat(juka, ' \n');
        
        for jii = 1:size(nfZR_CS1_X,1)
            eval(['set'  '= trancon' num2str(oj) '(jii,:);'])
            fprintf(fileID, juki, eval('set'));
            % fprintf(fileID, '\n');
        end
        juka = '';
        juki = '';
else
    eval(['trancon' num2str(19) '= nfZR_CS1_X(:,271:279);']) 
        for iij = 1:9
            juka = strcat(juka, '%-14.4f ');
            %juka = strcat(juka, '%-5.0f ');
        end
        juki = strcat(juka, ' \n');
        
        for jii = 1:size(nfZR_CS1_X,1)
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% CS2 SECTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ccn = 1;
for oj = 20:38
fileID = fopen(strcat('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\MAC_CITY\Citishark_Rotation8\trancon',num2str(oj),'.',ends2((oj-19),:)),'w+');
disp(fileID);
fprintf(fileID, strcat('Original file name: trancon',num2str(oj),'.',ends2((oj-19),:),'\n'));
fprintf(fileID, strcat('Transformed into: trancon',num2str(oj),'.',ends2((oj-19),:),'\n'));
fprintf(fileID, 'ReadCity version: 3.0\n');
fprintf(fileID, 'Station serial number: 005\n');
fprintf(fileID, 'Station software version: 0829\n');
fprintf(fileID, 'Channel number: 15\n');
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
if oj < 38
   
        eval(['trancon' num2str(oj) '= nfZR_CS2_X(:,ccn:ccn+17);'])   
            %trancon1 = nfZR_CS1_X(:,ccn+1:ccn+14);     
        for iij = 1:18
            juka = strcat(juka, '%-14.4f ');
        end
        juki = strcat(juka, ' \n');
        
        for jii = 1:size(nfZR_CS2_X,1)
            eval(['set'  '= trancon' num2str(oj) '(jii,:);'])
            fprintf(fileID, juki, eval('set'));
            % fprintf(fileID, '\n');
        end
        juka = '';
        juki = '';
else
    eval(['trancon' num2str(38) '= nfZR_CS2_X(:,325:330);']) 
        for iij = 1:6
            juka = strcat(juka, '%-14.4f ');
            %juka = strcat(juka, '%-5.0f ');
        end
        juki = strcat(juka, ' \n');
        
        for jii = 1:size(nfZR_CS2_X,1)
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

%nfZR_CS2_X

save('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\nfZR_CS2_X_used.mat','nfZR_CS2_X');

