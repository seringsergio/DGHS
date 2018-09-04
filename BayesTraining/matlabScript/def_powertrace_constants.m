%% Remote constants

rtimer_second_remote         = 32768  ; % RTIMER_SECOND: It is the number of ticks per second  for the remote

powertrace_period_basictree  = 10     ; % powertrace_start(CLOCK_SECOND * POWERTRACE_PERIOD); //En la pagina este valor se llama runtime. Esta en segundos
powertrace_period_rpl        = 3      ; % powertrace_start(CLOCK_SECOND * POWERTRACE_PERIOD); //En la pagina este valor se llama runtime. Esta en segundos

current_CPU_remote           = 0.6    ; % REmote datasheet. Esta en miliamperios
current_LPM_remote           = 0.0004 ; % REmote datasheet. Esta en miliamperios
current_TX_remote_0_dBm      = 24     ; % REmote datasheet. Esta en miliamTX_remote_0_dBm  = 24 ; % Esta en miliamperios para 0 dBm
current_RX_remote            = 20     ; % REmote datasheet. Esta en miliamperios
voltage_remote               = 3.2    ; % Ejemplo zoul-demo.c en Contiki. Esta en voltios

%TelosB CM5000 (3V,       Voltage --
%               330 uA = 0.33 mA,   CPU
%               1.1 uA = 0.0011 mA,   LPM 
%               17.4mA,  TX --++
%               18.8mA   RX) --++

%% ref: https://sourceforge.net/p/contiki/mailman/message/28530850/
%% ref: https://stackoverflow.com/questions/34193909/calclulate-power-consumption-when-cpu-dont-change-to-lpm-mode-in-contiki
%% ref: http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dui0552a/CHDJJHJI.html
% ENERGEST_TYPE_CPU //full power cpu time
% ENERGEST_TYPE_LPM //reduced power cpu time
% ENERGEST_TYPE_LISTEN //radio rx time
% ENERGEST_TYPE_TRANSMIT //radio tx time

% 2.5. Power management
% The Cortex-M3 processor sleep modes reduce power consumption. The sleep modes your device implements are implementation-defined, but they might be one or all of the following:
% 
% sleep mode stops the processor clock
% 
% deep sleep mode stops the system clock and switches off the PLL and flash memory.
% 
% If your device implements two sleep modes providing different levels of power saving, the SLEEPDEEP bit of the SCR selects which sleep mode is used, see System Control Register . For more information about the behavior of the sleep modes see the documentation supplied by your device vendor.
% 
% This section describes the mechanisms for entering sleep mode, and the conditions for waking up from sleep mode.

%% define plot constants
num_muestras = 33; % numero de columnas de las variables all_cpu, all_lpm, all_transmit, all_listen
X_axis_time  = 0:powertrace_period_basictree:( (num_muestras-2)*powertrace_period_basictree); 

num_nodes    = 2; % numero de nodos
X_axis_nodes = 1:1:num_nodes;

int_vec_nodes = zeros(num_nodes);

%% Para plotear incremento LPM por 45... Solo para verlo en la grafica
factor_ploteo     = 60; 
factor_ploteo_cpu = 2; 

