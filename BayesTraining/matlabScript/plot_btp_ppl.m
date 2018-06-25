%% Before

close all
clear all 
clc

%% Read file

btp_95_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_95_tx.xlsx','int_95_tx','C2:C175');
EWMA_btp_09_95_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_95_tx.xlsx','int_95_tx','D2:D175');
EWMA_btp_08_95_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_95_tx.xlsx','int_95_tx','E2:E175');
EWMA_btp_07_95_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_95_tx.xlsx','int_95_tx','F2:F175');
EWMA_btp_06_95_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_95_tx.xlsx','int_95_tx','G2:G175');
EWMA_btp_05_95_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_95_tx.xlsx','int_95_tx','H2:H175');
EWMA_btp_04_95_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_95_tx.xlsx','int_95_tx','I2:I175');
EWMA_btp_03_95_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_95_tx.xlsx','int_95_tx','J2:J175');
EWMA_btp_02_95_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_95_tx.xlsx','int_95_tx','K2:K175');
EWMA_btp_01_95_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_95_tx.xlsx','int_95_tx','L2:L175');
ppl_95_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_95_tx.xlsx','int_95_tx','M2:M175');
EWMA_ppl_09_95_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_95_tx.xlsx','int_95_tx','N2:N175');
EWMA_ppl_08_95_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_95_tx.xlsx','int_95_tx','O2:O175');
EWMA_ppl_07_95_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_95_tx.xlsx','int_95_tx','P2:P175');
EWMA_ppl_06_95_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_95_tx.xlsx','int_95_tx','Q2:Q175');
EWMA_ppl_05_95_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_95_tx.xlsx','int_95_tx','R2:R175');
EWMA_ppl_04_95_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_95_tx.xlsx','int_95_tx','S2:S175');
EWMA_ppl_03_95_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_95_tx.xlsx','int_95_tx','T2:T175');
EWMA_ppl_02_95_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_95_tx.xlsx','int_95_tx','U2:U175');
EWMA_ppl_01_95_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_95_tx.xlsx','int_95_tx','V2:V175');

btp_90_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_90_tx.xlsx','int_90_tx','C2:C178');
EWMA_btp_09_90_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_90_tx.xlsx','int_90_tx','D2:D178');
EWMA_btp_08_90_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_90_tx.xlsx','int_90_tx','E2:E178');
EWMA_btp_07_90_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_90_tx.xlsx','int_90_tx','F2:F178');
EWMA_btp_06_90_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_90_tx.xlsx','int_90_tx','G2:G178');
EWMA_btp_05_90_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_90_tx.xlsx','int_90_tx','H2:H178');
EWMA_btp_04_90_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_90_tx.xlsx','int_90_tx','I2:I178');
EWMA_btp_03_90_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_90_tx.xlsx','int_90_tx','J2:J178');
EWMA_btp_02_90_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_90_tx.xlsx','int_90_tx','K2:K178');
EWMA_btp_01_90_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_90_tx.xlsx','int_90_tx','L2:L178');
ppl_90_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_90_tx.xlsx','int_90_tx','M2:M178');
EWMA_ppl_09_90_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_90_tx.xlsx','int_90_tx','N2:N178');
EWMA_ppl_08_90_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_90_tx.xlsx','int_90_tx','O2:O178');
EWMA_ppl_07_90_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_90_tx.xlsx','int_90_tx','P2:P178');
EWMA_ppl_06_90_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_90_tx.xlsx','int_90_tx','Q2:Q178');
EWMA_ppl_05_90_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_90_tx.xlsx','int_90_tx','R2:R178');
EWMA_ppl_04_90_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_90_tx.xlsx','int_90_tx','S2:S178');
EWMA_ppl_03_90_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_90_tx.xlsx','int_90_tx','T2:T178');
EWMA_ppl_02_90_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_90_tx.xlsx','int_90_tx','U2:U178');
EWMA_ppl_01_90_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_90_tx.xlsx','int_90_tx','V2:V178');

btp_80_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_80_tx.xlsx','int_80_tx','C2:C176');
EWMA_btp_09_80_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_80_tx.xlsx','int_80_tx','D2:D176');
EWMA_btp_08_80_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_80_tx.xlsx','int_80_tx','E2:E176');
EWMA_btp_07_80_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_80_tx.xlsx','int_80_tx','F2:F176');
EWMA_btp_06_80_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_80_tx.xlsx','int_80_tx','G2:G176');
EWMA_btp_05_80_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_80_tx.xlsx','int_80_tx','H2:H176');
EWMA_btp_04_80_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_80_tx.xlsx','int_80_tx','I2:I176');
EWMA_btp_03_80_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_80_tx.xlsx','int_80_tx','J2:J176');
EWMA_btp_02_80_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_80_tx.xlsx','int_80_tx','K2:K176');
EWMA_btp_01_80_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_80_tx.xlsx','int_80_tx','L2:L176');
ppl_80_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_80_tx.xlsx','int_80_tx','M2:M176');
EWMA_ppl_09_80_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_80_tx.xlsx','int_80_tx','N2:N176');
EWMA_ppl_08_80_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_80_tx.xlsx','int_80_tx','O2:O176');
EWMA_ppl_07_80_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_80_tx.xlsx','int_80_tx','P2:P176');
EWMA_ppl_06_80_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_80_tx.xlsx','int_80_tx','Q2:Q176');
EWMA_ppl_05_80_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_80_tx.xlsx','int_80_tx','R2:R176');
EWMA_ppl_04_80_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_80_tx.xlsx','int_80_tx','S2:S176');
EWMA_ppl_03_80_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_80_tx.xlsx','int_80_tx','T2:T176');
EWMA_ppl_02_80_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_80_tx.xlsx','int_80_tx','U2:U176');
EWMA_ppl_01_80_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_80_tx.xlsx','int_80_tx','V2:V176');

btp_70_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_70_tx.xlsx','int_70_tx','C2:C177');
EWMA_btp_09_70_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_70_tx.xlsx','int_70_tx','D2:D177');
EWMA_btp_08_70_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_70_tx.xlsx','int_70_tx','E2:E177');
EWMA_btp_07_70_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_70_tx.xlsx','int_70_tx','F2:F177');
EWMA_btp_06_70_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_70_tx.xlsx','int_70_tx','G2:G177');
EWMA_btp_05_70_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_70_tx.xlsx','int_70_tx','H2:H177');
EWMA_btp_04_70_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_70_tx.xlsx','int_70_tx','I2:I177');
EWMA_btp_03_70_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_70_tx.xlsx','int_70_tx','J2:J177');
EWMA_btp_02_70_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_70_tx.xlsx','int_70_tx','K2:K177');
EWMA_btp_01_70_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_70_tx.xlsx','int_70_tx','L2:L177');
ppl_70_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_70_tx.xlsx','int_70_tx','M2:M177');
EWMA_ppl_09_70_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_70_tx.xlsx','int_70_tx','N2:N177');
EWMA_ppl_08_70_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_70_tx.xlsx','int_70_tx','O2:O177');
EWMA_ppl_07_70_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_70_tx.xlsx','int_70_tx','P2:P177');
EWMA_ppl_06_70_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_70_tx.xlsx','int_70_tx','Q2:Q177');
EWMA_ppl_05_70_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_70_tx.xlsx','int_70_tx','R2:R177');
EWMA_ppl_04_70_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_70_tx.xlsx','int_70_tx','S2:S177');
EWMA_ppl_03_70_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_70_tx.xlsx','int_70_tx','T2:T177');
EWMA_ppl_02_70_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_70_tx.xlsx','int_70_tx','U2:U177');
EWMA_ppl_01_70_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_70_tx.xlsx','int_70_tx','V2:V177');

btp_60_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_60_tx.xlsx','int_60_tx','C2:C177');
EWMA_btp_09_60_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_60_tx.xlsx','int_60_tx','D2:D177');
EWMA_btp_08_60_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_60_tx.xlsx','int_60_tx','E2:E177');
EWMA_btp_07_60_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_60_tx.xlsx','int_60_tx','F2:F177');
EWMA_btp_06_60_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_60_tx.xlsx','int_60_tx','G2:G177');
EWMA_btp_05_60_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_60_tx.xlsx','int_60_tx','H2:H177');
EWMA_btp_04_60_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_60_tx.xlsx','int_60_tx','I2:I177');
EWMA_btp_03_60_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_60_tx.xlsx','int_60_tx','J2:J177');
EWMA_btp_02_60_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_60_tx.xlsx','int_60_tx','K2:K177');
EWMA_btp_01_60_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_60_tx.xlsx','int_60_tx','L2:L177');
ppl_60_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_60_tx.xlsx','int_60_tx','M2:M177');
EWMA_ppl_09_60_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_60_tx.xlsx','int_60_tx','N2:N177');
EWMA_ppl_08_60_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_60_tx.xlsx','int_60_tx','O2:O177');
EWMA_ppl_07_60_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_60_tx.xlsx','int_60_tx','P2:P177');
EWMA_ppl_06_60_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_60_tx.xlsx','int_60_tx','Q2:Q177');
EWMA_ppl_05_60_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_60_tx.xlsx','int_60_tx','R2:R177');
EWMA_ppl_04_60_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_60_tx.xlsx','int_60_tx','S2:S177');
EWMA_ppl_03_60_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_60_tx.xlsx','int_60_tx','T2:T177');
EWMA_ppl_02_60_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_60_tx.xlsx','int_60_tx','U2:U177');
EWMA_ppl_01_60_tx = xlsread('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/int_60_tx.xlsx','int_60_tx','V2:V177');


%% Save workspace
save('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/consolidado_int.mat') 

%% Upload workspace
% load('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/consolidado_int.mat') 


%%plot
% plot(btp_70_tx)
% hold on 
% plot(EWMA_btp_01_70_tx)
% 
% figure
% plot(ppl_70_tx)
% hold on 
% plot(EWMA_ppl_01_70_tx)

figure
% plot(EWMA_ppl_01_95_tx)
% hold on 
% plot(EWMA_ppl_01_90_tx)
% hold on 
plot(EWMA_ppl_01_80_tx)
hold on
% plot(EWMA_ppl_01_70_tx)
% hold on
plot(EWMA_ppl_01_60_tx)

figure
% plot(EWMA_btp_01_95_tx)
% hold on
% plot(EWMA_btp_01_90_tx)
% hold on 
plot(EWMA_btp_01_80_tx)
hold on
% plot(EWMA_btp_01_70_tx)
% hold on
plot(EWMA_btp_01_60_tx)

% figure
% plot(btp_95_tx)
% hold on 
% plot(btp_90_tx)
% hold on 
% plot(btp_80_tx)
% hold on
% plot(btp_70_tx)


%% Count values in a range [0-100]
x_eje = [100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000];

range_0 = 0;
range_100 = 100;
range_200 = 200;
range_300 = 300;
range_400 = 400;
range_500 = 500;
range_600 = 600;
range_700 = 700;
range_800 = 800;
range_900 = 900;
range_1000 = 1000;
range_1100 = 1100;
range_1200 = 1200;
range_1300 = 1300;
range_1400 = 1400;
range_1500 = 1500;
range_1600 = 1600;
range_1700 = 1700;
range_1800 = 1800;
range_1900 = 1900;
range_2000 = 2000;



btp_95_tx_range_0_100     = sum( btp_95_tx >= range_0 & btp_95_tx < range_100 ); 
btp_95_tx_range_100_200   = sum( btp_95_tx >= range_100 & btp_95_tx < range_200 ); 
btp_95_tx_range_200_300   = sum( btp_95_tx >= range_200 & btp_95_tx < range_300 ); 
btp_95_tx_range_300_400   = sum( btp_95_tx >= range_300 & btp_95_tx < range_400 ); 
btp_95_tx_range_400_500   = sum( btp_95_tx >= range_400 & btp_95_tx < range_500 ); 
btp_95_tx_range_500_600   = sum( btp_95_tx >= range_500 & btp_95_tx < range_600 ); 
btp_95_tx_range_600_700   = sum( btp_95_tx >= range_600 & btp_95_tx < range_700 ); 
btp_95_tx_range_700_800   = sum( btp_95_tx >= range_700 & btp_95_tx < range_800 ); 
btp_95_tx_range_800_900   = sum( btp_95_tx >= range_800 & btp_95_tx < range_900 ); 
btp_95_tx_range_900_1000  = sum( btp_95_tx >= range_900 & btp_95_tx < range_1000 ); 
btp_95_tx_range_1000_1100 = sum( btp_95_tx >= range_1000 & btp_95_tx < range_1100 ); 
btp_95_tx_range_1100_1200 = sum( btp_95_tx >= range_1100 & btp_95_tx < range_1200 ); 
btp_95_tx_range_1200_1300 = sum( btp_95_tx >= range_1200 & btp_95_tx < range_1300 ); 
btp_95_tx_range_1300_1400 = sum( btp_95_tx >= range_1300 & btp_95_tx < range_1400 ); 
btp_95_tx_range_1400_1500 = sum( btp_95_tx >= range_1400 & btp_95_tx < range_1500 ); 
btp_95_tx_range_1500_1600 = sum( btp_95_tx >= range_1500 & btp_95_tx < range_1600 ); 
btp_95_tx_range_1600_1700 = sum( btp_95_tx >= range_1600 & btp_95_tx < range_1700 ); 
btp_95_tx_range_1700_1800 = sum( btp_95_tx >= range_1700 & btp_95_tx < range_1800 ); 
btp_95_tx_range_1800_1900 = sum( btp_95_tx >= range_1800 & btp_95_tx < range_1900 ); 
btp_95_tx_range_1900_2000 = sum( btp_95_tx >= range_1900 & btp_95_tx < range_2000 ); 

%EWMA_btp_01_95_tx

EWMA_btp_01_95_tx_range_0_100     = sum( EWMA_btp_01_95_tx >= range_0 & EWMA_btp_01_95_tx < range_100 ); 
EWMA_btp_01_95_tx_range_100_200   = sum( EWMA_btp_01_95_tx >= range_100 & EWMA_btp_01_95_tx < range_200 ); 
EWMA_btp_01_95_tx_range_200_300   = sum( EWMA_btp_01_95_tx >= range_200 & EWMA_btp_01_95_tx < range_300 ); 
EWMA_btp_01_95_tx_range_300_400   = sum( EWMA_btp_01_95_tx >= range_300 & EWMA_btp_01_95_tx < range_400 ); 
EWMA_btp_01_95_tx_range_400_500   = sum( EWMA_btp_01_95_tx >= range_400 & EWMA_btp_01_95_tx < range_500 ); 
EWMA_btp_01_95_tx_range_500_600   = sum( EWMA_btp_01_95_tx >= range_500 & EWMA_btp_01_95_tx < range_600 ); 
EWMA_btp_01_95_tx_range_600_700   = sum( EWMA_btp_01_95_tx >= range_600 & EWMA_btp_01_95_tx < range_700 ); 
EWMA_btp_01_95_tx_range_700_800   = sum( EWMA_btp_01_95_tx >= range_700 & EWMA_btp_01_95_tx < range_800 ); 
EWMA_btp_01_95_tx_range_800_900   = sum( EWMA_btp_01_95_tx >= range_800 & EWMA_btp_01_95_tx < range_900 ); 
EWMA_btp_01_95_tx_range_900_1000  = sum( EWMA_btp_01_95_tx >= range_900 & EWMA_btp_01_95_tx < range_1000 ); 
EWMA_btp_01_95_tx_range_1000_1100 = sum( EWMA_btp_01_95_tx >= range_1000 & EWMA_btp_01_95_tx < range_1100 ); 
EWMA_btp_01_95_tx_range_1100_1200 = sum( EWMA_btp_01_95_tx >= range_1100 & EWMA_btp_01_95_tx < range_1200 ); 
EWMA_btp_01_95_tx_range_1200_1300 = sum( EWMA_btp_01_95_tx >= range_1200 & EWMA_btp_01_95_tx < range_1300 ); 
EWMA_btp_01_95_tx_range_1300_1400 = sum( EWMA_btp_01_95_tx >= range_1300 & EWMA_btp_01_95_tx < range_1400 ); 
EWMA_btp_01_95_tx_range_1400_1500 = sum( EWMA_btp_01_95_tx >= range_1400 & EWMA_btp_01_95_tx < range_1500 ); 
EWMA_btp_01_95_tx_range_1500_1600 = sum( EWMA_btp_01_95_tx >= range_1500 & EWMA_btp_01_95_tx < range_1600 ); 
EWMA_btp_01_95_tx_range_1600_1700 = sum( EWMA_btp_01_95_tx >= range_1600 & EWMA_btp_01_95_tx < range_1700 ); 
EWMA_btp_01_95_tx_range_1700_1800 = sum( EWMA_btp_01_95_tx >= range_1700 & EWMA_btp_01_95_tx < range_1800 ); 
EWMA_btp_01_95_tx_range_1800_1900 = sum( EWMA_btp_01_95_tx >= range_1800 & EWMA_btp_01_95_tx < range_1900 ); 
EWMA_btp_01_95_tx_range_1900_2000 = sum( EWMA_btp_01_95_tx >= range_1900 & EWMA_btp_01_95_tx < range_2000 ); 

count_btp_95_tx = [ btp_95_tx_range_0_100;     
                    btp_95_tx_range_100_200; 
                    btp_95_tx_range_200_300; 
                    btp_95_tx_range_300_400; 
                    btp_95_tx_range_400_500; 
                    btp_95_tx_range_500_600; 
                    btp_95_tx_range_600_700; 
                    btp_95_tx_range_700_800; 
                    btp_95_tx_range_800_900; 
                    btp_95_tx_range_900_1000; 
                    btp_95_tx_range_1000_1100; 
                    btp_95_tx_range_1100_1200; 
                    btp_95_tx_range_1200_1300; 
                    btp_95_tx_range_1300_1400; 
                    btp_95_tx_range_1400_1500; 
                    btp_95_tx_range_1500_1600; 
                    btp_95_tx_range_1600_1700; 
                    btp_95_tx_range_1700_1800; 
                    btp_95_tx_range_1800_1900; 
                    btp_95_tx_range_1900_2000]; 
                
count_EWMA_btp_01_95_tx = [ EWMA_btp_01_95_tx_range_0_100;     
                            EWMA_btp_01_95_tx_range_100_200; 
                            EWMA_btp_01_95_tx_range_200_300; 
                            EWMA_btp_01_95_tx_range_300_400; 
                            EWMA_btp_01_95_tx_range_400_500; 
                            EWMA_btp_01_95_tx_range_500_600; 
                            EWMA_btp_01_95_tx_range_600_700; 
                            EWMA_btp_01_95_tx_range_700_800; 
                            EWMA_btp_01_95_tx_range_800_900; 
                            EWMA_btp_01_95_tx_range_900_1000; 
                            EWMA_btp_01_95_tx_range_1000_1100; 
                            EWMA_btp_01_95_tx_range_1100_1200; 
                            EWMA_btp_01_95_tx_range_1200_1300; 
                            EWMA_btp_01_95_tx_range_1300_1400; 
                            EWMA_btp_01_95_tx_range_1400_1500; 
                            EWMA_btp_01_95_tx_range_1500_1600; 
                            EWMA_btp_01_95_tx_range_1600_1700; 
                            EWMA_btp_01_95_tx_range_1700_1800; 
                            EWMA_btp_01_95_tx_range_1800_1900; 
                            EWMA_btp_01_95_tx_range_1900_2000];                 
                
% figure;
% plot(x_eje, count_btp_95_tx)
% hold on
% plot(x_eje, count_EWMA_btp_01_95_tx)
                
%count = sum(data()>=owerbound & data<=upperbound(:));
%x = [1 1 1 1 5 5 5 5 1 1 1 1];
%count = sum(x > 4 & x < 6);
