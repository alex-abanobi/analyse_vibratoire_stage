close all;
clear all;

noncor = [0.061021	0.13407	0.18405	0.30059	0.3337	0.36786	0.37308	0.37856	0.37982	0.38155	0.38195	0.38245	0.38255	0.38267	0.3827	0.38273	0.38274
0.061186	0.13427	0.18533	0.31834	0.35799	0.41636	0.43362	0.45609	0.46082	0.46692	0.46827	0.46982	0.47012	0.47046	0.47053	0.47061	0.47063
0.061217	0.13549	0.18598	0.34837	0.41199	0.47661	0.49585	0.53766	0.54384	0.54878	0.54972	0.55073	0.55091	0.55111	0.55115	0.5512	0.55121
0.062922	0.1379	0.18995	0.35537	0.42348	0.51232	0.52815	0.54777	0.55825	0.57263	0.57541	0.5784	0.57893	0.57949	0.5796	0.57973	0.57977
0.063147	0.13868	0.19271	0.37003	0.43793	0.57455	0.58958	0.62308	0.63931	0.66274	0.66781	0.67339	0.67435	0.67532	0.6755	0.67571	0.67575
0.065523	0.13926	0.19317	0.38289	0.47359	0.61022	0.64291	0.67506	0.6886	0.71515	0.72126	0.72796	0.72916	0.73042	0.73066	0.73094	0.73101
0.065965	0.14463	0.19898	0.39183	0.48542	0.62961	0.7084	0.77526	0.78233	0.79369	0.79662	0.80008	0.80073	0.80141	0.80154	0.80169	0.80173
0.082908	0.14698	0.20068	0.39738	0.50316	0.70808	0.74365	0.82168	0.83384	0.8582	0.86517	0.87357	0.8751	0.87667	0.87695	0.87729	0.87737
0.099796	0.15749	0.20147	0.40928	0.53406	0.7353	0.78872	0.91865	0.93852	0.96442	0.97114	0.97897	0.98037	0.98179	0.98204	0.98235	0.98243
0.22185	0.25366	0.28341	0.41272	0.54838	0.76434	0.87169	1.0377	1.0777	1.0994	1.1042	1.1098	1.1108	1.112	1.1122	1.1125	1.1126
];


cor = [0.07868353	0.170036879	0.22323876	0.326376307	0.349691666	0.37200005	0.375459916	0.379539458	0.380533524	0.381876158	0.382185997	0.382547475	0.382624935	0.382702394	0.382728214	0.382754034	0.382754034
0.078724841	0.170592006	0.231681864	0.34874924	0.380275325	0.429578403	0.443250034	0.459774763	0.463363728	0.467985488	0.468979553	0.470089809	0.470296368	0.470541657	0.470593296	0.470657846	0.470670756
0.078776481	0.171973371	0.232120802	0.398181418	0.43950615	0.49075863	0.510678674	0.542759886	0.546064832	0.549524697	0.550183104	0.550880241	0.550996431	0.55113844	0.55117717	0.5512159	0.55122881
0.081034431	0.173896952	0.238369215	0.409038681	0.461104487	0.524802153	0.535427038	0.555644011	0.564500233	0.574841098	0.5767905	0.578843181	0.579217569	0.579617778	0.579695237	0.579798517	0.579824337
0.081313285	0.176943699	0.242371298	0.417972363	0.493443898	0.58615021	0.599008514	0.635337098	0.649060369	0.666721173	0.670348868	0.674183121	0.674828618	0.675499935	0.675629035	0.675783954	0.675822684
0.083582854	0.177460097	0.243236264	0.452080436	0.524750514	0.637428509	0.654895664	0.684962925	0.698712016	0.719987604	0.724312435	0.728985835	0.729812072	0.730689948	0.730857777	0.731077246	0.731141796
0.084402635	0.183437401	0.243855941	0.458496678	0.560343231	0.683504101	0.75811067	0.780625613	0.786654557	0.795975537	0.798157318	0.800610207	0.801049145	0.801526813	0.801630093	0.801746282	0.801785012
0.096694193	0.184818765	0.250775672	0.475834734	0.565700857	0.736421963	0.787596983	0.830690378	0.842490067	0.863610736	0.868877994	0.874816568	0.875862274	0.876946709	0.877140358	0.877411467	0.877476017
0.112298443	0.18826572	0.255268332	0.500466908	0.605269837	0.783594901	0.801281524	0.934383052	0.948467802	0.969640111	0.974636259	0.980110076	0.981052501	0.982033657	0.982214396	0.982459685	0.982524235
0.2278347	0.27442669	0.312756315	0.510536665	0.643225074	0.833207817	0.9162704	1.073836273	1.086681667	1.103116027	1.106653351	1.110642524	1.111378391	1.112191718	1.112359547	1.112579016	1.112630656
];

X = corr(noncor, cor);
%Jab = zeros(17,1);
% c = 1;
% for i = 1:17
%     for j = 1:17
%         if i == j
%            Jab(c) = X(i);
%         end
%        
%     end 
%      c = c +1;
% end

format short

Jab = diag(X);

