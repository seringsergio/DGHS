

%% power en miliWatios mW

cpu_wind_30_mW_int_0 = cpu_wind_30_int_0 * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
lpm_wind_30_mW_int_0 = lpm_wind_30_int_0 * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
transmit_wind_30_mW_int_0 = transmit_wind_30_int_0 * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
listen_wind_30_mW_int_0 = listen_wind_30_int_0 * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;

%% total power consumption in mW

remote_power_consumption_int_0_wind_30 = cpu_wind_30_mW_int_0 + lpm_wind_30_mW_int_0 + transmit_wind_30_mW_int_0 + listen_wind_30_mW_int_0;


%% Promedio y desviacion estandar 
remote_power_consumption_int_0_wind_30_mean = mean(remote_power_consumption_int_0_wind_30);
remote_power_consumption_int_0_wind_30_std  = std(remote_power_consumption_int_0_wind_30);

% diferenciado 
cpu_wind_30_mW_int_0_mean      = mean(cpu_wind_30_mW_int_0); 
lpm_wind_30_mW_int_0_mean      = mean(lpm_wind_30_mW_int_0);  
transmit_wind_30_mW_int_0_mean = mean(transmit_wind_30_mW_int_0);
listen_wind_30_mW_int_0_mean   = mean(listen_wind_30_mW_int_0);

cpu_wind_30_mW_int_0_std      = std(cpu_wind_30_mW_int_0); 
lpm_wind_30_mW_int_0_std      = std(lpm_wind_30_mW_int_0);  
transmit_wind_30_mW_int_0_std = std(transmit_wind_30_mW_int_0);
listen_wind_30_mW_int_0_std   = std(listen_wind_30_mW_int_0);