
%% diff: calcula la diferencia entre el siguiente elemento y el actual

all_cpu_wind_5_diff_id_1      = diff(all_cpu_wind_5_id_1); 
all_lpm_wind_5_diff_id_1      = diff(all_lpm_wind_5_id_1); 
all_transmit_wind_5_diff_id_1 = diff(all_transmit_wind_5_id_1); 
all_listen_wind_5_diff_id_1   = diff(all_listen_wind_5_id_1); 


%% power en miliWatios mW

all_cpu_wind_5_diff_mW_id_1 = all_cpu_wind_5_diff_id_1 * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period;
all_lpm_wind_5_diff_mW_id_1 = all_lpm_wind_5_diff_id_1 * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period;
all_transmit_wind_5_diff_mW_id_1 = all_transmit_wind_5_diff_id_1 * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period;
all_listen_wind_5_diff_mW_id_1 = all_listen_wind_5_diff_id_1 * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period;

%% total power consumption in mW

remote_power_consumption_id_1 = all_cpu_wind_5_diff_mW_id_1 + all_lpm_wind_5_diff_mW_id_1 + all_transmit_wind_5_diff_mW_id_1 + all_listen_wind_5_diff_mW_id_1;


%% Promedio y desviacion estandar 
remote_power_consumption_id_1_mean = mean(remote_power_consumption_id_1);
remote_power_consumption_id_1_std  = std(remote_power_consumption_id_1);


%% Consolidado power consumption para muchos nodos

consolidado_remote_power_consumption_mean = [ remote_power_consumption_id_1_mean
                                              remote_power_consumption_id_1_mean
                                            ]; 
                                        
consolidado_remote_power_consumption_std  = [ remote_power_consumption_id_1_std
                                              remote_power_consumption_id_1_std
                                            ];                                        

                                        
