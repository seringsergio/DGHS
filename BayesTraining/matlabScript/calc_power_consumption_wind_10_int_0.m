
%% diff: calcula la diferencia entre el siguiente elemento y el actual

all_cpu_wind_10_diff_int_0      = diff(all_cpu_wind_10_int_0); 
all_lpm_wind_10_diff_int_0      = diff(all_lpm_wind_10_int_0); 
all_transmit_wind_10_diff_int_0 = diff(all_transmit_wind_10_int_0); 
all_listen_wind_10_diff_int_0   = diff(all_listen_wind_10_int_0); 

%% Dado que el contador de powertrace se reinicia, en un punto la diff da negativa.
%  Por lo tanto toca eliminar los datos negativos de los datos.
%  Para eliminar los Zeros de un vector ejecuto A(A>=0)

all_cpu_wind_10_diff_int_0 = all_cpu_wind_10_diff_int_0( all_cpu_wind_10_diff_int_0>=0 );
all_lpm_wind_10_diff_int_0 = all_lpm_wind_10_diff_int_0( all_lpm_wind_10_diff_int_0>=0 );
all_transmit_wind_10_diff_int_0 = all_transmit_wind_10_diff_int_0( all_transmit_wind_10_diff_int_0>=0 );
all_listen_wind_10_diff_int_0 = all_listen_wind_10_diff_int_0( all_listen_wind_10_diff_int_0>=0 );

% Hacer los vectores del mismo tamaño. Del minimo tamaño.

minLength = min( [length(all_cpu_wind_10_diff_int_0),length(all_lpm_wind_10_diff_int_0),length(all_transmit_wind_10_diff_int_0),length(all_listen_wind_10_diff_int_0)]   );

all_cpu_wind_10_diff_int_0 = all_cpu_wind_10_diff_int_0(1:minLength);
all_lpm_wind_10_diff_int_0 = all_lpm_wind_10_diff_int_0(1:minLength);
all_transmit_wind_10_diff_int_0 = all_transmit_wind_10_diff_int_0(1:minLength);
all_listen_wind_10_diff_int_0 = all_listen_wind_10_diff_int_0(1:minLength);

%% power en miliWatios mW

all_cpu_wind_10_diff_mW_int_0 = all_cpu_wind_10_diff_int_0 * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
all_lpm_wind_10_diff_mW_int_0 = all_lpm_wind_10_diff_int_0 * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
all_transmit_wind_10_diff_mW_int_0 = all_transmit_wind_10_diff_int_0 * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
all_listen_wind_10_diff_mW_int_0 = all_listen_wind_10_diff_int_0 * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;

%% total power consumption in mW

remote_power_consumption_int_0_wind_10 = all_cpu_wind_10_diff_mW_int_0 + all_lpm_wind_10_diff_mW_int_0 + all_transmit_wind_10_diff_mW_int_0 + all_listen_wind_10_diff_mW_int_0;


%% Promedio y desviacion estandar 
remote_power_consumption_int_0_wind_10_mean = mean(remote_power_consumption_int_0_wind_10);
remote_power_consumption_int_0_wind_10_std  = std(remote_power_consumption_int_0_wind_10);


% diferenciado 
all_cpu_wind_10_diff_mW_int_0_mean      = mean(all_cpu_wind_10_diff_mW_int_0); 
all_lpm_wind_10_diff_mW_int_0_mean      = mean(all_lpm_wind_10_diff_mW_int_0);  
all_transmit_wind_10_diff_mW_int_0_mean = mean(all_transmit_wind_10_diff_mW_int_0);
all_listen_wind_10_diff_mW_int_0_mean   = mean(all_listen_wind_10_diff_mW_int_0);                                        

all_cpu_wind_10_diff_mW_int_0_std      = std(all_cpu_wind_10_diff_mW_int_0); 
all_lpm_wind_10_diff_mW_int_0_std      = std(all_lpm_wind_10_diff_mW_int_0);  
all_transmit_wind_10_diff_mW_int_0_std = std(all_transmit_wind_10_diff_mW_int_0);
all_listen_wind_10_diff_mW_int_0_std   = std(all_listen_wind_10_diff_mW_int_0);  