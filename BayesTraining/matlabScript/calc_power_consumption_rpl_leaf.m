
%% power en miliWatios mW

cpu_rpl_lead_mW = cpu_rpl_leaf * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
lpm_rpl_lead_mW = lpm_rpl_leaf * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
transmit_rpl_lead_mW = transmit_rpl_leaf * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
listen_rpl_lead_mW = listen_rpl_leaf * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;

%% total power consumption in mWcpu_wind_15_mW_int_0_mean

remote_power_consumption_rpl_lead = cpu_rpl_lead_mW + lpm_rpl_lead_mW + transmit_rpl_lead_mW + listen_rpl_lead_mW;


%% Promedio y desviacion estandar 
remote_power_consumption_rpl_lead_mean = mean(remote_power_consumption_rpl_lead);
remote_power_consumption_rpl_lead_std  = std(remote_power_consumption_rpl_lead);

% diferenciado 
cpu_rpl_lead_mW_mean      = mean(cpu_rpl_lead_mW); 
lpm_rpl_lead_mW_mean      = mean(lpm_rpl_lead_mW);  
transmit_rpl_lead_mW_mean = mean(transmit_rpl_lead_mW);
listen_rpl_lead_mW_mean   = mean(listen_rpl_lead_mW);

cpu_rpl_lead_mW_std      = std(cpu_rpl_lead_mW); 
lpm_rpl_lead_mW_std      = std(lpm_rpl_lead_mW);  
transmit_rpl_lead_mW_std = std(transmit_rpl_lead_mW);
listen_rpl_lead_mW_std   = std(listen_rpl_lead_mW);

