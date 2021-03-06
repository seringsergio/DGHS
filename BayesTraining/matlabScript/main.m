%% Before
close all
clear all 
clc

%% Read file

% readFiles_training
% readFiles_classify
% readFiles_powertrace
% readFiles_rpl
% readFiles_latency_PRR

%% definir rangos
% def_range

%% definir las constantes para el nodo: Re-Mote
% def_powertrace_constants
 
%% Save workspace
% save('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv_v1/consolidado_int.mat') 

%% Upload workspace
load('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv_v1/consolidado_int.mat') 

%% Remove Outliers

% remove_outliers_powertrace
% remove_outliers_rpl



%% para las diferentes ventanas 

main_wind_5
main_wind_10
main_wind_15
main_wind_20
main_wind_25
main_wind_30
main_wind_35

%% Calculate mean and standard deviation (std)
mean_std_wind_10


%% Calculate power consumption (mW)

compute_power_comsumption


%% rpl_metrics

rpl_metrics

%% Compute latency and PRR (Packet reception rate)

compute_latency_PRR

%% plot

plot_results_previous
plot_results_final

