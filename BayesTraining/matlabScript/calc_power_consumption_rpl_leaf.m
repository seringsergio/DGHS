
%% power en miliWatios mW

cpu_rpl_leaf_mW = cpu_rpl_leaf * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
lpm_rpl_leaf_mW = lpm_rpl_leaf * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
transmit_rpl_leaf_mW = transmit_rpl_leaf * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
listen_rpl_leaf_mW = listen_rpl_leaf * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;

% total power consumption in mWcpu_wind_15_mW_int_0_mean

remote_power_consumption_rpl_leaf = cpu_rpl_leaf_mW + lpm_rpl_leaf_mW + transmit_rpl_leaf_mW + listen_rpl_leaf_mW;


% Promedio y desviacion estandar 
remote_power_consumption_rpl_leaf_mean = mean(remote_power_consumption_rpl_leaf);
remote_power_consumption_rpl_leaf_std  = std(remote_power_consumption_rpl_leaf);

% diferenciado 
cpu_rpl_leaf_mW_mean      = mean(cpu_rpl_leaf_mW); 
lpm_rpl_leaf_mW_mean      = mean(lpm_rpl_leaf_mW);  
transmit_rpl_leaf_mW_mean = mean(transmit_rpl_leaf_mW);
listen_rpl_leaf_mW_mean   = mean(listen_rpl_leaf_mW);

cpu_rpl_leaf_mW_std      = std(cpu_rpl_leaf_mW); 
lpm_rpl_leaf_mW_std      = std(lpm_rpl_leaf_mW);  
transmit_rpl_leaf_mW_std = std(transmit_rpl_leaf_mW);
listen_rpl_leaf_mW_std   = std(listen_rpl_leaf_mW);


%% power en miliWatios mW

cpu_rpl_leaf_int_0_mW = cpu_rpl_leaf_int_0 * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
lpm_rpl_leaf_int_0_mW = lpm_rpl_leaf_int_0 * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
transmit_rpl_leaf_int_0_mW = transmit_rpl_leaf_int_0 * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
listen_rpl_leaf_int_0_mW = listen_rpl_leaf_int_0 * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;

% total power consumption in mWcpu_wind_15_mW_int_0_mean

remote_power_consumption_rpl_leaf_int_0 = cpu_rpl_leaf_int_0_mW + lpm_rpl_leaf_int_0_mW + transmit_rpl_leaf_int_0_mW + listen_rpl_leaf_int_0_mW;


% Promedio y desviacion estandar 
remote_power_consumption_rpl_leaf_int_0_mean = mean(remote_power_consumption_rpl_leaf_int_0);
remote_power_consumption_rpl_leaf_int_0_std  = std(remote_power_consumption_rpl_leaf_int_0);

% diferenciado 
cpu_rpl_leaf_int_0_mW_mean      = mean(cpu_rpl_leaf_int_0_mW); 
lpm_rpl_leaf_int_0_mW_mean      = mean(lpm_rpl_leaf_int_0_mW);  
transmit_rpl_leaf_int_0_mW_mean = mean(transmit_rpl_leaf_int_0_mW);
listen_rpl_leaf_int_0_mW_mean   = mean(listen_rpl_leaf_int_0_mW);

cpu_rpl_leaf_int_0_mW_std      = std(cpu_rpl_leaf_int_0_mW); 
lpm_rpl_leaf_int_0_mW_std      = std(lpm_rpl_leaf_int_0_mW);  
transmit_rpl_leaf_int_0_mW_std = std(transmit_rpl_leaf_int_0_mW);
listen_rpl_leaf_int_0_mW_std   = std(listen_rpl_leaf_int_0_mW);


%% power en miliWatios mW

cpu_rpl_leaf_int_10_mW = cpu_rpl_leaf_int_10 * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
lpm_rpl_leaf_int_10_mW = lpm_rpl_leaf_int_10 * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
transmit_rpl_leaf_int_10_mW = transmit_rpl_leaf_int_10 * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
listen_rpl_leaf_int_10_mW = listen_rpl_leaf_int_10 * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;

% total power consumption in mWcpu_wind_15_mW_int_10_mean

remote_power_consumption_rpl_leaf_int_10 = cpu_rpl_leaf_int_10_mW + lpm_rpl_leaf_int_10_mW + transmit_rpl_leaf_int_10_mW + listen_rpl_leaf_int_10_mW;


% Promedio y desviacion estandar 
remote_power_consumption_rpl_leaf_int_10_mean = mean(remote_power_consumption_rpl_leaf_int_10);
remote_power_consumption_rpl_leaf_int_10_std  = std(remote_power_consumption_rpl_leaf_int_10);

% diferenciado 
cpu_rpl_leaf_int_10_mW_mean      = mean(cpu_rpl_leaf_int_10_mW); 
lpm_rpl_leaf_int_10_mW_mean      = mean(lpm_rpl_leaf_int_10_mW);  
transmit_rpl_leaf_int_10_mW_mean = mean(transmit_rpl_leaf_int_10_mW);
listen_rpl_leaf_int_10_mW_mean   = mean(listen_rpl_leaf_int_10_mW);

cpu_rpl_leaf_int_10_mW_std      = std(cpu_rpl_leaf_int_10_mW); 
lpm_rpl_leaf_int_10_mW_std      = std(lpm_rpl_leaf_int_10_mW);  
transmit_rpl_leaf_int_10_mW_std = std(transmit_rpl_leaf_int_10_mW);
listen_rpl_leaf_int_10_mW_std   = std(listen_rpl_leaf_int_10_mW);


%% power en miliWatios mW

cpu_rpl_leaf_int_20_mW = cpu_rpl_leaf_int_20 * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
lpm_rpl_leaf_int_20_mW = lpm_rpl_leaf_int_20 * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
transmit_rpl_leaf_int_20_mW = transmit_rpl_leaf_int_20 * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
listen_rpl_leaf_int_20_mW = listen_rpl_leaf_int_20 * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;

% total power consumption in mWcpu_wind_15_mW_int_20_mean

remote_power_consumption_rpl_leaf_int_20 = cpu_rpl_leaf_int_20_mW + lpm_rpl_leaf_int_20_mW + transmit_rpl_leaf_int_20_mW + listen_rpl_leaf_int_20_mW;


% Promedio y desviacion estandar 
remote_power_consumption_rpl_leaf_int_20_mean = mean(remote_power_consumption_rpl_leaf_int_20);
remote_power_consumption_rpl_leaf_int_20_std  = std(remote_power_consumption_rpl_leaf_int_20);

% diferenciado 
cpu_rpl_leaf_int_20_mW_mean      = mean(cpu_rpl_leaf_int_20_mW); 
lpm_rpl_leaf_int_20_mW_mean      = mean(lpm_rpl_leaf_int_20_mW);  
transmit_rpl_leaf_int_20_mW_mean = mean(transmit_rpl_leaf_int_20_mW);
listen_rpl_leaf_int_20_mW_mean   = mean(listen_rpl_leaf_int_20_mW);

cpu_rpl_leaf_int_20_mW_std      = std(cpu_rpl_leaf_int_20_mW); 
lpm_rpl_leaf_int_20_mW_std      = std(lpm_rpl_leaf_int_20_mW);  
transmit_rpl_leaf_int_20_mW_std = std(transmit_rpl_leaf_int_20_mW);
listen_rpl_leaf_int_20_mW_std   = std(listen_rpl_leaf_int_20_mW);


%% power en miliWatios mW

cpu_rpl_leaf_int_30_mW = cpu_rpl_leaf_int_30 * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
lpm_rpl_leaf_int_30_mW = lpm_rpl_leaf_int_30 * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
transmit_rpl_leaf_int_30_mW = transmit_rpl_leaf_int_30 * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
listen_rpl_leaf_int_30_mW = listen_rpl_leaf_int_30 * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;

% total power consumption in mWcpu_wind_15_mW_int_30_mean

remote_power_consumption_rpl_leaf_int_30 = cpu_rpl_leaf_int_30_mW + lpm_rpl_leaf_int_30_mW + transmit_rpl_leaf_int_30_mW + listen_rpl_leaf_int_30_mW;


% Promedio y desviacion estandar 
remote_power_consumption_rpl_leaf_int_30_mean = mean(remote_power_consumption_rpl_leaf_int_30);
remote_power_consumption_rpl_leaf_int_30_std  = std(remote_power_consumption_rpl_leaf_int_30);

% diferenciado 
cpu_rpl_leaf_int_30_mW_mean      = mean(cpu_rpl_leaf_int_30_mW); 
lpm_rpl_leaf_int_30_mW_mean      = mean(lpm_rpl_leaf_int_30_mW);  
transmit_rpl_leaf_int_30_mW_mean = mean(transmit_rpl_leaf_int_30_mW);
listen_rpl_leaf_int_30_mW_mean   = mean(listen_rpl_leaf_int_30_mW);

cpu_rpl_leaf_int_30_mW_std      = std(cpu_rpl_leaf_int_30_mW); 
lpm_rpl_leaf_int_30_mW_std      = std(lpm_rpl_leaf_int_30_mW);  
transmit_rpl_leaf_int_30_mW_std = std(transmit_rpl_leaf_int_30_mW);
listen_rpl_leaf_int_30_mW_std   = std(listen_rpl_leaf_int_30_mW);


%% power en miliWatios mW

cpu_rpl_leaf_int_40_mW = cpu_rpl_leaf_int_40 * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
lpm_rpl_leaf_int_40_mW = lpm_rpl_leaf_int_40 * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
transmit_rpl_leaf_int_40_mW = transmit_rpl_leaf_int_40 * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
listen_rpl_leaf_int_40_mW = listen_rpl_leaf_int_40 * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;

% total power consumption in mWcpu_wind_15_mW_int_40_mean

remote_power_consumption_rpl_leaf_int_40 = cpu_rpl_leaf_int_40_mW + lpm_rpl_leaf_int_40_mW + transmit_rpl_leaf_int_40_mW + listen_rpl_leaf_int_40_mW;


% Promedio y desviacion estandar 
remote_power_consumption_rpl_leaf_int_40_mean = mean(remote_power_consumption_rpl_leaf_int_40);
remote_power_consumption_rpl_leaf_int_40_std  = std(remote_power_consumption_rpl_leaf_int_40);

% diferenciado 
cpu_rpl_leaf_int_40_mW_mean      = mean(cpu_rpl_leaf_int_40_mW); 
lpm_rpl_leaf_int_40_mW_mean      = mean(lpm_rpl_leaf_int_40_mW);  
transmit_rpl_leaf_int_40_mW_mean = mean(transmit_rpl_leaf_int_40_mW);
listen_rpl_leaf_int_40_mW_mean   = mean(listen_rpl_leaf_int_40_mW);

cpu_rpl_leaf_int_40_mW_std      = std(cpu_rpl_leaf_int_40_mW); 
lpm_rpl_leaf_int_40_mW_std      = std(lpm_rpl_leaf_int_40_mW);  
transmit_rpl_leaf_int_40_mW_std = std(transmit_rpl_leaf_int_40_mW);
listen_rpl_leaf_int_40_mW_std   = std(listen_rpl_leaf_int_40_mW);


%% power en miliWatios mW

cpu_rpl_leaf_int_50_mW = cpu_rpl_leaf_int_50 * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
lpm_rpl_leaf_int_50_mW = lpm_rpl_leaf_int_50 * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
transmit_rpl_leaf_int_50_mW = transmit_rpl_leaf_int_50 * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
listen_rpl_leaf_int_50_mW = listen_rpl_leaf_int_50 * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;

% total power consumption in mWcpu_wind_15_mW_int_50_mean

remote_power_consumption_rpl_leaf_int_50 = cpu_rpl_leaf_int_50_mW + lpm_rpl_leaf_int_50_mW + transmit_rpl_leaf_int_50_mW + listen_rpl_leaf_int_50_mW;


% Promedio y desviacion estandar 
remote_power_consumption_rpl_leaf_int_50_mean = mean(remote_power_consumption_rpl_leaf_int_50);
remote_power_consumption_rpl_leaf_int_50_std  = std(remote_power_consumption_rpl_leaf_int_50);

% diferenciado 
cpu_rpl_leaf_int_50_mW_mean      = mean(cpu_rpl_leaf_int_50_mW); 
lpm_rpl_leaf_int_50_mW_mean      = mean(lpm_rpl_leaf_int_50_mW);  
transmit_rpl_leaf_int_50_mW_mean = mean(transmit_rpl_leaf_int_50_mW);
listen_rpl_leaf_int_50_mW_mean   = mean(listen_rpl_leaf_int_50_mW);

cpu_rpl_leaf_int_50_mW_std      = std(cpu_rpl_leaf_int_50_mW); 
lpm_rpl_leaf_int_50_mW_std      = std(lpm_rpl_leaf_int_50_mW);  
transmit_rpl_leaf_int_50_mW_std = std(transmit_rpl_leaf_int_50_mW);
listen_rpl_leaf_int_50_mW_std   = std(listen_rpl_leaf_int_50_mW);


%% power en miliWatios mW

cpu_rpl_leaf_int_60_mW = cpu_rpl_leaf_int_60 * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
lpm_rpl_leaf_int_60_mW = lpm_rpl_leaf_int_60 * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
transmit_rpl_leaf_int_60_mW = transmit_rpl_leaf_int_60 * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
listen_rpl_leaf_int_60_mW = listen_rpl_leaf_int_60 * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;

% total power consumption in mWcpu_wind_15_mW_int_60_mean

remote_power_consumption_rpl_leaf_int_60 = cpu_rpl_leaf_int_60_mW + lpm_rpl_leaf_int_60_mW + transmit_rpl_leaf_int_60_mW + listen_rpl_leaf_int_60_mW;


% Promedio y desviacion estandar 
remote_power_consumption_rpl_leaf_int_60_mean = mean(remote_power_consumption_rpl_leaf_int_60);
remote_power_consumption_rpl_leaf_int_60_std  = std(remote_power_consumption_rpl_leaf_int_60);

% diferenciado 
cpu_rpl_leaf_int_60_mW_mean      = mean(cpu_rpl_leaf_int_60_mW); 
lpm_rpl_leaf_int_60_mW_mean      = mean(lpm_rpl_leaf_int_60_mW);  
transmit_rpl_leaf_int_60_mW_mean = mean(transmit_rpl_leaf_int_60_mW);
listen_rpl_leaf_int_60_mW_mean   = mean(listen_rpl_leaf_int_60_mW);

cpu_rpl_leaf_int_60_mW_std      = std(cpu_rpl_leaf_int_60_mW); 
lpm_rpl_leaf_int_60_mW_std      = std(lpm_rpl_leaf_int_60_mW);  
transmit_rpl_leaf_int_60_mW_std = std(transmit_rpl_leaf_int_60_mW);
listen_rpl_leaf_int_60_mW_std   = std(listen_rpl_leaf_int_60_mW);


%% power en miliWatios mW

cpu_rpl_leaf_int_70_mW = cpu_rpl_leaf_int_70 * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
lpm_rpl_leaf_int_70_mW = lpm_rpl_leaf_int_70 * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
transmit_rpl_leaf_int_70_mW = transmit_rpl_leaf_int_70 * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
listen_rpl_leaf_int_70_mW = listen_rpl_leaf_int_70 * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;

% total power consumption in mWcpu_wind_15_mW_int_70_mean

remote_power_consumption_rpl_leaf_int_70 = cpu_rpl_leaf_int_70_mW + lpm_rpl_leaf_int_70_mW + transmit_rpl_leaf_int_70_mW + listen_rpl_leaf_int_70_mW;


% Promedio y desviacion estandar 
remote_power_consumption_rpl_leaf_int_70_mean = mean(remote_power_consumption_rpl_leaf_int_70);
remote_power_consumption_rpl_leaf_int_70_std  = std(remote_power_consumption_rpl_leaf_int_70);

% diferenciado 
cpu_rpl_leaf_int_70_mW_mean      = mean(cpu_rpl_leaf_int_70_mW); 
lpm_rpl_leaf_int_70_mW_mean      = mean(lpm_rpl_leaf_int_70_mW);  
transmit_rpl_leaf_int_70_mW_mean = mean(transmit_rpl_leaf_int_70_mW);
listen_rpl_leaf_int_70_mW_mean   = mean(listen_rpl_leaf_int_70_mW);

cpu_rpl_leaf_int_70_mW_std      = std(cpu_rpl_leaf_int_70_mW); 
lpm_rpl_leaf_int_70_mW_std      = std(lpm_rpl_leaf_int_70_mW);  
transmit_rpl_leaf_int_70_mW_std = std(transmit_rpl_leaf_int_70_mW);
listen_rpl_leaf_int_70_mW_std   = std(listen_rpl_leaf_int_70_mW);


%% power en miliWatios mW

cpu_rpl_leaf_int_80_mW = cpu_rpl_leaf_int_80 * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
lpm_rpl_leaf_int_80_mW = lpm_rpl_leaf_int_80 * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
transmit_rpl_leaf_int_80_mW = transmit_rpl_leaf_int_80 * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
listen_rpl_leaf_int_80_mW = listen_rpl_leaf_int_80 * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;

% total power consumption in mWcpu_wind_15_mW_int_80_mean

remote_power_consumption_rpl_leaf_int_80 = cpu_rpl_leaf_int_80_mW + lpm_rpl_leaf_int_80_mW + transmit_rpl_leaf_int_80_mW + listen_rpl_leaf_int_80_mW;


% Promedio y desviacion estandar 
remote_power_consumption_rpl_leaf_int_80_mean = mean(remote_power_consumption_rpl_leaf_int_80);
remote_power_consumption_rpl_leaf_int_80_std  = std(remote_power_consumption_rpl_leaf_int_80);

% diferenciado 
cpu_rpl_leaf_int_80_mW_mean      = mean(cpu_rpl_leaf_int_80_mW); 
lpm_rpl_leaf_int_80_mW_mean      = mean(lpm_rpl_leaf_int_80_mW);  
transmit_rpl_leaf_int_80_mW_mean = mean(transmit_rpl_leaf_int_80_mW);
listen_rpl_leaf_int_80_mW_mean   = mean(listen_rpl_leaf_int_80_mW);

cpu_rpl_leaf_int_80_mW_std      = std(cpu_rpl_leaf_int_80_mW); 
lpm_rpl_leaf_int_80_mW_std      = std(lpm_rpl_leaf_int_80_mW);  
transmit_rpl_leaf_int_80_mW_std = std(transmit_rpl_leaf_int_80_mW);
listen_rpl_leaf_int_80_mW_std   = std(listen_rpl_leaf_int_80_mW);


%% power en miliWatios mW

cpu_rpl_leaf_int_90_mW = cpu_rpl_leaf_int_90 * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
lpm_rpl_leaf_int_90_mW = lpm_rpl_leaf_int_90 * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
transmit_rpl_leaf_int_90_mW = transmit_rpl_leaf_int_90 * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
listen_rpl_leaf_int_90_mW = listen_rpl_leaf_int_90 * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;

% total power consumption in mWcpu_wind_15_mW_int_90_mean

remote_power_consumption_rpl_leaf_int_90 = cpu_rpl_leaf_int_90_mW + lpm_rpl_leaf_int_90_mW + transmit_rpl_leaf_int_90_mW + listen_rpl_leaf_int_90_mW;


% Promedio y desviacion estandar 
remote_power_consumption_rpl_leaf_int_90_mean = mean(remote_power_consumption_rpl_leaf_int_90);
remote_power_consumption_rpl_leaf_int_90_std  = std(remote_power_consumption_rpl_leaf_int_90);

% diferenciado 
cpu_rpl_leaf_int_90_mW_mean      = mean(cpu_rpl_leaf_int_90_mW); 
lpm_rpl_leaf_int_90_mW_mean      = mean(lpm_rpl_leaf_int_90_mW);  
transmit_rpl_leaf_int_90_mW_mean = mean(transmit_rpl_leaf_int_90_mW);
listen_rpl_leaf_int_90_mW_mean   = mean(listen_rpl_leaf_int_90_mW);

cpu_rpl_leaf_int_90_mW_std      = std(cpu_rpl_leaf_int_90_mW); 
lpm_rpl_leaf_int_90_mW_std      = std(lpm_rpl_leaf_int_90_mW);  
transmit_rpl_leaf_int_90_mW_std = std(transmit_rpl_leaf_int_90_mW);
listen_rpl_leaf_int_90_mW_std   = std(listen_rpl_leaf_int_90_mW);


%% power en miliWatios mW

cpu_rpl_leaf_int_100_mW = cpu_rpl_leaf_int_100 * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
lpm_rpl_leaf_int_100_mW = lpm_rpl_leaf_int_100 * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
transmit_rpl_leaf_int_100_mW = transmit_rpl_leaf_int_100 * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
listen_rpl_leaf_int_100_mW = listen_rpl_leaf_int_100 * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;

% total power consumption in mWcpu_wind_15_mW_int_100_mean

remote_power_consumption_rpl_leaf_int_100 = cpu_rpl_leaf_int_100_mW + lpm_rpl_leaf_int_100_mW + transmit_rpl_leaf_int_100_mW + listen_rpl_leaf_int_100_mW;


% Promedio y desviacion estandar 
remote_power_consumption_rpl_leaf_int_100_mean = mean(remote_power_consumption_rpl_leaf_int_100);
remote_power_consumption_rpl_leaf_int_100_std  = std(remote_power_consumption_rpl_leaf_int_100);

% diferenciado 
cpu_rpl_leaf_int_100_mW_mean      = mean(cpu_rpl_leaf_int_100_mW); 
lpm_rpl_leaf_int_100_mW_mean      = mean(lpm_rpl_leaf_int_100_mW);  
transmit_rpl_leaf_int_100_mW_mean = mean(transmit_rpl_leaf_int_100_mW);
listen_rpl_leaf_int_100_mW_mean   = mean(listen_rpl_leaf_int_100_mW);

cpu_rpl_leaf_int_100_mW_std      = std(cpu_rpl_leaf_int_100_mW); 
lpm_rpl_leaf_int_100_mW_std      = std(lpm_rpl_leaf_int_100_mW);  
transmit_rpl_leaf_int_100_mW_std = std(transmit_rpl_leaf_int_100_mW);
listen_rpl_leaf_int_100_mW_std   = std(listen_rpl_leaf_int_100_mW);

