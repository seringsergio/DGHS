
%% diff: calcula la diferencia entre el siguiente elemento y el actual

all_cpu_wind_10_diff_int_0      = diff(all_cpu_wind_10_int_0); 
all_lpm_wind_10_diff_int_0      = diff(all_lpm_wind_10_int_0); 
all_transmit_wind_10_diff_int_0 = diff(all_transmit_wind_10_int_0); 
all_listen_wind_10_diff_int_0   = diff(all_listen_wind_10_int_0); 


%% power en miliWatios mW

all_cpu_wind_10_diff_mW_int_0 = all_cpu_wind_10_diff_int_0 * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period;
all_lpm_wind_10_diff_mW_int_0 = all_lpm_wind_10_diff_int_0 * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period;
all_transmit_wind_10_diff_mW_int_0 = all_transmit_wind_10_diff_int_0 * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period;
all_listen_wind_10_diff_mW_int_0 = all_listen_wind_10_diff_int_0 * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period;

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