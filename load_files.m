clear all;
close all;

B1 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS1\060304_1309.001.mat');
B2 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS1\060304_1326.002.mat');
B3 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS1\060304_1344.003.mat');
B4 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS1\060304_1410.004.mat');
B5 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS1\060304_1427.005.mat'); 
B6 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS1\060305_1002.006.mat');
B7 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS1\060305_1046.007.mat');
B8 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS1\060305_1130.008.mat');
B9 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS1\060305_1401.010.mat');
B10 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS1\060305_1440.011.mat');
B11 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS1\060305_1515.012.mat');
B12 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS1\060305_1552.013.mat');
B13 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS1\060305_1629.014.mat');
B14 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS1\060305_1706.015.mat');
B15 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS1\060305_1742.016.mat');
B16 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS1\060306_0946.017.mat');
B17 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS1\060306_1038.018.mat');
B18 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS1\060306_1114.019.mat');
B19 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS1\060306_1154.020.mat');




C1 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS2\060304_1344.003.mat');
C2 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS2\060304_1531.002.mat');
C3 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS2\060304_1616.003.mat');
C4 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS2\060304_1712.004.mat');
C5 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS2\060304_1757.005.mat');
C6 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS2\060304_1450.006.mat');
C7 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS2\060304_1508.007.mat');
C8 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS2\060304_1525.008.mat');
C9 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS2\060304_1545.009.mat');
C10 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS2\060304_1602.010.mat');
C11 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS2\060304_1619.011.mat');
C12 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS2\060304_1637.012.mat');
C13 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS2\060304_1654.013.mat');
C14 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS2\060304_1712.014.mat');
C15 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS2\060304_1729.015.mat');
C16 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS2\060304_1746.016.mat');
C17 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS2\060304_1805.017.mat');
C18 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS2\060304_1824.018.mat');
C19 = load('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ERGATZ\CS2\060304_1841.019.mat');




bsizecounter = 0;

GrandB(:,(bsizecounter+1):size(B1.Z,2)) = B1.Z;
bsizecounter = bsizecounter + size(B1.Z,2);


GrandB(:,(bsizecounter+1):size(B2.Z,2) + bsizecounter) = B2.Z;
bsizecounter = bsizecounter + size(B2.Z,2);


GrandB(:,(bsizecounter+1):size(B3.Z,2) + bsizecounter) = B3.Z;
bsizecounter = bsizecounter + size(B3.Z,2);


GrandB(:,(bsizecounter+1):size(B4.Z,2) + bsizecounter) = B4.Z;
bsizecounter = bsizecounter + size(B4.Z,2);


GrandB(:,(bsizecounter+1):size(B5.Z,2) + bsizecounter) = B5.Z;
bsizecounter = bsizecounter + size(B5.Z,2);



GrandB(:,(bsizecounter+1):size(B6.Z,2) + bsizecounter) = B6.Z;
bsizecounter = bsizecounter + size(B6.Z,2);


GrandB(:,(bsizecounter+1):size(B7.Z,2) + bsizecounter) = B7.Z;
bsizecounter = bsizecounter + size(B7.Z,2);


GrandB(:,(bsizecounter+1):size(B8.Z,2) + bsizecounter) = B8.Z;
bsizecounter = bsizecounter + size(B8.Z,2);


GrandB(:,(bsizecounter+1):size(B9.Z,2) + bsizecounter) = B9.Z;
bsizecounter = bsizecounter + size(B9.Z,2);


GrandB(:,(bsizecounter+1):size(B10.Z,2) + bsizecounter) = B10.Z;
bsizecounter = bsizecounter + size(B10.Z,2);


GrandB(:,(bsizecounter+1):size(B11.Z,2) + bsizecounter) = B11.Z;
bsizecounter = bsizecounter + size(B11.Z,2);


GrandB(:,(bsizecounter+1):size(B12.Z,2) + bsizecounter) = B12.Z;
bsizecounter = bsizecounter + size(B12.Z,2);


GrandB(:,(bsizecounter+1):size(B13.Z,2) + bsizecounter) = B13.Z;
bsizecounter = bsizecounter + size(B13.Z,2);


GrandB(:,(bsizecounter+1):size(B14.Z,2) + bsizecounter) = B14.Z;
bsizecounter = bsizecounter + size(B14.Z,2);


GrandB(:,(bsizecounter+1):size(B15.Z,2) + bsizecounter) = B15.Z;
bsizecounter = bsizecounter + size(B15.Z,2);


GrandB(:,(bsizecounter+1):size(B16.Z,2) + bsizecounter) = B16.Z;
bsizecounter = bsizecounter + size(B16.Z,2);


GrandB(:,(bsizecounter+1):size(B17.Z,2) + bsizecounter) = B17.Z;
bsizecounter = bsizecounter + size(B17.Z,2);



GrandB(:,(bsizecounter+1):size(B18.Z,2) + bsizecounter) = B18.Z;
bsizecounter = bsizecounter + size(B18.Z,2);


GrandB(:,(bsizecounter+1):size(B19.Z,2) + bsizecounter) = B19.Z;
bsizecounter = bsizecounter + size(B19.Z,2);
    







csizecounter = 0;

GrandC(:,(csizecounter+1):size(C1.Z,2)) = C1.Z;
csizecounter = csizecounter + size(C1.Z,2);

GrandC(:,(csizecounter+1):size(C2.Z,2) + csizecounter) = C2.Z;
csizecounter = csizecounter + size(C2.Z,2);

GrandC(:,(csizecounter+1):size(C3.Z,2) + csizecounter) = C3.Z;
csizecounter = csizecounter + size(C3.Z,2);

GrandC(:,(csizecounter+1):size(C4.Z,2) + csizecounter) = C4.Z;
csizecounter = csizecounter + size(C4.Z,2);

GrandC(:,(csizecounter+1):size(C5.Z,2) + csizecounter) = C5.Z;
csizecounter = csizecounter + size(C5.Z,2);

GrandC(:,(csizecounter+1):size(C6.Z,2) + csizecounter) = C6.Z;
csizecounter = csizecounter + size(C6.Z,2);

GrandC(:,(csizecounter+1):size(C7.Z,2) + csizecounter) = C7.Z;
csizecounter = csizecounter + size(C7.Z,2);

GrandC(:,(csizecounter+1):size(C8.Z,2) + csizecounter) = C8.Z;
csizecounter = csizecounter + size(C8.Z,2);

GrandC(:,(csizecounter+1):size(C9.Z,2) + csizecounter) = C9.Z;
csizecounter = csizecounter + size(C9.Z,2);

GrandC(:,(csizecounter+1):size(C10.Z,2) + csizecounter) = C10.Z;
csizecounter = csizecounter + size(C10.Z,2);

GrandC(:,(csizecounter+1):size(C11.Z,2) + csizecounter) = C11.Z;
csizecounter = csizecounter + size(C11.Z,2);

GrandC(:,(csizecounter+1):size(C12.Z,2) + csizecounter) = C12.Z;
csizecounter = csizecounter + size(C12.Z,2);


GrandC(:,(csizecounter+1):size(C13.Z,2) + csizecounter) = C13.Z;
csizecounter = csizecounter + size(C13.Z,2);


GrandC(:,(csizecounter+1):size(C14.Z,2) + csizecounter) = C14.Z;
csizecounter = csizecounter + size(C14.Z,2);


GrandC(:,(csizecounter+1):size(C15.Z,2) + csizecounter) = C15.Z;
csizecounter = csizecounter + size(C15.Z,2);


GrandC(:,(csizecounter+1):size(C16.Z,2) + csizecounter) = C16.Z;
csizecounter = csizecounter + size(C16.Z,2);


GrandC(:,(csizecounter+1):size(C17.Z,2) + csizecounter) = C17.Z;
csizecounter = csizecounter + size(C17.Z,2);


GrandC(:,(csizecounter+1):size(C18.Z,2) + csizecounter) = C18.Z;
csizecounter = csizecounter + size(C18.Z,2);

GrandC(:,(csizecounter+1):size(C19.Z,2) + csizecounter) = C19.Z;
csizecounter = csizecounter + size(C19.Z,2);



% now this is the time to adapt the size, contents and dynamics of GrandB to the remaining of the code

Z = GrandB;
ZZ = GrandC;

save('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\Z.mat','Z');
save('D:\abanobi\Documents\STAGEISTERRE\gueguen\Archive\ZZ.mat','ZZ');


