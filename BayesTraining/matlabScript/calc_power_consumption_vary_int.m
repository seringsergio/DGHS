%% Para interferencia de:  int_0_citt  wind_35

% remove outliers

listen_wind_35_int_0_citt = listen_wind_35_int_0_citt(~Isoutlier(listen_wind_35_int_0_citt));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_35_int_0_citt) length(lpm_wind_35_int_0_citt) length(transmit_wind_35_int_0_citt) length(listen_wind_35_int_0_citt) ] );

cpu_wind_35_int_0_citt      = cpu_wind_35_int_0_citt(1:minLength);
lpm_wind_35_int_0_citt      = lpm_wind_35_int_0_citt(1:minLength);
transmit_wind_35_int_0_citt = transmit_wind_35_int_0_citt(1:minLength);
listen_wind_35_int_0_citt   = listen_wind_35_int_0_citt(1:minLength);

% power en miliWatios mW

cpu_wind_35_mW_int_0_citt = cpu_wind_35_int_0_citt * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
lpm_wind_35_mW_int_0_citt = lpm_wind_35_int_0_citt * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
transmit_wind_35_mW_int_0_citt = transmit_wind_35_int_0_citt * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
listen_wind_35_mW_int_0_citt = listen_wind_35_int_0_citt * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;

% total power consumption in mW

remote_power_consumption_int_0_citt_wind_35 = cpu_wind_35_mW_int_0_citt + lpm_wind_35_mW_int_0_citt + transmit_wind_35_mW_int_0_citt + listen_wind_35_mW_int_0_citt;


% Promedio y desviacion estandar 
remote_power_consumption_int_0_citt_wind_35_mean = mean(remote_power_consumption_int_0_citt_wind_35);
remote_power_consumption_int_0_citt_wind_35_std  = std(remote_power_consumption_int_0_citt_wind_35);

% diferenciado 
cpu_wind_35_mW_int_0_citt_mean      = mean(cpu_wind_35_mW_int_0_citt); 
lpm_wind_35_mW_int_0_citt_mean      = mean(lpm_wind_35_mW_int_0_citt);  
transmit_wind_35_mW_int_0_citt_mean = mean(transmit_wind_35_mW_int_0_citt);
listen_wind_35_mW_int_0_citt_mean   = mean(listen_wind_35_mW_int_0_citt);

cpu_wind_35_mW_int_0_citt_std      = std(cpu_wind_35_mW_int_0_citt); 
lpm_wind_35_mW_int_0_citt_std      = std(lpm_wind_35_mW_int_0_citt);  
transmit_wind_35_mW_int_0_citt_std = std(transmit_wind_35_mW_int_0_citt);
listen_wind_35_mW_int_0_citt_std   = std(listen_wind_35_mW_int_0_citt);


%% Para interferencia de:  int_10_citt  wind_35

% remove outliers

listen_wind_35_int_10_citt = listen_wind_35_int_10_citt(~Isoutlier(listen_wind_35_int_10_citt));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_35_int_10_citt) length(lpm_wind_35_int_10_citt) length(transmit_wind_35_int_10_citt) length(listen_wind_35_int_10_citt) ] );

cpu_wind_35_int_10_citt      = cpu_wind_35_int_10_citt(1:minLength);
lpm_wind_35_int_10_citt      = lpm_wind_35_int_10_citt(1:minLength);
transmit_wind_35_int_10_citt = transmit_wind_35_int_10_citt(1:minLength);
listen_wind_35_int_10_citt   = listen_wind_35_int_10_citt(1:minLength);

% power en miliWatios mW

cpu_wind_35_mW_int_10_citt = cpu_wind_35_int_10_citt * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
lpm_wind_35_mW_int_10_citt = lpm_wind_35_int_10_citt * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
transmit_wind_35_mW_int_10_citt = transmit_wind_35_int_10_citt * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
listen_wind_35_mW_int_10_citt = listen_wind_35_int_10_citt * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;

% total power consumption in mW

remote_power_consumption_int_10_citt_wind_35 = cpu_wind_35_mW_int_10_citt + lpm_wind_35_mW_int_10_citt + transmit_wind_35_mW_int_10_citt + listen_wind_35_mW_int_10_citt;


% Promedio y desviacion estandar 
remote_power_consumption_int_10_citt_wind_35_mean = mean(remote_power_consumption_int_10_citt_wind_35);
remote_power_consumption_int_10_citt_wind_35_std  = std(remote_power_consumption_int_10_citt_wind_35);

% diferenciado 
cpu_wind_35_mW_int_10_citt_mean      = mean(cpu_wind_35_mW_int_10_citt); 
lpm_wind_35_mW_int_10_citt_mean      = mean(lpm_wind_35_mW_int_10_citt);  
transmit_wind_35_mW_int_10_citt_mean = mean(transmit_wind_35_mW_int_10_citt);
listen_wind_35_mW_int_10_citt_mean   = mean(listen_wind_35_mW_int_10_citt);

cpu_wind_35_mW_int_10_citt_std      = std(cpu_wind_35_mW_int_10_citt); 
lpm_wind_35_mW_int_10_citt_std      = std(lpm_wind_35_mW_int_10_citt);  
transmit_wind_35_mW_int_10_citt_std = std(transmit_wind_35_mW_int_10_citt);
listen_wind_35_mW_int_10_citt_std   = std(listen_wind_35_mW_int_10_citt);

%% Para interferencia de:  int_20_citt  wind_35

% remove outliers

listen_wind_35_int_20_citt = listen_wind_35_int_20_citt(~Isoutlier(listen_wind_35_int_20_citt));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_35_int_20_citt) length(lpm_wind_35_int_20_citt) length(transmit_wind_35_int_20_citt) length(listen_wind_35_int_20_citt) ] );

cpu_wind_35_int_20_citt      = cpu_wind_35_int_20_citt(1:minLength);
lpm_wind_35_int_20_citt      = lpm_wind_35_int_20_citt(1:minLength);
transmit_wind_35_int_20_citt = transmit_wind_35_int_20_citt(1:minLength);
listen_wind_35_int_20_citt   = listen_wind_35_int_20_citt(1:minLength);


% power en miliWatios mW

cpu_wind_35_mW_int_20_citt = cpu_wind_35_int_20_citt * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
lpm_wind_35_mW_int_20_citt = lpm_wind_35_int_20_citt * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
transmit_wind_35_mW_int_20_citt = transmit_wind_35_int_20_citt * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
listen_wind_35_mW_int_20_citt = listen_wind_35_int_20_citt * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;

% total power consumption in mW

remote_power_consumption_int_20_citt_wind_35 = cpu_wind_35_mW_int_20_citt + lpm_wind_35_mW_int_20_citt + transmit_wind_35_mW_int_20_citt + listen_wind_35_mW_int_20_citt;


% Promedio y desviacion estandar 
remote_power_consumption_int_20_citt_wind_35_mean = mean(remote_power_consumption_int_20_citt_wind_35);
remote_power_consumption_int_20_citt_wind_35_std  = std(remote_power_consumption_int_20_citt_wind_35);

% diferenciado 
cpu_wind_35_mW_int_20_citt_mean      = mean(cpu_wind_35_mW_int_20_citt); 
lpm_wind_35_mW_int_20_citt_mean      = mean(lpm_wind_35_mW_int_20_citt);  
transmit_wind_35_mW_int_20_citt_mean = mean(transmit_wind_35_mW_int_20_citt);
listen_wind_35_mW_int_20_citt_mean   = mean(listen_wind_35_mW_int_20_citt);

cpu_wind_35_mW_int_20_citt_std      = std(cpu_wind_35_mW_int_20_citt); 
lpm_wind_35_mW_int_20_citt_std      = std(lpm_wind_35_mW_int_20_citt);  
transmit_wind_35_mW_int_20_citt_std = std(transmit_wind_35_mW_int_20_citt);
listen_wind_35_mW_int_20_citt_std   = std(listen_wind_35_mW_int_20_citt);

%% Para interferencia de:  int_30_citt  wind_35

% remove outliers

listen_wind_35_int_30_citt = listen_wind_35_int_30_citt(~Isoutlier(listen_wind_35_int_30_citt));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_35_int_30_citt) length(lpm_wind_35_int_30_citt) length(transmit_wind_35_int_30_citt) length(listen_wind_35_int_30_citt) ] );

cpu_wind_35_int_30_citt      = cpu_wind_35_int_30_citt(1:minLength);
lpm_wind_35_int_30_citt      = lpm_wind_35_int_30_citt(1:minLength);
transmit_wind_35_int_30_citt = transmit_wind_35_int_30_citt(1:minLength);
listen_wind_35_int_30_citt   = listen_wind_35_int_30_citt(1:minLength);


% power en miliWatios mW

cpu_wind_35_mW_int_30_citt = cpu_wind_35_int_30_citt * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
lpm_wind_35_mW_int_30_citt = lpm_wind_35_int_30_citt * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
transmit_wind_35_mW_int_30_citt = transmit_wind_35_int_30_citt * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
listen_wind_35_mW_int_30_citt = listen_wind_35_int_30_citt * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;

% total power consumption in mW

remote_power_consumption_int_30_citt_wind_35 = cpu_wind_35_mW_int_30_citt + lpm_wind_35_mW_int_30_citt + transmit_wind_35_mW_int_30_citt + listen_wind_35_mW_int_30_citt;


% Promedio y desviacion estandar 
remote_power_consumption_int_30_citt_wind_35_mean = mean(remote_power_consumption_int_30_citt_wind_35);
remote_power_consumption_int_30_citt_wind_35_std  = std(remote_power_consumption_int_30_citt_wind_35);

% diferenciado 
cpu_wind_35_mW_int_30_citt_mean      = mean(cpu_wind_35_mW_int_30_citt); 
lpm_wind_35_mW_int_30_citt_mean      = mean(lpm_wind_35_mW_int_30_citt);  
transmit_wind_35_mW_int_30_citt_mean = mean(transmit_wind_35_mW_int_30_citt);
listen_wind_35_mW_int_30_citt_mean   = mean(listen_wind_35_mW_int_30_citt);

cpu_wind_35_mW_int_30_citt_std      = std(cpu_wind_35_mW_int_30_citt); 
lpm_wind_35_mW_int_30_citt_std      = std(lpm_wind_35_mW_int_30_citt);  
transmit_wind_35_mW_int_30_citt_std = std(transmit_wind_35_mW_int_30_citt);
listen_wind_35_mW_int_30_citt_std   = std(listen_wind_35_mW_int_30_citt);

%% Para interferencia de:  int_40_citt  wind_35

% remove outliers

listen_wind_35_int_40_citt = listen_wind_35_int_40_citt(~Isoutlier(listen_wind_35_int_40_citt));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_35_int_40_citt) length(lpm_wind_35_int_40_citt) length(transmit_wind_35_int_40_citt) length(listen_wind_35_int_40_citt) ] );

cpu_wind_35_int_40_citt      = cpu_wind_35_int_40_citt(1:minLength);
lpm_wind_35_int_40_citt      = lpm_wind_35_int_40_citt(1:minLength);
transmit_wind_35_int_40_citt = transmit_wind_35_int_40_citt(1:minLength);
listen_wind_35_int_40_citt   = listen_wind_35_int_40_citt(1:minLength);

% power en miliWatios mW

cpu_wind_35_mW_int_40_citt = cpu_wind_35_int_40_citt * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
lpm_wind_35_mW_int_40_citt = lpm_wind_35_int_40_citt * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
transmit_wind_35_mW_int_40_citt = transmit_wind_35_int_40_citt * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
listen_wind_35_mW_int_40_citt = listen_wind_35_int_40_citt * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;

% total power consumption in mW

remote_power_consumption_int_40_citt_wind_35 = cpu_wind_35_mW_int_40_citt + lpm_wind_35_mW_int_40_citt + transmit_wind_35_mW_int_40_citt + listen_wind_35_mW_int_40_citt;


% Promedio y desviacion estandar 
remote_power_consumption_int_40_citt_wind_35_mean = mean(remote_power_consumption_int_40_citt_wind_35);
remote_power_consumption_int_40_citt_wind_35_std  = std(remote_power_consumption_int_40_citt_wind_35);

% diferenciado 
cpu_wind_35_mW_int_40_citt_mean      = mean(cpu_wind_35_mW_int_40_citt); 
lpm_wind_35_mW_int_40_citt_mean      = mean(lpm_wind_35_mW_int_40_citt);  
transmit_wind_35_mW_int_40_citt_mean = mean(transmit_wind_35_mW_int_40_citt);
listen_wind_35_mW_int_40_citt_mean   = mean(listen_wind_35_mW_int_40_citt);

cpu_wind_35_mW_int_40_citt_std      = std(cpu_wind_35_mW_int_40_citt); 
lpm_wind_35_mW_int_40_citt_std      = std(lpm_wind_35_mW_int_40_citt);  
transmit_wind_35_mW_int_40_citt_std = std(transmit_wind_35_mW_int_40_citt);
listen_wind_35_mW_int_40_citt_std   = std(listen_wind_35_mW_int_40_citt);

%% Para interferencia de:  int_50_citt  wind_35

% remove outliers

listen_wind_35_int_50_citt = listen_wind_35_int_50_citt(~Isoutlier(listen_wind_35_int_50_citt));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_35_int_50_citt) length(lpm_wind_35_int_50_citt) length(transmit_wind_35_int_50_citt) length(listen_wind_35_int_50_citt) ] );

cpu_wind_35_int_50_citt      = cpu_wind_35_int_50_citt(1:minLength);
lpm_wind_35_int_50_citt      = lpm_wind_35_int_50_citt(1:minLength);
transmit_wind_35_int_50_citt = transmit_wind_35_int_50_citt(1:minLength);
listen_wind_35_int_50_citt   = listen_wind_35_int_50_citt(1:minLength);


% power en miliWatios mW

cpu_wind_35_mW_int_50_citt = cpu_wind_35_int_50_citt * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
lpm_wind_35_mW_int_50_citt = lpm_wind_35_int_50_citt * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
transmit_wind_35_mW_int_50_citt = transmit_wind_35_int_50_citt * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
listen_wind_35_mW_int_50_citt = listen_wind_35_int_50_citt * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;

% total power consumption in mW

remote_power_consumption_int_50_citt_wind_35 = cpu_wind_35_mW_int_50_citt + lpm_wind_35_mW_int_50_citt + transmit_wind_35_mW_int_50_citt + listen_wind_35_mW_int_50_citt;


% Promedio y desviacion estandar 
remote_power_consumption_int_50_citt_wind_35_mean = mean(remote_power_consumption_int_50_citt_wind_35);
remote_power_consumption_int_50_citt_wind_35_std  = std(remote_power_consumption_int_50_citt_wind_35);

% diferenciado 
cpu_wind_35_mW_int_50_citt_mean      = mean(cpu_wind_35_mW_int_50_citt); 
lpm_wind_35_mW_int_50_citt_mean      = mean(lpm_wind_35_mW_int_50_citt);  
transmit_wind_35_mW_int_50_citt_mean = mean(transmit_wind_35_mW_int_50_citt);
listen_wind_35_mW_int_50_citt_mean   = mean(listen_wind_35_mW_int_50_citt);

cpu_wind_35_mW_int_50_citt_std      = std(cpu_wind_35_mW_int_50_citt); 
lpm_wind_35_mW_int_50_citt_std      = std(lpm_wind_35_mW_int_50_citt);  
transmit_wind_35_mW_int_50_citt_std = std(transmit_wind_35_mW_int_50_citt);
listen_wind_35_mW_int_50_citt_std   = std(listen_wind_35_mW_int_50_citt);

%% Para interferencia de:  int_60_citt  wind_35

% remove outliers

listen_wind_35_int_60_citt = listen_wind_35_int_60_citt(~Isoutlier(listen_wind_35_int_60_citt));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_35_int_60_citt) length(lpm_wind_35_int_60_citt) length(transmit_wind_35_int_60_citt) length(listen_wind_35_int_60_citt) ] );

cpu_wind_35_int_60_citt      = cpu_wind_35_int_60_citt(1:minLength);
lpm_wind_35_int_60_citt      = lpm_wind_35_int_60_citt(1:minLength);
transmit_wind_35_int_60_citt = transmit_wind_35_int_60_citt(1:minLength);
listen_wind_35_int_60_citt   = listen_wind_35_int_60_citt(1:minLength);


% power en miliWatios mW

cpu_wind_35_mW_int_60_citt = cpu_wind_35_int_60_citt * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
lpm_wind_35_mW_int_60_citt = lpm_wind_35_int_60_citt * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
transmit_wind_35_mW_int_60_citt = transmit_wind_35_int_60_citt * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
listen_wind_35_mW_int_60_citt = listen_wind_35_int_60_citt * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;

% total power consumption in mW

remote_power_consumption_int_60_citt_wind_35 = cpu_wind_35_mW_int_60_citt + lpm_wind_35_mW_int_60_citt + transmit_wind_35_mW_int_60_citt + listen_wind_35_mW_int_60_citt;


% Promedio y desviacion estandar 
remote_power_consumption_int_60_citt_wind_35_mean = mean(remote_power_consumption_int_60_citt_wind_35);
remote_power_consumption_int_60_citt_wind_35_std  = std(remote_power_consumption_int_60_citt_wind_35);

% diferenciado 
cpu_wind_35_mW_int_60_citt_mean      = mean(cpu_wind_35_mW_int_60_citt); 
lpm_wind_35_mW_int_60_citt_mean      = mean(lpm_wind_35_mW_int_60_citt);  
transmit_wind_35_mW_int_60_citt_mean = mean(transmit_wind_35_mW_int_60_citt);
listen_wind_35_mW_int_60_citt_mean   = mean(listen_wind_35_mW_int_60_citt);

cpu_wind_35_mW_int_60_citt_std      = std(cpu_wind_35_mW_int_60_citt); 
lpm_wind_35_mW_int_60_citt_std      = std(lpm_wind_35_mW_int_60_citt);  
transmit_wind_35_mW_int_60_citt_std = std(transmit_wind_35_mW_int_60_citt);
listen_wind_35_mW_int_60_citt_std   = std(listen_wind_35_mW_int_60_citt);

%% Para interferencia de:  int_70_citt  wind_35

% remove outliers

listen_wind_35_int_70_citt = listen_wind_35_int_70_citt(~Isoutlier(listen_wind_35_int_70_citt));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_35_int_70_citt) length(lpm_wind_35_int_70_citt) length(transmit_wind_35_int_70_citt) length(listen_wind_35_int_70_citt) ] );

cpu_wind_35_int_70_citt      = cpu_wind_35_int_70_citt(1:minLength);
lpm_wind_35_int_70_citt      = lpm_wind_35_int_70_citt(1:minLength);
transmit_wind_35_int_70_citt = transmit_wind_35_int_70_citt(1:minLength);
listen_wind_35_int_70_citt   = listen_wind_35_int_70_citt(1:minLength);


% power en miliWatios mW

cpu_wind_35_mW_int_70_citt = cpu_wind_35_int_70_citt * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
lpm_wind_35_mW_int_70_citt = lpm_wind_35_int_70_citt * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
transmit_wind_35_mW_int_70_citt = transmit_wind_35_int_70_citt * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
listen_wind_35_mW_int_70_citt = listen_wind_35_int_70_citt * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;

% total power consumption in mW

remote_power_consumption_int_70_citt_wind_35 = cpu_wind_35_mW_int_70_citt + lpm_wind_35_mW_int_70_citt + transmit_wind_35_mW_int_70_citt + listen_wind_35_mW_int_70_citt;


% Promedio y desviacion estandar 
remote_power_consumption_int_70_citt_wind_35_mean = mean(remote_power_consumption_int_70_citt_wind_35);
remote_power_consumption_int_70_citt_wind_35_std  = std(remote_power_consumption_int_70_citt_wind_35);

% diferenciado 
cpu_wind_35_mW_int_70_citt_mean      = mean(cpu_wind_35_mW_int_70_citt); 
lpm_wind_35_mW_int_70_citt_mean      = mean(lpm_wind_35_mW_int_70_citt);  
transmit_wind_35_mW_int_70_citt_mean = mean(transmit_wind_35_mW_int_70_citt);
listen_wind_35_mW_int_70_citt_mean   = mean(listen_wind_35_mW_int_70_citt);

cpu_wind_35_mW_int_70_citt_std      = std(cpu_wind_35_mW_int_70_citt); 
lpm_wind_35_mW_int_70_citt_std      = std(lpm_wind_35_mW_int_70_citt);  
transmit_wind_35_mW_int_70_citt_std = std(transmit_wind_35_mW_int_70_citt);
listen_wind_35_mW_int_70_citt_std   = std(listen_wind_35_mW_int_70_citt);

%% Para interferencia de:  int_80_citt  wind_35

% remove outliers

listen_wind_35_int_80_citt = listen_wind_35_int_80_citt(~Isoutlier(listen_wind_35_int_80_citt));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_35_int_80_citt) length(lpm_wind_35_int_80_citt) length(transmit_wind_35_int_80_citt) length(listen_wind_35_int_80_citt) ] );

cpu_wind_35_int_80_citt      = cpu_wind_35_int_80_citt(1:minLength);
lpm_wind_35_int_80_citt      = lpm_wind_35_int_80_citt(1:minLength);
transmit_wind_35_int_80_citt = transmit_wind_35_int_80_citt(1:minLength);
listen_wind_35_int_80_citt   = listen_wind_35_int_80_citt(1:minLength);

% power en miliWatios mW

cpu_wind_35_mW_int_80_citt = cpu_wind_35_int_80_citt * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
lpm_wind_35_mW_int_80_citt = lpm_wind_35_int_80_citt * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
transmit_wind_35_mW_int_80_citt = transmit_wind_35_int_80_citt * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
listen_wind_35_mW_int_80_citt = listen_wind_35_int_80_citt * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;

% total power consumption in mW

remote_power_consumption_int_80_citt_wind_35 = cpu_wind_35_mW_int_80_citt + lpm_wind_35_mW_int_80_citt + transmit_wind_35_mW_int_80_citt + listen_wind_35_mW_int_80_citt;


% Promedio y desviacion estandar 
remote_power_consumption_int_80_citt_wind_35_mean = mean(remote_power_consumption_int_80_citt_wind_35);
remote_power_consumption_int_80_citt_wind_35_std  = std(remote_power_consumption_int_80_citt_wind_35);

% diferenciado 
cpu_wind_35_mW_int_80_citt_mean      = mean(cpu_wind_35_mW_int_80_citt); 
lpm_wind_35_mW_int_80_citt_mean      = mean(lpm_wind_35_mW_int_80_citt);  
transmit_wind_35_mW_int_80_citt_mean = mean(transmit_wind_35_mW_int_80_citt);
listen_wind_35_mW_int_80_citt_mean   = mean(listen_wind_35_mW_int_80_citt);

cpu_wind_35_mW_int_80_citt_std      = std(cpu_wind_35_mW_int_80_citt); 
lpm_wind_35_mW_int_80_citt_std      = std(lpm_wind_35_mW_int_80_citt);  
transmit_wind_35_mW_int_80_citt_std = std(transmit_wind_35_mW_int_80_citt);
listen_wind_35_mW_int_80_citt_std   = std(listen_wind_35_mW_int_80_citt);

%% Para interferencia de:  int_90_citt  wind_35

% remove outliers

listen_wind_35_int_90_citt = listen_wind_35_int_90_citt(~Isoutlier(listen_wind_35_int_90_citt));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_35_int_90_citt) length(lpm_wind_35_int_90_citt) length(transmit_wind_35_int_90_citt) length(listen_wind_35_int_90_citt) ] );

cpu_wind_35_int_90_citt      = cpu_wind_35_int_90_citt(1:minLength);
lpm_wind_35_int_90_citt      = lpm_wind_35_int_90_citt(1:minLength);
transmit_wind_35_int_90_citt = transmit_wind_35_int_90_citt(1:minLength);
listen_wind_35_int_90_citt   = listen_wind_35_int_90_citt(1:minLength);

% power en miliWatios mW

cpu_wind_35_mW_int_90_citt = cpu_wind_35_int_90_citt * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
lpm_wind_35_mW_int_90_citt = lpm_wind_35_int_90_citt * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
transmit_wind_35_mW_int_90_citt = transmit_wind_35_int_90_citt * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
listen_wind_35_mW_int_90_citt = listen_wind_35_int_90_citt * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;

% total power consumption in mW

remote_power_consumption_int_90_citt_wind_35 = cpu_wind_35_mW_int_90_citt + lpm_wind_35_mW_int_90_citt + transmit_wind_35_mW_int_90_citt + listen_wind_35_mW_int_90_citt;


% Promedio y desviacion estandar 
remote_power_consumption_int_90_citt_wind_35_mean = mean(remote_power_consumption_int_90_citt_wind_35);
remote_power_consumption_int_90_citt_wind_35_std  = std(remote_power_consumption_int_90_citt_wind_35);

% diferenciado 
cpu_wind_35_mW_int_90_citt_mean      = mean(cpu_wind_35_mW_int_90_citt); 
lpm_wind_35_mW_int_90_citt_mean      = mean(lpm_wind_35_mW_int_90_citt);  
transmit_wind_35_mW_int_90_citt_mean = mean(transmit_wind_35_mW_int_90_citt);
listen_wind_35_mW_int_90_citt_mean   = mean(listen_wind_35_mW_int_90_citt);

cpu_wind_35_mW_int_90_citt_std      = std(cpu_wind_35_mW_int_90_citt); 
lpm_wind_35_mW_int_90_citt_std      = std(lpm_wind_35_mW_int_90_citt);  
transmit_wind_35_mW_int_90_citt_std = std(transmit_wind_35_mW_int_90_citt);
listen_wind_35_mW_int_90_citt_std   = std(listen_wind_35_mW_int_90_citt);

%% Para interferencia de:  int_100_citt  wind_35

% remove outliers

listen_wind_35_int_100_citt = listen_wind_35_int_100_citt(~Isoutlier(listen_wind_35_int_100_citt));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_35_int_100_citt) length(lpm_wind_35_int_100_citt) length(transmit_wind_35_int_100_citt) length(listen_wind_35_int_100_citt) ] );

cpu_wind_35_int_100_citt      = cpu_wind_35_int_100_citt(1:minLength);
lpm_wind_35_int_100_citt      = lpm_wind_35_int_100_citt(1:minLength);
transmit_wind_35_int_100_citt = transmit_wind_35_int_100_citt(1:minLength);
listen_wind_35_int_100_citt   = listen_wind_35_int_100_citt(1:minLength);


% power en miliWatios mW

cpu_wind_35_mW_int_100_citt = cpu_wind_35_int_100_citt * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
lpm_wind_35_mW_int_100_citt = lpm_wind_35_int_100_citt * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
transmit_wind_35_mW_int_100_citt = transmit_wind_35_int_100_citt * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_basictree;
listen_wind_35_mW_int_100_citt = listen_wind_35_int_100_citt * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_basictree;

% total power consumption in mW

remote_power_consumption_int_100_citt_wind_35 = cpu_wind_35_mW_int_100_citt + lpm_wind_35_mW_int_100_citt + transmit_wind_35_mW_int_100_citt + listen_wind_35_mW_int_100_citt;


% Promedio y desviacion estandar 
remote_power_consumption_int_100_citt_wind_35_mean = mean(remote_power_consumption_int_100_citt_wind_35);
remote_power_consumption_int_100_citt_wind_35_std  = std(remote_power_consumption_int_100_citt_wind_35);

% diferenciado 
cpu_wind_35_mW_int_100_citt_mean      = mean(cpu_wind_35_mW_int_100_citt); 
lpm_wind_35_mW_int_100_citt_mean      = mean(lpm_wind_35_mW_int_100_citt);  
transmit_wind_35_mW_int_100_citt_mean = mean(transmit_wind_35_mW_int_100_citt);
listen_wind_35_mW_int_100_citt_mean   = mean(listen_wind_35_mW_int_100_citt);

cpu_wind_35_mW_int_100_citt_std      = std(cpu_wind_35_mW_int_100_citt); 
lpm_wind_35_mW_int_100_citt_std      = std(lpm_wind_35_mW_int_100_citt);  
transmit_wind_35_mW_int_100_citt_std = std(transmit_wind_35_mW_int_100_citt);
listen_wind_35_mW_int_100_citt_std   = std(listen_wind_35_mW_int_100_citt);


