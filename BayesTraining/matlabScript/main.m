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
% count_EWMA_btp_02
% count_EWMA_btp_07                

%% Count ppl                        

% count_ppl
count_EWMA_ppl_01
% count_EWMA_ppl_02
% count_EWMA_ppl_07

%% frecuency_table

frecuency_table_btp = [ count_EWMA_btp_01_0_tx' count_EWMA_btp_01_10_tx' count_EWMA_btp_01_20_tx' count_EWMA_btp_01_30_tx' count_EWMA_btp_01_40_tx' count_EWMA_btp_01_50_tx' count_EWMA_btp_01_60_tx' count_EWMA_btp_01_70_tx' count_EWMA_btp_01_80_tx' count_EWMA_btp_01_90_tx' count_EWMA_btp_01_100_tx' ];

frecuency_table_ppl = [ count_EWMA_ppl_01_0_tx' count_EWMA_ppl_01_10_tx' count_EWMA_ppl_01_20_tx' count_EWMA_ppl_01_30_tx' count_EWMA_ppl_01_40_tx' count_EWMA_ppl_01_50_tx' count_EWMA_ppl_01_60_tx' count_EWMA_ppl_01_70_tx' count_EWMA_ppl_01_80_tx' count_EWMA_ppl_01_90_tx' count_EWMA_ppl_01_100_tx'];

%% detection interference
detection_interference

%% Calculate mean and standard deviation (std)
mean_std

%% Plot results                        

plot_results_previous
plot_results_final


                

