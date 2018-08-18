%vec de means: consumo total 
consolidado_power_wind_X_mean_int_0 = [remote_power_consumption_int_0_wind_5_mean
                                       remote_power_consumption_int_0_wind_10_mean
                                       remote_power_consumption_int_0_wind_15_mean
                                       remote_power_consumption_int_0_wind_20_mean
                                       remote_power_consumption_int_0_wind_25_mean
                                       remote_power_consumption_int_0_wind_30_mean
                                       remote_power_consumption_int_0_wind_35_mean
                                       ];

%vec de desviacion estandar: consumo total                              
consolidado_power_wind_X_std_int_0  = [remote_power_consumption_int_0_wind_5_std
                                       remote_power_consumption_int_0_wind_10_std
                                       remote_power_consumption_int_0_wind_15_std
                                       remote_power_consumption_int_0_wind_20_std
                                       remote_power_consumption_int_0_wind_25_std
                                       remote_power_consumption_int_0_wind_30_std
                                       remote_power_consumption_int_0_wind_35_std
                                       ];                            

%% diferenciado cpu, lpm, listen, transmit                             

% consumo de la CPU
consolidado_all_cpu_wind_X_int_0_mean  = [ all_cpu_wind_5_diff_mW_int_0_mean
                                           all_cpu_wind_10_diff_mW_int_0_mean
                                           all_cpu_wind_15_diff_mW_int_0_mean
                                           all_cpu_wind_20_diff_mW_int_0_mean
                                           all_cpu_wind_25_diff_mW_int_0_mean
                                           all_cpu_wind_30_diff_mW_int_0_mean
                                           all_cpu_wind_35_diff_mW_int_0_mean                                        
                                         ];
                                     
consolidado_all_cpu_wind_X_int_0_std  = [ all_cpu_wind_5_diff_mW_int_0_std
                                           all_cpu_wind_10_diff_mW_int_0_std
                                           all_cpu_wind_15_diff_mW_int_0_std
                                           all_cpu_wind_20_diff_mW_int_0_std
                                           all_cpu_wind_25_diff_mW_int_0_std
                                           all_cpu_wind_30_diff_mW_int_0_std
                                           all_cpu_wind_35_diff_mW_int_0_std                                        
                                         ];       

% consumo de LPM                                     
consolidado_all_lpm_wind_X_int_0_mean  = [ all_lpm_wind_5_diff_mW_int_0_mean
                                           all_lpm_wind_10_diff_mW_int_0_mean
                                           all_lpm_wind_15_diff_mW_int_0_mean
                                           all_lpm_wind_20_diff_mW_int_0_mean
                                           all_lpm_wind_25_diff_mW_int_0_mean
                                           all_lpm_wind_30_diff_mW_int_0_mean
                                           all_lpm_wind_35_diff_mW_int_0_mean                                        
                                         ];
                                     
consolidado_all_lpm_wind_X_int_0_std  = [ all_lpm_wind_5_diff_mW_int_0_std
                                           all_lpm_wind_10_diff_mW_int_0_std
                                           all_lpm_wind_15_diff_mW_int_0_std
                                           all_lpm_wind_20_diff_mW_int_0_std
                                           all_lpm_wind_25_diff_mW_int_0_std
                                           all_lpm_wind_30_diff_mW_int_0_std
                                           all_lpm_wind_35_diff_mW_int_0_std                                        
                                         ];   

% Consumo de TX                                     
consolidado_all_transmit_wind_X_int_0_mean  = [ all_transmit_wind_5_diff_mW_int_0_mean
                                           all_transmit_wind_10_diff_mW_int_0_mean
                                           all_transmit_wind_15_diff_mW_int_0_mean
                                           all_transmit_wind_20_diff_mW_int_0_mean
                                           all_transmit_wind_25_diff_mW_int_0_mean
                                           all_transmit_wind_30_diff_mW_int_0_mean
                                           all_transmit_wind_35_diff_mW_int_0_mean                                        
                                         ];
                                     
consolidado_all_transmit_wind_X_int_0_std  = [ all_transmit_wind_5_diff_mW_int_0_std
                                           all_transmit_wind_10_diff_mW_int_0_std
                                           all_transmit_wind_15_diff_mW_int_0_std
                                           all_transmit_wind_20_diff_mW_int_0_std
                                           all_transmit_wind_25_diff_mW_int_0_std
                                           all_transmit_wind_30_diff_mW_int_0_std
                                           all_transmit_wind_35_diff_mW_int_0_std                                        
                                         ];     
% Consumo de RX                                      
consolidado_all_listen_wind_X_int_0_mean  = [ all_listen_wind_5_diff_mW_int_0_mean
                                           all_listen_wind_10_diff_mW_int_0_mean
                                           all_listen_wind_15_diff_mW_int_0_mean
                                           all_listen_wind_20_diff_mW_int_0_mean
                                           all_listen_wind_25_diff_mW_int_0_mean
                                           all_listen_wind_30_diff_mW_int_0_mean
                                           all_listen_wind_35_diff_mW_int_0_mean                                        
                                         ];
                                     
consolidado_all_listen_wind_X_int_0_std  = [ all_listen_wind_5_diff_mW_int_0_std
                                           all_listen_wind_10_diff_mW_int_0_std
                                           all_listen_wind_15_diff_mW_int_0_std
                                           all_listen_wind_20_diff_mW_int_0_std
                                           all_listen_wind_25_diff_mW_int_0_std
                                           all_listen_wind_30_diff_mW_int_0_std
                                           all_listen_wind_35_diff_mW_int_0_std                                        
                                         ];                    
                                     
%% organizo los datos para hacer el plot con la funcion bar
consolidado_bar_all_x_wind_X_int_0_mean = ...
[ all_cpu_wind_5_diff_mW_int_0_mean  all_lpm_wind_5_diff_mW_int_0_mean  all_transmit_wind_5_diff_mW_int_0_mean  all_listen_wind_5_diff_mW_int_0_mean;
  all_cpu_wind_10_diff_mW_int_0_mean all_lpm_wind_10_diff_mW_int_0_mean all_transmit_wind_10_diff_mW_int_0_mean all_listen_wind_10_diff_mW_int_0_mean;
  all_cpu_wind_15_diff_mW_int_0_mean all_lpm_wind_15_diff_mW_int_0_mean all_transmit_wind_15_diff_mW_int_0_mean all_listen_wind_15_diff_mW_int_0_mean;
  all_cpu_wind_20_diff_mW_int_0_mean all_lpm_wind_20_diff_mW_int_0_mean all_transmit_wind_20_diff_mW_int_0_mean all_listen_wind_20_diff_mW_int_0_mean;
  all_cpu_wind_25_diff_mW_int_0_mean all_lpm_wind_25_diff_mW_int_0_mean all_transmit_wind_25_diff_mW_int_0_mean all_listen_wind_25_diff_mW_int_0_mean;
  all_cpu_wind_30_diff_mW_int_0_mean all_lpm_wind_30_diff_mW_int_0_mean all_transmit_wind_30_diff_mW_int_0_mean all_listen_wind_30_diff_mW_int_0_mean;
  all_cpu_wind_35_diff_mW_int_0_mean all_lpm_wind_35_diff_mW_int_0_mean all_transmit_wind_35_diff_mW_int_0_mean all_listen_wind_35_diff_mW_int_0_mean];
                                     