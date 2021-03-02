close all;
clear all;





Z_fen_group_CS1_X_saved = load('Z_fen_group_CS1_X_saved.mat');
Z_fen_group_CS1_X_saved = Z_fen_group_CS1_X_saved.Z_fen_group;
Z_fen_group_CS1_X_saved = Z_fen_group_CS1_X_saved*(1e-6);

Z_fen_group_CS1_Y_saved = load('Z_fen_group_CS1_Y_saved.mat');
Z_fen_group_CS1_Y_saved = Z_fen_group_CS1_Y_saved.Z_fen_group;


Z_fen_group_CS1_Z_saved = load('Z_fen_group_CS1_Z_saved.mat');
Z_fen_group_CS1_Z_saved = Z_fen_group_CS1_Z_saved.Z_fen_group;


Z_fen_group_CS2_X_saved = load('Z_fen_group_CS2_X_saved.mat');
Z_fen_group_CS2_X_saved = Z_fen_group_CS2_X_saved.Z_fen_group;


Z_fen_group_CS2_Y_saved = load('Z_fen_group_CS2_Y_saved.mat');
Z_fen_group_CS2_Y_saved = Z_fen_group_CS2_Y_saved.Z_fen_group;


Z_fen_group_CS2_Z_saved = load('Z_fen_group_CS2_Z_saved.mat');
Z_fen_group_CS2_Z_saved = Z_fen_group_CS2_Z_saved.Z_fen_group;



Z_collate_CS1 = zeros(12000,(93*3));
jib = 1;
for i = 1:93
    Z_collate_CS1(:,jib) = Z_fen_group_CS1_X_saved(:,i);
    jib = jib + 1;
    Z_collate_CS1(:,jib) = Z_fen_group_CS1_Y_saved(:,i);
    jib = jib + 1;
    Z_collate_CS1(:,jib) = Z_fen_group_CS1_Z_saved(:,i);
    jib = jib + 1;
end




Z_collate_CS2 = zeros(12000,(91*3));
jib = 1;
for i = 1:91
    Z_collate_CS2(:,jib) = Z_fen_group_CS2_X_saved(:,i);
    jib = jib + 1;
    Z_collate_CS2(:,jib) = Z_fen_group_CS2_Y_saved(:,i);
    jib = jib + 1;
    Z_collate_CS2(:,jib) = Z_fen_group_CS2_Z_saved(:,i);
    jib = jib + 1;
end

save('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\Z_collate_CS1.mat','Z_collate_CS1')
save('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\Z_collate_CS2.mat','Z_collate_CS2')

