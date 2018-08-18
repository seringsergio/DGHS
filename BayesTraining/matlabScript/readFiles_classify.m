
% La diferencia entre det_int_0_wind_5_v2 y det_int_0_wind_5 es que:
% 1.   det_int_0_wind_5_v2: Se envia el paquete de manera deterministica: cada 1
%      segundo
% 2.   det_int_0_wind_5: Se envia el paquete de manera aleatoria, entre
%      [0,2] segundos

% windows = 5 _v2 int_0
det_int_0_wind_5         = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results_powertrace_wind/det_int_0_wind_5_v2.xlsx','det_int_0_wind_5_v2','B2:B120');

% windows = 10 _v2 int_0
det_int_0_wind_10        = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results_powertrace_wind/det_int_0_wind_10_v2.xlsx','det_int_0_wind_10_v2','B2:B61');

% windows = 15 _v2 int_0
det_int_0_wind_15        = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results_powertrace_wind/det_int_0_wind_15_v2.xlsx','det_int_0_wind_15_v2','B2:B43');

% windows = 20 _v2 int_0
det_int_0_wind_20        = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results_powertrace_wind/det_int_0_wind_20_v2.xlsx','det_int_0_wind_20_v2','B2:B33');

% windows = 25 _v2 int_0
det_int_0_wind_25        = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results_powertrace_wind/det_int_0_wind_25_v2.xlsx','det_int_0_wind_25_v2','B2:B26');

% windows = 30 _v2 int_0
det_int_0_wind_30        = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results_powertrace_wind/det_int_0_wind_30_v2.xlsx','det_int_0_wind_30_v2','B2:B23');

% windows = 35 _v2 int_0
det_int_0_wind_35        = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results_powertrace_wind/det_int_0_wind_35_v2.xlsx','det_int_0_wind_35_v2','B2:B20');


% windows = 5 int_70
det_int_70_wind_5         = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results_powertrace_wind/det_int_70_wind_5.xlsx','det_int_70_wind_5','B2:B354');

% windows = 10 int_70
det_int_70_wind_10         = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results_powertrace_wind/det_int_70_wind_10.xlsx','det_int_70_wind_10','B2:B420');

% windows = 15 int_70
det_int_70_wind_15         = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results_powertrace_wind/det_int_70_wind_15.xlsx','det_int_70_wind_15','B2:B122');

% windows = 20 int_70
det_int_70_wind_20         = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results_powertrace_wind/det_int_70_wind_20.xlsx','det_int_70_wind_20','B2:B95');

% windows = 25 int_70
det_int_70_wind_25         = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results_powertrace_wind/det_int_70_wind_25_v2.xlsx','det_int_70_wind_25_v2','B2:B82');

% windows = 30 int_70
det_int_70_wind_30         = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results_powertrace_wind/det_int_70_wind_30_v2.xlsx','det_int_70_wind_30_v2','B2:B532');

% windows = 35 int_70
det_int_70_wind_35         = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results_powertrace_wind/det_int_70_wind_35_v2.xlsx','det_int_70_wind_35_v2','B2:B158');



% % windows = 5
% det_int_0_wind_5         = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results_powertrace_wind/det_int_0_wind_5.xlsx','det_int_0_wind_5','B2:B115');
% 
% % windows = 10
% det_int_0_wind_10        = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results_powertrace_wind/det_int_0_wind_10.xlsx','det_int_0_wind_10','B2:B65');
% 
% % windows = 15
% det_int_0_wind_15        = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results_powertrace_wind/det_int_0_wind_15.xlsx','det_int_0_wind_15','B2:B40');
% 
% % windows = 20
% det_int_0_wind_20        = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results_powertrace_wind/det_int_0_wind_20.xlsx','det_int_0_wind_20','B2:B30');
% 
% % windows = 25
% det_int_0_wind_25        = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results_powertrace_wind/det_int_0_wind_25.xlsx','det_int_0_wind_25','B2:B24');
% 
% % windows = 30
% det_int_0_wind_35        = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results_powertrace_wind/det_int_0_wind_35.xlsx','det_int_0_wind_35','B2:B252');
% 
% % windows = 35
% det_int_0_wind_35        = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results_powertrace_wind/det_int_0_wind_35.xlsx','det_int_0_wind_35','B2:B43');



%% windows = 10

% interference 0 %
det_int_0_EWMA_01_wind_10   = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_0.xlsx','det_int_0','B2:B176');
det_int_0_EWMA_02_wind_10   = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_0_EWMA_02.xlsx','det_int_0_EWMA_02','B2:B89');
det_int_0_EWMA_03_wind_10   = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_0_EWMA_03.xlsx','det_int_0_EWMA_03','B2:B89');
det_int_0_EWMA_04_wind_10   = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_0_EWMA_04.xlsx','det_int_0_EWMA_04','B2:B89');
det_int_0_EWMA_05_wind_10   = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_0_EWMA_05.xlsx','det_int_0_EWMA_05','B2:B89');
det_int_0_EWMA_06_wind_10   = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_0_EWMA_06.xlsx','det_int_0_EWMA_06','B2:B89');
det_int_0_EWMA_07_wind_10   = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_0_EWMA_07.xlsx','det_int_0_EWMA_07','B18:B105');
det_int_0_EWMA_08_wind_10   = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_0_EWMA_08.xlsx','det_int_0_EWMA_08','B2:B89');
det_int_0_EWMA_09_wind_10   = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_0_EWMA_09.xlsx','det_int_0_EWMA_09','B2:B89');

% interference 10 %
det_int_10_EWMA_01_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_10.xlsx','det_int_10','B2:B176');
det_int_10_EWMA_02_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_10_EWMA_02.xlsx','det_int_10_EWMA_02','B2:B89');
det_int_10_EWMA_03_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_10_EWMA_03.xlsx','det_int_10_EWMA_03','B2:B89');
det_int_10_EWMA_04_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_10_EWMA_04.xlsx','det_int_10_EWMA_04','B2:B89');
det_int_10_EWMA_05_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_10_EWMA_05.xlsx','det_int_10_EWMA_05','B2:B89');
det_int_10_EWMA_06_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_10_EWMA_06.xlsx','det_int_10_EWMA_06','B2:B89');
det_int_10_EWMA_07_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_10_EWMA_07.xlsx','det_int_10_EWMA_07','B2:B89');
det_int_10_EWMA_08_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_10_EWMA_08.xlsx','det_int_10_EWMA_08','B2:B89');
det_int_10_EWMA_09_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_10_EWMA_09.xlsx','det_int_10_EWMA_09','B2:B89');

% interference 20 %
det_int_20_EWMA_01_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_20.xlsx','det_int_20','B2:B176');
det_int_20_EWMA_02_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_20_EWMA_02.xlsx','det_int_20_EWMA_02','B2:B89');
det_int_20_EWMA_03_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_20_EWMA_03.xlsx','det_int_20_EWMA_03','B2:B89');
det_int_20_EWMA_04_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_20_EWMA_04.xlsx','det_int_20_EWMA_04','B2:B89');
det_int_20_EWMA_05_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_20_EWMA_05.xlsx','det_int_20_EWMA_05','B2:B56');
det_int_20_EWMA_06_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_20_EWMA_06.xlsx','det_int_20_EWMA_06','B2:B56');
det_int_20_EWMA_07_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_20_EWMA_07.xlsx','det_int_20_EWMA_07','B2:B56');
det_int_20_EWMA_08_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_20_EWMA_08.xlsx','det_int_20_EWMA_08','B2:B56');
det_int_20_EWMA_09_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_20_EWMA_09.xlsx','det_int_20_EWMA_09','B2:B56');

% interference 30 %
det_int_30_EWMA_01_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_30.xlsx','det_int_30','B2:B176');
det_int_30_EWMA_02_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_30_EWMA_02.xlsx','det_int_30_EWMA_02','B2:B56');
det_int_30_EWMA_03_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_30_EWMA_03.xlsx','det_int_30_EWMA_03','B2:B56');
det_int_30_EWMA_04_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_30_EWMA_04.xlsx','det_int_30_EWMA_04','B2:B56');
det_int_30_EWMA_05_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_30_EWMA_05.xlsx','det_int_30_EWMA_05','B2:B56');
det_int_30_EWMA_06_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_30_EWMA_06.xlsx','det_int_30_EWMA_06','B2:B56');
det_int_30_EWMA_07_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_30_EWMA_07.xlsx','det_int_30_EWMA_07','B2:B56');
det_int_30_EWMA_08_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_30_EWMA_08.xlsx','det_int_30_EWMA_08','B2:B56');
det_int_30_EWMA_09_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_30_EWMA_09.xlsx','det_int_30_EWMA_09','B2:B56');


% interference 40 %
det_int_40_EWMA_01_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_40.xlsx','det_int_40','B2:B176');
det_int_40_EWMA_02_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_40_EWMA_02.xlsx','det_int_40_EWMA_02','B2:B56');
det_int_40_EWMA_03_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_40_EWMA_03.xlsx','det_int_40_EWMA_03','B2:B56');
det_int_40_EWMA_04_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_40_EWMA_04.xlsx','det_int_40_EWMA_04','B2:B56');
det_int_40_EWMA_05_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_40_EWMA_05.xlsx','det_int_40_EWMA_05','B2:B56');
det_int_40_EWMA_06_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_40_EWMA_06.xlsx','det_int_40_EWMA_06','B2:B56');
det_int_40_EWMA_07_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_40_EWMA_07.xlsx','det_int_40_EWMA_07','B2:B56');
det_int_40_EWMA_08_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_40_EWMA_08.xlsx','det_int_40_EWMA_08','B2:B56');
det_int_40_EWMA_09_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_40_EWMA_09.xlsx','det_int_40_EWMA_09','B2:B56');

% interference 50 %
det_int_50_EWMA_01_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_50.xlsx','det_int_50','B2:B176');
det_int_50_EWMA_02_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_50_EWMA_02.xlsx','det_int_50_EWMA_02','B2:B56');
det_int_50_EWMA_03_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_50_EWMA_03.xlsx','det_int_50_EWMA_03','B2:B56');
det_int_50_EWMA_04_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_50_EWMA_04.xlsx','det_int_50_EWMA_04','B2:B56');
det_int_50_EWMA_05_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_50_EWMA_05.xlsx','det_int_50_EWMA_05','B2:B56');
det_int_50_EWMA_06_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_50_EWMA_06.xlsx','det_int_50_EWMA_06','B2:B56');
det_int_50_EWMA_07_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_50_EWMA_07.xlsx','det_int_50_EWMA_07','B2:B56');
det_int_50_EWMA_08_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_50_EWMA_08.xlsx','det_int_50_EWMA_08','B2:B56');
det_int_50_EWMA_09_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_50_EWMA_09.xlsx','det_int_50_EWMA_09','B2:B56');


% interference 60 %
det_int_60_EWMA_01_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_60.xlsx','det_int_60','B2:B176');
det_int_60_EWMA_02_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_60_EWMA_02.xlsx','det_int_60_EWMA_02','B2:B56');
det_int_60_EWMA_03_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_60_EWMA_03.xlsx','det_int_60_EWMA_03','B2:B56');
det_int_60_EWMA_04_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_60_EWMA_04.xlsx','det_int_60_EWMA_04','B2:B56');
det_int_60_EWMA_05_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_60_EWMA_05.xlsx','det_int_60_EWMA_05','B2:B56');
det_int_60_EWMA_06_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_60_EWMA_06.xlsx','det_int_60_EWMA_06','B2:B56');
det_int_60_EWMA_07_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_60_EWMA_07.xlsx','det_int_60_EWMA_07','B2:B56');
det_int_60_EWMA_08_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_60_EWMA_08.xlsx','det_int_60_EWMA_08','B2:B56');
det_int_60_EWMA_09_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_60_EWMA_09.xlsx','det_int_60_EWMA_09','B2:B56');


% interference 70 % aca %
det_int_70_EWMA_01_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_70.xlsx','det_int_70','B2:B176');
det_int_70_EWMA_02_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_70_EWMA_02.xlsx','det_int_70_EWMA_02','B2:B56');
det_int_70_EWMA_03_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_70_EWMA_03.xlsx','det_int_70_EWMA_03','B2:B56');
det_int_70_EWMA_04_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_70_EWMA_04.xlsx','det_int_70_EWMA_04','B2:B56');
det_int_70_EWMA_05_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_70_EWMA_05.xlsx','det_int_70_EWMA_05','B2:B56');
det_int_70_EWMA_06_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_70_EWMA_06.xlsx','det_int_70_EWMA_06','B2:B56');
det_int_70_EWMA_07_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_70_EWMA_07.xlsx','det_int_70_EWMA_07','B2:B56');
det_int_70_EWMA_08_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_70_EWMA_08.xlsx','det_int_70_EWMA_08','B2:B56');
det_int_70_EWMA_09_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_70_EWMA_09.xlsx','det_int_70_EWMA_09','B2:B56');


% interference 80 %
det_int_80_EWMA_01_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_80.xlsx','det_int_80','B2:B176');
det_int_80_EWMA_02_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_80_EWMA_02.xlsx','det_int_80_EWMA_02','B2:B56');
det_int_80_EWMA_03_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_80_EWMA_03.xlsx','det_int_80_EWMA_03','B2:B56');
det_int_80_EWMA_04_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_80_EWMA_04.xlsx','det_int_80_EWMA_04','B2:B56');
det_int_80_EWMA_05_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_80_EWMA_05.xlsx','det_int_80_EWMA_05','B2:B56');
det_int_80_EWMA_06_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_80_EWMA_06.xlsx','det_int_80_EWMA_06','B2:B56');
det_int_80_EWMA_07_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_80_EWMA_07.xlsx','det_int_80_EWMA_07','B2:B56');
det_int_80_EWMA_08_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_80_EWMA_08.xlsx','det_int_80_EWMA_08','B2:B56');
det_int_80_EWMA_09_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_80_EWMA_09.xlsx','det_int_80_EWMA_09','B2:B56');


% interference 90 %
det_int_90_EWMA_01_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_90.xlsx','det_int_90','B2:B176');
det_int_90_EWMA_02_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_90_EWMA_02.xlsx','det_int_90_EWMA_02','B2:B56');
det_int_90_EWMA_03_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_90_EWMA_03.xlsx','det_int_90_EWMA_03','B2:B56');
det_int_90_EWMA_04_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_90_EWMA_04.xlsx','det_int_90_EWMA_04','B2:B56');
det_int_90_EWMA_05_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_90_EWMA_05.xlsx','det_int_90_EWMA_05','B2:B56');
det_int_90_EWMA_06_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_90_EWMA_06.xlsx','det_int_90_EWMA_06','B2:B56');
det_int_90_EWMA_07_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_90_EWMA_07.xlsx','det_int_90_EWMA_07','B2:B56');
det_int_90_EWMA_08_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_90_EWMA_08.xlsx','det_int_90_EWMA_08','B2:B56');
det_int_90_EWMA_09_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_90_EWMA_09.xlsx','det_int_90_EWMA_09','B2:B56');


% interference 100 %
det_int_100_EWMA_01_wind_10 = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_100.xlsx','det_int_100','B2:B176');
det_int_100_EWMA_02_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_100_EWMA_02.xlsx','det_int_100_EWMA_02','B2:B56');
det_int_100_EWMA_03_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_100_EWMA_03.xlsx','det_int_100_EWMA_03','B2:B56');
det_int_100_EWMA_04_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_100_EWMA_04.xlsx','det_int_100_EWMA_04','B2:B56');
det_int_100_EWMA_05_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_100_EWMA_05.xlsx','det_int_100_EWMA_05','B2:B56');
det_int_100_EWMA_06_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_100_EWMA_06.xlsx','det_int_100_EWMA_06','B2:B56');
det_int_100_EWMA_07_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_100_EWMA_07.xlsx','det_int_100_EWMA_07','B2:B56');
det_int_100_EWMA_08_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_100_EWMA_08.xlsx','det_int_100_EWMA_08','B2:B56');
det_int_100_EWMA_09_wind_10  = xlsread('/home/seringsergio/Desktop/DGHS/BayesClassification/results/det_int_100_EWMA_09.xlsx','det_int_100_EWMA_09','B2:B56');

