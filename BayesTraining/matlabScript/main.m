%% Before
close all
clear all 
clc

%% Read file

% readFiles

%% Save workspace
% save('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/consolidado_int.mat') 

%% Upload workspace
load('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv/consolidado_int.mat') 


%% Count values in a range [0-100]

def_range

%% Count btp

count_btp
count_EWMA_btp
                
%% Count ppl                        

count_ppl
count_EWMA_ppl

%% Plot results                        

plot_results
                

