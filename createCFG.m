close all;
clear all;

%[filename, permission, machineformat, encoding] = fopen('cfg_alex.cfg','w+');
fileID = fopen('.\MAC_CITY\cfg_alex.cfg','w+');

for iij = 1:70
    fprintf(fileID, '-');
end

fprintf(fileID, '\n');

fprintf(fileID, 'This is the header with the name of the structure \n'); 
fprintf(fileID, 'The title is a line without special characters. \n');
fprintf(fileID, 'Header \n');
fprintf(fileID, 'Pont Le Fayet - Chamonix ... Alexander ABANOBI\n');
%fprintf(fileID, 'stage isterre \n');

for iij = 1:70
    fprintf(fileID, '-');
end
fprintf(fileID, '\n');
fprintf(fileID, '\n');

fprintf(fileID, 'This is the recorded nodes definition group. \n');
fprintf(fileID, 'Node Number, X-coordinate, Y-coordinate, Z-coordinate.\n');
fprintf(fileID, '\n');

%nodes_matrix = zeros((93+91),4);
nodes_matrix = zeros((75),4);
adnodes_matrix = zeros(93,4);
lines_matrix = zeros(164,2);

grandpositions93 = load('grandpositions93.mat');
grandpositions93 = grandpositions93.grandpositions93;

grandpositions94 = load('grandpositions94.mat');
grandpositions94 = grandpositions94.grandpositions94;


grandpositions94(:,2) = bsxfun(@plus, grandpositions94(:,2), 50);


%picked_dist = flip(picked_dist);

for yi = 1:93
    nodes_matrix(yi,1) = yi;
    nodes_matrix(yi,2) = grandpositions93(yi,1);
    nodes_matrix(yi,3) = grandpositions93(yi,2);
    nodes_matrix(yi,4) = grandpositions93(yi,3);
end


for yi = 94:(93+91)
    nodes_matrix((yi),1) = yi;
    nodes_matrix((yi),2) = grandpositions94((yi-93),1);
    nodes_matrix((yi),3) = grandpositions94((yi-93),2);
    nodes_matrix((yi),4) = grandpositions94((yi-93),3);
end


%%%% This makes the next line reference not carry a different coordinate.
ji = 1;
for jij = 6:5:93
    tb(ji) = jij;
    ji = ji +1;
end
nodes_matrix(tb,:) = [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


fprintf(fileID, 'Nodes\n');
for inodes = 1:size(nodes_matrix,1)
   fprintf(fileID, '%-2d %4.2f %4.2f %4.2f \n', nodes_matrix(inodes,:)); 
end

fprintf(fileID, '\n');







%fprintf(fileID, 'AddNodes\n');
% for inodes = 1:size(adnodes_matrix,1)
%    fprintf(fileID, '%-2d %4.2f %4.2f %4.2f \n', adnodes_matrix(inodes,:)); 
% end
% 
% for iij = 1:70
%     fprintf(fileID, '-');
% end
% fprintf(fileID, '\n');
% fprintf(fileID, '\n');

fprintf(fileID, 'This is the line definition group. \n');
fprintf(fileID, 'From Node Number, To Node Number, whatever if the node is recorded or additional\n');
fprintf(fileID, '\n');



for yi = 1:74
    lines_matrix(yi,1) = nodes_matrix(yi);
    lines_matrix(yi,2) = nodes_matrix(yi+1);
end

for yi = 76:165
    lines_matrix(yi-1,1) = nodes_matrix(yi);
    lines_matrix(yi-1,2) = nodes_matrix(yi+1);
end


fprintf(fileID, 'Lines\n');
for inodes = 1:size(lines_matrix,1)
   fprintf(fileID, '%-2d %-2d \n', lines_matrix(inodes,:)); 
end

fprintf(fileID, '%-2d %-2d \n', [1 94]);
fprintf(fileID, '%-2d %-2d \n', [93 184]);



for iij = 1:70
    fprintf(fileID, '-');
end
fprintf(fileID, '\n');
fprintf(fileID, '\n');

fprintf(fileID, 'This is the type of files. Available types Cityshark, ASCII Fs (columnwise where Fs \n');
fprintf(fileID, 'is the frequency of sampling), SAC_HDV (Directory of SAC files in format of the\n');
fprintf(fileID, 'Permanent Instrumentation of La Fayet-Chamonix bridge) or SAC_FACTOR (Directory of SAC \n');
fprintf(fileID, 'files in format of the Permanent Instrumentation of UCLA Factor building)\n');
fprintf(fileID, '\n');
fprintf(fileID, '\n');



fprintf(fileID, 'Type\n');
fprintf(fileID, 'Cityshark\n');

fprintf(fileID, '\n');
fprintf(fileID, '\n');

for iij = 1:70
    fprintf(fileID, '-');
end
fprintf(fileID, '\n');
fprintf(fileID, '\n');


fprintf(fileID, 'Description of the setups block (repeated for each Dataset)\n');
fprintf(fileID, 'Number of Measurement\n');
fprintf(fileID, 'path of the file (complete or relative)\n');
fprintf(fileID, 'structure of the file : Node Number, Component (X=1,Y=2,Z=3) \n');
fprintf(fileID, 'Put 0 if the column has to be ignored (bad recording) but add an equation to fill the\n');
fprintf(fileID, 'ignored component, type - if the recording is reversed\n');
fprintf(fileID, '\n');
fprintf(fileID, '\n');



measurement_matrix = zeros(279,2);

%%%% definition of the measurement matrix first row
ub = 1;
cj = 0;
for uj = 1:93
    for ui = (1+(3*cj)):(1+(3*cj))+2
        measurement_matrix(ui,2) = ub;
        ub = ub + 1;
    end 
    ub = 1;
    cj = cj + 1;
end


%%%%% definition of the measurement matrix second row.
ub = 1;
cj = 0;
for uj = 1:93
    for ui = (1+(3*cj)):(1+(3*cj))+2
        measurement_matrix(ui,1) = ub;
    end 
    ub = ub + 1;
    cj = cj + 1;
end



measurement_matrix2 = zeros((273+54+3),2);

%%%% definition of the measurement matrix second row
ub = 1;
cj = 0;
for uj = 1:(91+19)
    for ui = (1+(3*cj)):(1+(3*cj))+2
        measurement_matrix2(ui,2) = ub;
        ub = ub + 1;
    end 
    ub = 1;
    cj = cj + 1;
end


%%%%% definition of the measurement matrix first row.
ub = 94;
cj = 0;
for uj = 1:91
    for ui = (1+(3*cj)):(1+(3*cj))+2
        measurement_matrix2(ui,1) = ub;
    end 
    ub = ub + 1;
    cj = cj + 1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% PUTTING REFERENCE FOR THE CS2 LINE %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
reff2 = zeros(19,1);
reff2(2:19) = (5:5:90); 
reff2(1) = 5;

cb = 16;
cb2 = 273;

for uiu = 1:18
    measurement_matrix2(cb+3:cb2+3,1) = measurement_matrix2(cb:cb2,1);
    measurement_matrix2(cb:cb+2,1) = ones(3,1).*reff2(uiu); 
    
    cb = cb + 18;
    cb2 = cb2 + 3;
end
measurement_matrix2(328:330) = ones(3,1).*reff2(19);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% renaming those reference matrix so that the number of the reference
% matrix can be trailing in the next set of values
for iti = 16:15:(93*3)
    measurement_matrix(iti, 1) = measurement_matrix((iti - 1),1);
    measurement_matrix(iti + 1, 1) = measurement_matrix((iti - 1),1);
    measurement_matrix(iti + 2, 1) = measurement_matrix((iti - 1),1);
end


fprintf(fileID, 'Setups\n');
fprintf(fileID, 'Measurement 1\n');
fprintf(fileID, './Citishark_Rotation888/trancon1.002\n');
ijb = 1;
ijc = 15;

for imes = ijb:ijc
   measurement_matrix(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix(imes,:)); 
end


%fprintf(fileID, '\n');

ijb = ijb + 15;
ijc = ijc + 15;
fprintf(fileID, 'Measurement 2\n');
fprintf(fileID, './Citishark_Rotation888/trancon2.003\n');
for imes = ijb:ijc
    measurement_matrix(ijb:ijb+2,1) =  1;
    fprintf(fileID, '%-2d %-2d \n', measurement_matrix(imes,:)); 
end


%fprintf(fileID, '\n');

ijb = ijb + 15;
ijc = ijc + 15;
fprintf(fileID, 'Measurement 3\n');
fprintf(fileID, './Citishark_Rotation888/trancon3.004\n');
for imes = ijb:ijc
   measurement_matrix(ijb:ijb+2,1) =  1; 
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 15;
ijc = ijc + 15;
fprintf(fileID, 'Measurement 4\n');
fprintf(fileID, './Citishark_Rotation888/trancon4.005\n');
for imes = ijb:ijc
    measurement_matrix(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix(imes,:)); 
end

%fprintf(fileID, '\n');

ijb = ijb + 15;
ijc = ijc + 15;
fprintf(fileID, 'Measurement 5\n');
fprintf(fileID, './Citishark_Rotation888/trancon5.006\n');
for imes = ijb:ijc
    measurement_matrix(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 15;
ijc = ijc + 15;
fprintf(fileID, 'Measurement 6\n');
fprintf(fileID, './Citishark_Rotation888/trancon6.007\n');
for imes = ijb:ijc
    measurement_matrix(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 15;
ijc = ijc + 15;
fprintf(fileID, 'Measurement 7\n');
fprintf(fileID, './Citishark_Rotation888/trancon7.008\n');
for imes = ijb:ijc
    measurement_matrix(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 15;
ijc = ijc + 15;
fprintf(fileID, 'Measurement 8\n');
fprintf(fileID, './Citishark_Rotation888/trancon8.009\n');
for imes = ijb:ijc
    measurement_matrix(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 15;
ijc = ijc + 15;
fprintf(fileID, 'Measurement 9\n');
fprintf(fileID, './Citishark_Rotation888/trancon9.010\n');
for imes = ijb:ijc
    measurement_matrix(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 15;
ijc = ijc + 15;
fprintf(fileID, 'Measurement 10\n');
fprintf(fileID, './Citishark_Rotation888/trancon10.011\n');
for imes = ijb:ijc
    measurement_matrix(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix(imes,:)); 
end

%fprintf(fileID, '\n');



ijb = ijb + 15;
ijc = ijc + 15;
fprintf(fileID, 'Measurement 11\n');
fprintf(fileID, './Citishark_Rotation888/trancon11.012\n');
for imes = ijb:ijc
    measurement_matrix(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 15;
ijc = ijc + 15;
fprintf(fileID, 'Measurement 12\n');
fprintf(fileID, './Citishark_Rotation888/trancon12.013\n');
for imes = ijb:ijc
    measurement_matrix(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 15;
ijc = ijc + 15;
fprintf(fileID, 'Measurement 13\n');
fprintf(fileID, './Citishark_Rotation888/trancon13.014\n');
for imes = ijb:ijc
    measurement_matrix(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 15;
ijc = ijc + 15;
fprintf(fileID, 'Measurement 14\n');
fprintf(fileID, './Citishark_Rotation888/trancon14.015\n');
for imes = ijb:ijc
    measurement_matrix(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 15;
ijc = ijc + 15;
fprintf(fileID, 'Measurement 15\n');
fprintf(fileID, './Citishark_Rotation888/trancon15.016\n');
for imes = ijb:ijc
    measurement_matrix(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 15;
ijc = ijc + 15;
fprintf(fileID, 'Measurement 16\n');
fprintf(fileID, './Citishark_Rotation888/trancon16.017\n');
for imes = ijb:ijc
    measurement_matrix(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 15;
ijc = ijc + 15;
fprintf(fileID, 'Measurement 17\n');
fprintf(fileID, './Citishark_Rotation888/trancon17.018\n');
for imes = ijb:ijc
    measurement_matrix(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix(imes,:)); 
end

%fprintf(fileID, '\n');

ijb = ijb + 15;
ijc = ijc + 15;
fprintf(fileID, 'Measurement 18\n');
fprintf(fileID, './Citishark_Rotation888/trancon18.019\n');
for imes = ijb:ijc
    measurement_matrix(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 15;
ijc = ijc + 9;
fprintf(fileID, 'Measurement 19\n');
fprintf(fileID, './Citishark_Rotation888/trancon19.020\n');
for imes = ijb:ijc
    measurement_matrix(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix(imes,:)); 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% second wing %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% fprintf(fileID, 'Measurement 1\n');
% fprintf(fileID, './Citishark_Rotation888/trancon20.021\n');
% ijb = 1;
% ijc = 18;
% 
% for imes = ijb:ijc
%     measurement_matrix2(ijb:ijb+2,1) =  1;
%    fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
% end
% 
% %fprintf(fileID, '\n');
% 
% ijb = ijb + 18;
% ijc = ijc + 18;
% fprintf(fileID, 'Measurement 2\n');
% fprintf(fileID, './Citishark_Rotation888/trancon21.022\n');
% for imes = ijb:ijc
%     measurement_matrix2(ijb:ijb+2,1) =  1;
%    fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
% end
% 
% 
% %fprintf(fileID, '\n');
% 
% ijb = ijb + 18;
% ijc = ijc + 18;
% fprintf(fileID, 'Measurement 3\n');
% fprintf(fileID, './Citishark_Rotation888/trancon22.023\n');
% for imes = ijb:ijc
%     measurement_matrix2(ijb:ijb+2,1) =  1;
%    fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
% end
% 
% %fprintf(fileID, '\n');
% 
% 
% ijb = ijb + 18;
% ijc = ijc + 18;
% fprintf(fileID, 'Measurement 4\n');
% fprintf(fileID, './Citishark_Rotation888/trancon23.024\n');
% for imes = ijb:ijc
%     measurement_matrix2(ijb:ijb+2,1) =  1;
%    fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
% end
% 
% %fprintf(fileID, '\n');
% 
% ijb = ijb + 18;
% ijc = ijc + 18;
% fprintf(fileID, 'Measurement 5\n');
% fprintf(fileID, './Citishark_Rotation888/trancon24.025\n');
% for imes = ijb:ijc
%     measurement_matrix2(ijb:ijb+2,1) =  1;
%    fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
% end
% 
% %fprintf(fileID, '\n');
% 
% 
% ijb = ijb + 18;
% ijc = ijc + 18;
% fprintf(fileID, 'Measurement 6\n');
% fprintf(fileID, './Citishark_Rotation888/trancon25.026\n');
% for imes = ijb:ijc
%     measurement_matrix2(ijb:ijb+2,1) =  1;
%    fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
% end
% 
% %fprintf(fileID, '\n');
% 
% 
% ijb = ijb + 18;
% ijc = ijc + 18;
% fprintf(fileID, 'Measurement 7\n');
% fprintf(fileID, './Citishark_Rotation888/trancon26.027\n');
% for imes = ijb:ijc
%     measurement_matrix2(ijb:ijb+2,1) =  1;
%    fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
% end
% 
% %fprintf(fileID, '\n');
% 
% 
% ijb = ijb + 18;
% ijc = ijc + 18;
% fprintf(fileID, 'Measurement 8\n');
% fprintf(fileID, './Citishark_Rotation888/trancon27.028\n');
% for imes = ijb:ijc
%     measurement_matrix2(ijb:ijb+2,1) =  1;
%    fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
% end
% 
% %fprintf(fileID, '\n');
% 
% 
% ijb = ijb + 18;
% ijc = ijc + 18;
% fprintf(fileID, 'Measurement 9\n');
% fprintf(fileID, './Citishark_Rotation888/trancon28.029\n');
% for imes = ijb:ijc
%     measurement_matrix2(ijb:ijb+2,1) =  1;
%    fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
% end
% 
% %fprintf(fileID, '\n');
% 
% 
% ijb = ijb + 18;
% ijc = ijc + 18;
% fprintf(fileID, 'Measurement 10\n');
% fprintf(fileID, './Citishark_Rotation888/trancon29.030\n');
% for imes = ijb:ijc
%     measurement_matrix2(ijb:ijb+2,1) =  1;
%    fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
% end
% 
% %fprintf(fileID, '\n');
% 
% 
% 
% ijb = ijb + 18;
% ijc = ijc + 18;
% fprintf(fileID, 'Measurement 11\n');
% fprintf(fileID, './Citishark_Rotation888/trancon30.031\n');
% for imes = ijb:ijc
%     measurement_matrix2(ijb:ijb+2,1) =  1;
%    fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
% end
% 
% %fprintf(fileID, '\n');
% 
% 
% ijb = ijb + 18;
% ijc = ijc + 18;
% fprintf(fileID, 'Measurement 12\n');
% fprintf(fileID, './Citishark_Rotation888/trancon31.032\n');
% for imes = ijb:ijc
%     measurement_matrix2(ijb:ijb+2,1) =  1;
%    fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
% end
% 
% %fprintf(fileID, '\n');
% 
% 
% ijb = ijb + 18;
% ijc = ijc + 18;
% fprintf(fileID, 'Measurement 13\n');
% fprintf(fileID, './Citishark_Rotation888/trancon32.033\n');
% for imes = ijb:ijc
%     measurement_matrix2(ijb:ijb+2,1) =  1;
%    fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
% end
% 
% %fprintf(fileID, '\n');
% 
% 
% ijb = ijb + 18;
% ijc = ijc + 18;
% fprintf(fileID, 'Measurement 14\n');
% fprintf(fileID, './Citishark_Rotation888/trancon33.034\n');
% for imes = ijb:ijc
%     measurement_matrix2(ijb:ijb+2,1) =  1;
%    fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
% end
% 
% %fprintf(fileID, '\n');
% 
% 
% ijb = ijb + 18;
% ijc = ijc + 18;
% fprintf(fileID, 'Measurement 15\n');
% fprintf(fileID, './Citishark_Rotation888/trancon34.035\n');
% for imes = ijb:ijc
%     measurement_matrix2(ijb:ijb+2,1) =  1;
%    fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
% end
% 
% %fprintf(fileID, '\n');
% 
% 
% ijb = ijb + 18;
% ijc = ijc + 18;
% fprintf(fileID, 'Measurement 16\n');
% fprintf(fileID, './Citishark_Rotation888/trancon35.036\n');
% for imes = ijb:ijc
%     measurement_matrix2(ijb:ijb+2,1) =  1;
%    fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
% end
% 
% %fprintf(fileID, '\n');
% 
% 
% ijb = ijb + 18;
% ijc = ijc + 18;
% fprintf(fileID, 'Measurement 17\n');
% fprintf(fileID, './Citishark_Rotation888/trancon36.037\n');
% for imes = ijb:ijc
%     measurement_matrix2(ijb:ijb+2,1) =  1;
%    fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
% end
% 
% %fprintf(fileID, '\n');
% 
% ijb = ijb + 18;
% ijc = ijc + 18;
% fprintf(fileID, 'Measurement 18\n');
% fprintf(fileID, './Citishark_Rotation888/trancon37.038\n');
% for imes = ijb:ijc
%     measurement_matrix2(ijb:ijb+2,1) =  1;
%    fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
% end
% 
% %fprintf(fileID, '\n');
% 
% 
% ijb = ijb + 18;
% ijc = ijc + 6;
% fprintf(fileID, 'Measurement 19\n');
% fprintf(fileID, './Citishark_Rotation888/trancon38.039\n');
% for imes = ijb:ijc
%     measurement_matrix2(ijb:ijb+2,1) =  1;
%    fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
% end

% % %fprintf(fileID, '\n');
% % 
% % 
% % 
% % 
% % % fprintf(fileID, '\n');
% % % 
% % % 
% % % 
% % % 
% % % 
% % % fprintf(fileID, '\n');
% % % 
% % % fprintf(fileID, 'Equations\n');
% % % fprintf(fileID, 'nodes(24,1)=nodes(23,1)\n');
% % % 
% % % fprintf(fileID, '\n');
% % % fprintf(fileID, '\n');
% % % 
% % % 
% % % fprintf(fileID, '\n');
% % % fprintf(fileID, '');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf(fileID, 'Measurement 20\n');
fprintf(fileID, './Citishark_Rotation888/trancon20.021\n');
ijb = 1;
ijc = 18;

for imes = ijb:ijc
    measurement_matrix2(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
end


%fprintf(fileID, '\n');

ijb = ijb + 18;
ijc = ijc + 18;
fprintf(fileID, 'Measurement 21\n');
fprintf(fileID, './Citishark_Rotation888/trancon21.022\n');
for imes = ijb:ijc
    measurement_matrix2(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
end


%fprintf(fileID, '\n');

ijb = ijb + 18;
ijc = ijc + 18;
fprintf(fileID, 'Measurement 22\n');
fprintf(fileID, './Citishark_Rotation888/trancon22.023\n');
for imes = ijb:ijc
    measurement_matrix2(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 18;
ijc = ijc + 18;
fprintf(fileID, 'Measurement 23\n');
fprintf(fileID, './Citishark_Rotation888/trancon23.024\n');
for imes = ijb:ijc
    measurement_matrix2(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
end

%fprintf(fileID, '\n');

ijb = ijb + 18;
ijc = ijc + 18;
fprintf(fileID, 'Measurement 24\n');
fprintf(fileID, './Citishark_Rotation888/trancon24.025\n');
for imes = ijb:ijc
    measurement_matrix2(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 18;
ijc = ijc + 18;
fprintf(fileID, 'Measurement 25\n');
fprintf(fileID, './Citishark_Rotation888/trancon25.026\n');
for imes = ijb:ijc
    measurement_matrix2(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 18;
ijc = ijc + 18;
fprintf(fileID, 'Measurement 26\n');
fprintf(fileID, './Citishark_Rotation888/trancon26.027\n');
for imes = ijb:ijc
    measurement_matrix2(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 18;
ijc = ijc + 18;
fprintf(fileID, 'Measurement 27\n');
fprintf(fileID, './Citishark_Rotation888/trancon27.028\n');
for imes = ijb:ijc
    measurement_matrix2(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 18;
ijc = ijc + 18;
fprintf(fileID, 'Measurement 28\n');
fprintf(fileID, './Citishark_Rotation888/trancon28.029\n');
for imes = ijb:ijc
    measurement_matrix2(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 18;
ijc = ijc + 18;
fprintf(fileID, 'Measurement 29\n');
fprintf(fileID, './Citishark_Rotation888/trancon29.030\n');
for imes = ijb:ijc
    measurement_matrix2(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
end

%fprintf(fileID, '\n');



ijb = ijb + 18;
ijc = ijc + 18;
fprintf(fileID, 'Measurement 30\n');
fprintf(fileID, './Citishark_Rotation888/trancon30.031\n');
for imes = ijb:ijc
    measurement_matrix2(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 18;
ijc = ijc + 18;
fprintf(fileID, 'Measurement 31\n');
fprintf(fileID, './Citishark_Rotation888/trancon31.032\n');
for imes = ijb:ijc
    measurement_matrix2(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 18;
ijc = ijc + 18;
fprintf(fileID, 'Measurement 32\n');
fprintf(fileID, './Citishark_Rotation888/trancon32.033\n');
for imes = ijb:ijc
    measurement_matrix2(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 18;
ijc = ijc + 18;
fprintf(fileID, 'Measurement 33\n');
fprintf(fileID, './Citishark_Rotation888/trancon33.034\n');
for imes = ijb:ijc
    measurement_matrix2(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 18;
ijc = ijc + 18;
fprintf(fileID, 'Measurement 34\n');
fprintf(fileID, './Citishark_Rotation888/trancon34.035\n');
for imes = ijb:ijc
    measurement_matrix2(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 18;
ijc = ijc + 18;
fprintf(fileID, 'Measurement 35\n');
fprintf(fileID, './Citishark_Rotation888/trancon35.036\n');
for imes = ijb:ijc
    measurement_matrix2(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 18;
ijc = ijc + 18;
fprintf(fileID, 'Measurement 36\n');
fprintf(fileID, './Citishark_Rotation888/trancon36.037\n');
for imes = ijb:ijc
    measurement_matrix2(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
end

%fprintf(fileID, '\n');

ijb = ijb + 18;
ijc = ijc + 18;
fprintf(fileID, 'Measurement 37\n');
fprintf(fileID, './Citishark_Rotation888/trancon37.038\n');
for imes = ijb:ijc
    measurement_matrix2(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
end

%fprintf(fileID, '\n');


ijb = ijb + 18;
ijc = ijc + 6;
fprintf(fileID, 'Measurement 38\n');
fprintf(fileID, './Citishark_Rotation888/trancon38.039\n');
for imes = ijb:ijc
    measurement_matrix2(ijb:ijb+2,1) =  1;
   fprintf(fileID, '%-2d %-2d \n', measurement_matrix2(imes,:)); 
end
% 
% fprintf(fileID, '\n');
% 
% 
% 
% 
% %fprintf(fileID, '\n');
% 
% 
% 
% 
% 
% %fprintf(fileID, '\n');
% 
% %fprintf(fileID, 'Equations\n');
% %fprintf(fileID, 'nodes(24,1)=nodes(23,1)\n');
% 
% %fprintf(fileID, '\n');
% %fprintf(fileID, '\n');
% 
% 
% %fprintf(fileID, '\n');
% %fprintf(fileID, '');



fclose(fileID);
%type cfg_alex.cfg