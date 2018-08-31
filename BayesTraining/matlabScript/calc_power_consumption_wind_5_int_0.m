%% remove outliers

transmit_wind_5_int_0 = transmit_wind_5_int_0(~Isoutlier(transmit_wind_5_int_0));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_5_int_0) length(lpm_wind_5_int_0) length(transmit_wind_5_int_0) length(listen_wind_5_int_0) ] );

cpu_wind_5_int_0      = cpu_wind_5_int_0(1:minLength);
lpm_wind_5_int_0      = lpm_wind_5_int_0(1:minLength);
transmit_wind_5_int_0 = transmit_wind_5_int_0(1:minLength);
listen_wind_5_int_0   = listen_wind_5_int_0(1:minLength);


%% power en miliWatios mW

cpu_wind_5_mW_int_0 = cpu_wind_5_int_0 * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
lpm_wind_5_mW_int_0 = lpm_wind_5_int_0 * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
transmit_wind_5_mW_int_0 = transmit_wind_5_int_0 * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
listen_wind_5_mW_int_0 = listen_wind_5_int_0 * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;

%% total power consumption in mW

remote_power_consumption_int_0_wind_5 = cpu_wind_5_mW_int_0 + lpm_wind_5_mW_int_0 + transmit_wind_5_mW_int_0 + listen_wind_5_mW_int_0;


%% Promedio y desviacion estandar 
remote_power_consumption_int_0_wind_5_mean = mean(remote_power_consumption_int_0_wind_5);
remote_power_consumption_int_0_wind_5_std  = std(remote_power_consumption_int_0_wind_5);

% diferenciado 
cpu_wind_5_mW_int_0_mean      = mean(cpu_wind_5_mW_int_0); 
lpm_wind_5_mW_int_0_mean      = mean(lpm_wind_5_mW_int_0);  
transmit_wind_5_mW_int_0_mean = mean(transmit_wind_5_mW_int_0);
listen_wind_5_mW_int_0_mean   = mean(listen_wind_5_mW_int_0);

cpu_wind_5_mW_int_0_std      = std(cpu_wind_5_mW_int_0); 
lpm_wind_5_mW_int_0_std      = std(lpm_wind_5_mW_int_0);  
transmit_wind_5_mW_int_0_std = std(transmit_wind_5_mW_int_0);
listen_wind_5_mW_int_0_std   = std(listen_wind_5_mW_int_0);