
%% power en miliWatios mW

cpu_wind_15_mW_int_70 = cpu_wind_15_int_70 * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
lpm_wind_15_mW_int_70 = lpm_wind_15_int_70 * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
transmit_wind_15_mW_int_70 = transmit_wind_15_int_70 * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
listen_wind_15_mW_int_70 = listen_wind_15_int_70 * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;

%% total power consumption in mW

remote_power_consumption_int_70_wind_15 = cpu_wind_15_mW_int_70 + lpm_wind_15_mW_int_70 + transmit_wind_15_mW_int_70 + listen_wind_15_mW_int_70;


%% Promedio y desviacion estandar 
remote_power_consumption_int_70_wind_15_mean = mean(remote_power_consumption_int_70_wind_15);
remote_power_consumption_int_70_wind_15_std  = std(remote_power_consumption_int_70_wind_15);
                        
% diferenciado 
cpu_wind_15_mW_int_70_mean      = mean(cpu_wind_15_mW_int_70); 
lpm_wind_15_mW_int_70_mean      = mean(lpm_wind_15_mW_int_70);  
transmit_wind_15_mW_int_70_mean = mean(transmit_wind_15_mW_int_70);
listen_wind_15_mW_int_70_mean   = mean(listen_wind_15_mW_int_70);

cpu_wind_15_mW_int_70_std      = std(cpu_wind_15_mW_int_70); 
lpm_wind_15_mW_int_70_std      = std(lpm_wind_15_mW_int_70);  
transmit_wind_15_mW_int_70_std = std(transmit_wind_15_mW_int_70);
listen_wind_15_mW_int_70_std   = std(listen_wind_15_mW_int_70);