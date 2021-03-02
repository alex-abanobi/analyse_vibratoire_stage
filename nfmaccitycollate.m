close all;
clear all;

nfZ_fen_group_CS1_X_saved = load('nfZ_fen_group_CS1_X_saved.mat');
nfZ_fen_group_CS1_X_saved = nfZ_fen_group_CS1_X_saved.Z_fen_group;

nfZ_fen_group_CS1_Y_saved = load('nfZ_fen_group_CS1_Y_saved.mat');
nfZ_fen_group_CS1_Y_saved = nfZ_fen_group_CS1_Y_saved.Z_fen_group;


nfZ_fen_group_CS1_Z_saved = load('nfZ_fen_group_CS1_Z_saved.mat');
nfZ_fen_group_CS1_Z_saved = nfZ_fen_group_CS1_Z_saved.Z_fen_group;


nfZ_fen_group_CS2_X_saved = load('nfZ_fen_group_CS2_X_saved.mat');
nfZ_fen_group_CS2_X_saved = nfZ_fen_group_CS2_X_saved.Z_fen_group;


nfZ_fen_group_CS2_Y_saved = load('nfZ_fen_group_CS2_Y_saved.mat');
nfZ_fen_group_CS2_Y_saved = nfZ_fen_group_CS2_Y_saved.Z_fen_group;


nfZ_fen_group_CS2_Z_saved = load('nfZ_fen_group_CS2_Z_saved.mat');
nfZ_fen_group_CS2_Z_saved = nfZ_fen_group_CS2_Z_saved.Z_fen_group;



nfZ_collate_CS1 = zeros(180000,(93*3));
jib = 1;
for i = 1:93
    nfZ_collate_CS1(:,jib) = nfZ_fen_group_CS1_X_saved(:,i);
    jib = jib + 1;
    nfZ_collate_CS1(:,jib) = nfZ_fen_group_CS1_Y_saved(:,i);
    jib = jib + 1;
    nfZ_collate_CS1(:,jib) = nfZ_fen_group_CS1_Z_saved(:,i);
    jib = jib + 1;
end




nfZ_collate_CS2 = zeros(180000,(91*3));
jib = 1;
for i = 1:91
    nfZ_collate_CS2(:,jib) = nfZ_fen_group_CS2_X_saved(:,i);
    jib = jib + 1;
    nfZ_collate_CS2(:,jib) = nfZ_fen_group_CS2_Y_saved(:,i);
    jib = jib + 1;
    nfZ_collate_CS2(:,jib) = nfZ_fen_group_CS2_Z_saved(:,i);
    jib = jib + 1;
end

save('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\nfZ_collate_CS1.mat','nfZ_collate_CS1')
save('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\nfZ_collate_CS2.mat','nfZ_collate_CS2')

