%vec de means: consumo total 
consolidado_power_wind_X_mean_int_70 = [remote_power_consumption_int_70_wind_5_mean
                                       remote_power_consumption_int_70_wind_10_mean
                                       remote_power_consumption_int_70_wind_15_mean
                                       remote_power_consumption_int_70_wind_20_mean
                                       remote_power_consumption_int_70_wind_25_mean
                                       remote_power_consumption_int_70_wind_30_mean
                                       remote_power_consumption_int_70_wind_35_mean
                                       ];

%vec de desviacion estandar: consumo total                              
consolidado_power_wind_X_std_int_70  = [remote_power_consumption_int_70_wind_5_std
                                       remote_power_consumption_int_70_wind_10_std
                                       remote_power_consumption_int_70_wind_15_std
                                       remote_power_consumption_int_70_wind_20_std
                                       remote_power_consumption_int_70_wind_25_std
                                       remote_power_consumption_int_70_wind_30_std
                                       remote_power_consumption_int_70_wind_35_std
                                       ];                            

%% diferenciado cpu, lpm, listen, transmit                             

% consumo de la CPU
consolidado_cpu_wind_X_int_70_mean  = [ cpu_wind_5_mW_int_70_mean
                                           cpu_wind_10_mW_int_70_mean
                                           cpu_wind_15_mW_int_70_mean
                                           cpu_wind_20_mW_int_70_mean
                                           cpu_wind_25_mW_int_70_mean
                                           cpu_wind_30_mW_int_70_mean
                                           cpu_wind_35_mW_int_70_mean                                        
                                         ];
                                     
consolidado_cpu_wind_X_int_70_std  = [ cpu_wind_5_mW_int_70_std
                                           cpu_wind_10_mW_int_70_std
                                           cpu_wind_15_mW_int_70_std
                                           cpu_wind_20_mW_int_70_std
                                           cpu_wind_25_mW_int_70_std
                                           cpu_wind_30_mW_int_70_std
                                           cpu_wind_35_mW_int_70_std                                        
                                         ];       

% consumo de LPM                                     
consolidado_lpm_wind_X_int_70_mean  = [ lpm_wind_5_mW_int_70_mean
                                           lpm_wind_10_mW_int_70_mean
                                           lpm_wind_15_mW_int_70_mean
                                           lpm_wind_20_mW_int_70_mean
                                           lpm_wind_25_mW_int_70_mean
                                           lpm_wind_30_mW_int_70_mean
                                           lpm_wind_35_mW_int_70_mean                                        
                                         ];
                                     
consolidado_lpm_wind_X_int_70_std  = [ lpm_wind_5_mW_int_70_std
                                           lpm_wind_10_mW_int_70_std
                                           lpm_wind_15_mW_int_70_std
                                           lpm_wind_20_mW_int_70_std
                                           lpm_wind_25_mW_int_70_std
                                           lpm_wind_30_mW_int_70_std
                                           lpm_wind_35_mW_int_70_std                                        
                                         ];   

% Consumo de TX                                     
consolidado_transmit_wind_X_int_70_mean  = [ transmit_wind_5_mW_int_70_mean
                                           transmit_wind_10_mW_int_70_mean
                                           transmit_wind_15_mW_int_70_mean
                                           transmit_wind_20_mW_int_70_mean
                                           transmit_wind_25_mW_int_70_mean
                                           transmit_wind_30_mW_int_70_mean
                                           transmit_wind_35_mW_int_70_mean                                        
                                         ];
                                     
consolidado_transmit_wind_X_int_70_std  = [ transmit_wind_5_mW_int_70_std
                                           transmit_wind_10_mW_int_70_std
                                           transmit_wind_15_mW_int_70_std
                                           transmit_wind_20_mW_int_70_std
                                           transmit_wind_25_mW_int_70_std
                                           transmit_wind_30_mW_int_70_std
                                           transmit_wind_35_mW_int_70_std                                        
                                         ];     
% Consumo de RX                                      
consolidado_listen_wind_X_int_70_mean  = [ listen_wind_5_mW_int_70_mean
                                           listen_wind_10_mW_int_70_mean
                                           listen_wind_15_mW_int_70_mean
                                           listen_wind_20_mW_int_70_mean
                                           listen_wind_25_mW_int_70_mean
                                           listen_wind_30_mW_int_70_mean
                                           listen_wind_35_mW_int_70_mean                                        
                                         ];
                                     
consolidado_listen_wind_X_int_70_std  = [ listen_wind_5_mW_int_70_std
                                           listen_wind_10_mW_int_70_std
                                           listen_wind_15_mW_int_70_std
                                           listen_wind_20_mW_int_70_std
                                           listen_wind_25_mW_int_70_std
                                           listen_wind_30_mW_int_70_std
                                           listen_wind_35_mW_int_70_std                                        
                                         ];        
                                     
%% organizo los datos para hacer el plot con la funcion bar
consolidado_bar_x_wind_X_int_70_mean = ...
[ cpu_wind_5_mW_int_70_mean  lpm_wind_5_mW_int_70_mean  transmit_wind_5_mW_int_70_mean  listen_wind_5_mW_int_70_mean;
  cpu_wind_10_mW_int_70_mean lpm_wind_10_mW_int_70_mean transmit_wind_10_mW_int_70_mean listen_wind_10_mW_int_70_mean;
  cpu_wind_15_mW_int_70_mean lpm_wind_15_mW_int_70_mean transmit_wind_15_mW_int_70_mean listen_wind_15_mW_int_70_mean;
  cpu_wind_20_mW_int_70_mean lpm_wind_20_mW_int_70_mean transmit_wind_20_mW_int_70_mean listen_wind_20_mW_int_70_mean;
  cpu_wind_25_mW_int_70_mean lpm_wind_25_mW_int_70_mean transmit_wind_25_mW_int_70_mean listen_wind_25_mW_int_70_mean;
  cpu_wind_30_mW_int_70_mean lpm_wind_30_mW_int_70_mean transmit_wind_30_mW_int_70_mean listen_wind_30_mW_int_70_mean;
  cpu_wind_35_mW_int_70_mean lpm_wind_35_mW_int_70_mean transmit_wind_35_mW_int_70_mean listen_wind_35_mW_int_70_mean];

% Este vector es para plotear. Por eso multiplico el lpm por un factor de
% factor_ploteo
consolidado_bar_x_wind_X_int_70_mean_mod = ...
[ cpu_wind_5_mW_int_70_mean  lpm_wind_5_mW_int_70_mean*factor_ploteo  transmit_wind_5_mW_int_70_mean  listen_wind_5_mW_int_70_mean;
  cpu_wind_10_mW_int_70_mean lpm_wind_10_mW_int_70_mean*factor_ploteo transmit_wind_10_mW_int_70_mean listen_wind_10_mW_int_70_mean;
  cpu_wind_15_mW_int_70_mean lpm_wind_15_mW_int_70_mean*factor_ploteo transmit_wind_15_mW_int_70_mean listen_wind_15_mW_int_70_mean;
  cpu_wind_20_mW_int_70_mean lpm_wind_20_mW_int_70_mean*factor_ploteo transmit_wind_20_mW_int_70_mean listen_wind_20_mW_int_70_mean;
  cpu_wind_25_mW_int_70_mean lpm_wind_25_mW_int_70_mean*factor_ploteo transmit_wind_25_mW_int_70_mean listen_wind_25_mW_int_70_mean;
  cpu_wind_30_mW_int_70_mean lpm_wind_30_mW_int_70_mean*factor_ploteo transmit_wind_30_mW_int_70_mean listen_wind_30_mW_int_70_mean;
  cpu_wind_35_mW_int_70_mean lpm_wind_35_mW_int_70_mean*factor_ploteo transmit_wind_35_mW_int_70_mean listen_wind_35_mW_int_70_mean];

