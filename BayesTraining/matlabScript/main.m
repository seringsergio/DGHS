%% Before
close all
clear all 
clc

%% Read file

%   readFiles_training
%   readFiles_classify
%   readFiles_powertrace
%% Save workspace
%   save('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv_v1/consolidado_int.mat') 

%% Upload workspace
load('/home/seringsergio/Desktop/DGHS/BayesTraining/results/vary_int_csv_v1/consolidado_int.mat') 


%% definir rangos

def_range

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
def_powertrace_constants

calc_power_consumption_wind_5
calc_power_consumption_wind_10
calc_power_consumption_wind_15
calc_power_consumption_wind_20
calc_power_consumption_wind_25
calc_power_consumption_wind_30
calc_power_consumption_wind_35

consolidado_power_trace
%% plot

plot_results_previous
plot_results_final