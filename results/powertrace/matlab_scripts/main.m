%% ref

% http://thingschat.blogspot.com/2015/04/contiki-os-using-powertrace-and.html
% pagina web de donde saque los calculos

% La pg menciona las referencias:
% A. Dunkels, “The contikimac radio duty cycling protocol,” Swedish Institute of Computer Science report, 2011.
% A. Dunkels, F. Osterlind, N. Tsiftes, and Z. He, “Software-based on-line energy estimation for sensor nodes,” in Proceedings of the 4th workshop on Embedded networked sensors. ACM, 2007, pp. 28–32.

%% init
close all
clc
clear

%% read excel files
read_powertrace


%% Save workspace
save('/home/seringsergio/Desktop/DGHS/results/powertrace/excel_files/consolidado_powertrace.mat') 


%% Upload workspace
% load('/home/seringsergio/Desktop/DGHS/results/powertrace/excel_files/consolidado_powertrace.mat') 

%% def_constants

def_constants


%% Calculo de potencia en mW

calc_power_consumption

%% plot

plot_in_time




