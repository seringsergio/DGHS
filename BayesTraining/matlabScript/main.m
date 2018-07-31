%% Before
close all
clear all 
clc

%% Read file

%  readFiles_training
%  readFiles_classify

% Save workspace
%  save('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv_v1/consolidado_int.mat') 

%% Upload workspace
load('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv_v1/consolidado_int.mat') 

 
%% Count values in a range [0-100]

def_range

%% Count btp

% count_btp
count_EWMA_btp_01
count_EWMA_btp_02
count_EWMA_btp_03
count_EWMA_btp_04
count_EWMA_btp_05
count_EWMA_btp_06
count_EWMA_btp_07                
count_EWMA_btp_08
count_EWMA_btp_09

%% Count ppl                        

% count_ppl
count_EWMA_ppl_01
count_EWMA_ppl_02
count_EWMA_ppl_03
count_EWMA_ppl_04
count_EWMA_ppl_05
count_EWMA_ppl_06
count_EWMA_ppl_07
count_EWMA_ppl_08
count_EWMA_ppl_09


%% frecuency_table

frecuency_table_btp_01 = [ count_EWMA_btp_01_0_tx' count_EWMA_btp_01_10_tx' count_EWMA_btp_01_20_tx' count_EWMA_btp_01_30_tx' count_EWMA_btp_01_40_tx' count_EWMA_btp_01_50_tx' count_EWMA_btp_01_60_tx' count_EWMA_btp_01_70_tx' count_EWMA_btp_01_80_tx' count_EWMA_btp_01_90_tx' count_EWMA_btp_01_100_tx' ];
frecuency_table_ppl_01 = [ count_EWMA_ppl_01_0_tx' count_EWMA_ppl_01_10_tx' count_EWMA_ppl_01_20_tx' count_EWMA_ppl_01_30_tx' count_EWMA_ppl_01_40_tx' count_EWMA_ppl_01_50_tx' count_EWMA_ppl_01_60_tx' count_EWMA_ppl_01_70_tx' count_EWMA_ppl_01_80_tx' count_EWMA_ppl_01_90_tx' count_EWMA_ppl_01_100_tx'];

frecuency_table_btp_02 = [ count_EWMA_btp_02_0_tx' count_EWMA_btp_02_10_tx' count_EWMA_btp_02_20_tx' count_EWMA_btp_02_30_tx' count_EWMA_btp_02_40_tx' count_EWMA_btp_02_50_tx' count_EWMA_btp_02_60_tx' count_EWMA_btp_02_70_tx' count_EWMA_btp_02_80_tx' count_EWMA_btp_02_90_tx' count_EWMA_btp_02_100_tx' ];
frecuency_table_ppl_02 = [ count_EWMA_ppl_02_0_tx' count_EWMA_ppl_02_10_tx' count_EWMA_ppl_02_20_tx' count_EWMA_ppl_02_30_tx' count_EWMA_ppl_02_40_tx' count_EWMA_ppl_02_50_tx' count_EWMA_ppl_02_60_tx' count_EWMA_ppl_02_70_tx' count_EWMA_ppl_02_80_tx' count_EWMA_ppl_02_90_tx' count_EWMA_ppl_02_100_tx'];

frecuency_table_btp_03 = [ count_EWMA_btp_03_0_tx' count_EWMA_btp_03_10_tx' count_EWMA_btp_03_20_tx' count_EWMA_btp_03_30_tx' count_EWMA_btp_03_40_tx' count_EWMA_btp_03_50_tx' count_EWMA_btp_03_60_tx' count_EWMA_btp_03_70_tx' count_EWMA_btp_03_80_tx' count_EWMA_btp_03_90_tx' count_EWMA_btp_03_100_tx' ];
frecuency_table_ppl_03 = [ count_EWMA_ppl_03_0_tx' count_EWMA_ppl_03_10_tx' count_EWMA_ppl_03_20_tx' count_EWMA_ppl_03_30_tx' count_EWMA_ppl_03_40_tx' count_EWMA_ppl_03_50_tx' count_EWMA_ppl_03_60_tx' count_EWMA_ppl_03_70_tx' count_EWMA_ppl_03_80_tx' count_EWMA_ppl_03_90_tx' count_EWMA_ppl_03_100_tx'];

frecuency_table_btp_04 = [ count_EWMA_btp_04_0_tx' count_EWMA_btp_04_10_tx' count_EWMA_btp_04_20_tx' count_EWMA_btp_04_30_tx' count_EWMA_btp_04_40_tx' count_EWMA_btp_04_50_tx' count_EWMA_btp_04_60_tx' count_EWMA_btp_04_70_tx' count_EWMA_btp_04_80_tx' count_EWMA_btp_04_90_tx' count_EWMA_btp_04_100_tx' ];
frecuency_table_ppl_04 = [ count_EWMA_ppl_04_0_tx' count_EWMA_ppl_04_10_tx' count_EWMA_ppl_04_20_tx' count_EWMA_ppl_04_30_tx' count_EWMA_ppl_04_40_tx' count_EWMA_ppl_04_50_tx' count_EWMA_ppl_04_60_tx' count_EWMA_ppl_04_70_tx' count_EWMA_ppl_04_80_tx' count_EWMA_ppl_04_90_tx' count_EWMA_ppl_04_100_tx'];

frecuency_table_btp_05 = [ count_EWMA_btp_05_0_tx' count_EWMA_btp_05_10_tx' count_EWMA_btp_05_20_tx' count_EWMA_btp_05_30_tx' count_EWMA_btp_05_40_tx' count_EWMA_btp_05_50_tx' count_EWMA_btp_05_60_tx' count_EWMA_btp_05_70_tx' count_EWMA_btp_05_80_tx' count_EWMA_btp_05_90_tx' count_EWMA_btp_05_100_tx' ];
frecuency_table_ppl_05 = [ count_EWMA_ppl_05_0_tx' count_EWMA_ppl_05_10_tx' count_EWMA_ppl_05_20_tx' count_EWMA_ppl_05_30_tx' count_EWMA_ppl_05_40_tx' count_EWMA_ppl_05_50_tx' count_EWMA_ppl_05_60_tx' count_EWMA_ppl_05_70_tx' count_EWMA_ppl_05_80_tx' count_EWMA_ppl_05_90_tx' count_EWMA_ppl_05_100_tx'];

frecuency_table_btp_06 = [ count_EWMA_btp_06_0_tx' count_EWMA_btp_06_10_tx' count_EWMA_btp_06_20_tx' count_EWMA_btp_06_30_tx' count_EWMA_btp_06_40_tx' count_EWMA_btp_06_50_tx' count_EWMA_btp_06_60_tx' count_EWMA_btp_06_70_tx' count_EWMA_btp_06_80_tx' count_EWMA_btp_06_90_tx' count_EWMA_btp_06_100_tx' ];
frecuency_table_ppl_06 = [ count_EWMA_ppl_06_0_tx' count_EWMA_ppl_06_10_tx' count_EWMA_ppl_06_20_tx' count_EWMA_ppl_06_30_tx' count_EWMA_ppl_06_40_tx' count_EWMA_ppl_06_50_tx' count_EWMA_ppl_06_60_tx' count_EWMA_ppl_06_70_tx' count_EWMA_ppl_06_80_tx' count_EWMA_ppl_06_90_tx' count_EWMA_ppl_06_100_tx'];

frecuency_table_btp_07 = [ count_EWMA_btp_07_0_tx' count_EWMA_btp_07_10_tx' count_EWMA_btp_07_20_tx' count_EWMA_btp_07_30_tx' count_EWMA_btp_07_40_tx' count_EWMA_btp_07_50_tx' count_EWMA_btp_07_60_tx' count_EWMA_btp_07_70_tx' count_EWMA_btp_07_80_tx' count_EWMA_btp_07_90_tx' count_EWMA_btp_07_100_tx' ];
frecuency_table_ppl_07 = [ count_EWMA_ppl_07_0_tx' count_EWMA_ppl_07_10_tx' count_EWMA_ppl_07_20_tx' count_EWMA_ppl_07_30_tx' count_EWMA_ppl_07_40_tx' count_EWMA_ppl_07_50_tx' count_EWMA_ppl_07_60_tx' count_EWMA_ppl_07_70_tx' count_EWMA_ppl_07_80_tx' count_EWMA_ppl_07_90_tx' count_EWMA_ppl_07_100_tx'];

frecuency_table_btp_08 = [ count_EWMA_btp_08_0_tx' count_EWMA_btp_08_10_tx' count_EWMA_btp_08_20_tx' count_EWMA_btp_08_30_tx' count_EWMA_btp_08_40_tx' count_EWMA_btp_08_50_tx' count_EWMA_btp_08_60_tx' count_EWMA_btp_08_70_tx' count_EWMA_btp_08_80_tx' count_EWMA_btp_08_90_tx' count_EWMA_btp_08_100_tx' ];
frecuency_table_ppl_08 = [ count_EWMA_ppl_08_0_tx' count_EWMA_ppl_08_10_tx' count_EWMA_ppl_08_20_tx' count_EWMA_ppl_08_30_tx' count_EWMA_ppl_08_40_tx' count_EWMA_ppl_08_50_tx' count_EWMA_ppl_08_60_tx' count_EWMA_ppl_08_70_tx' count_EWMA_ppl_08_80_tx' count_EWMA_ppl_08_90_tx' count_EWMA_ppl_08_100_tx'];

frecuency_table_btp_09 = [ count_EWMA_btp_09_0_tx' count_EWMA_btp_09_10_tx' count_EWMA_btp_09_20_tx' count_EWMA_btp_09_30_tx' count_EWMA_btp_09_40_tx' count_EWMA_btp_09_50_tx' count_EWMA_btp_09_60_tx' count_EWMA_btp_09_70_tx' count_EWMA_btp_09_80_tx' count_EWMA_btp_09_90_tx' count_EWMA_btp_09_100_tx' ];
frecuency_table_ppl_09 = [ count_EWMA_ppl_09_0_tx' count_EWMA_ppl_09_10_tx' count_EWMA_ppl_09_20_tx' count_EWMA_ppl_09_30_tx' count_EWMA_ppl_09_40_tx' count_EWMA_ppl_09_50_tx' count_EWMA_ppl_09_60_tx' count_EWMA_ppl_09_70_tx' count_EWMA_ppl_09_80_tx' count_EWMA_ppl_09_90_tx' count_EWMA_ppl_09_100_tx'];

%% detection interference
detection_interference

%% Calculate mean and standard deviation (std)
mean_std

%% Plot results                        

plot_results_previous
plot_results_final


                

