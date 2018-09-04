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
consolidado_cpu_wind_X_int_0_mean  = [ cpu_wind_5_mW_int_0_mean
                                           cpu_wind_10_mW_int_0_mean
                                           cpu_wind_15_mW_int_0_mean
                                           cpu_wind_20_mW_int_0_mean
                                           cpu_wind_25_mW_int_0_mean
                                           cpu_wind_30_mW_int_0_mean
                                           cpu_wind_35_mW_int_0_mean                                        
                                         ];
                                     
consolidado_cpu_wind_X_int_0_std  = [ cpu_wind_5_mW_int_0_std
                                           cpu_wind_10_mW_int_0_std
                                           cpu_wind_15_mW_int_0_std
                                           cpu_wind_20_mW_int_0_std
                                           cpu_wind_25_mW_int_0_std
                                           cpu_wind_30_mW_int_0_std
                                           cpu_wind_35_mW_int_0_std                                        
                                         ];       

cpu_wind_X_int_0_mean =  mean(consolidado_cpu_wind_X_int_0_mean);                             
cpu_wind_X_int_0_std  =  std(consolidado_cpu_wind_X_int_0_mean);                             

% consumo de LPM                                     
consolidado_lpm_wind_X_int_0_mean  = [ lpm_wind_5_mW_int_0_mean
                                           lpm_wind_10_mW_int_0_mean
                                           lpm_wind_15_mW_int_0_mean
                                           lpm_wind_20_mW_int_0_mean
                                           lpm_wind_25_mW_int_0_mean
                                           lpm_wind_30_mW_int_0_mean
                                           lpm_wind_35_mW_int_0_mean                                        
                                         ];
                                     
consolidado_lpm_wind_X_int_0_std  = [ lpm_wind_5_mW_int_0_std
                                           lpm_wind_10_mW_int_0_std
                                           lpm_wind_15_mW_int_0_std
                                           lpm_wind_20_mW_int_0_std
                                           lpm_wind_25_mW_int_0_std
                                           lpm_wind_30_mW_int_0_std
                                           lpm_wind_35_mW_int_0_std                                        
                                         ]; 
                                     
lpm_wind_X_int_0_mean =  mean(consolidado_lpm_wind_X_int_0_mean);                             
lpm_wind_X_int_0_std  =  std(consolidado_lpm_wind_X_int_0_mean);                             

% Consumo de TX                                     
consolidado_transmit_wind_X_int_0_mean  = [ transmit_wind_5_mW_int_0_mean
                                           transmit_wind_10_mW_int_0_mean
                                           transmit_wind_15_mW_int_0_mean
                                           transmit_wind_20_mW_int_0_mean
                                           transmit_wind_25_mW_int_0_mean
                                           transmit_wind_30_mW_int_0_mean
                                           transmit_wind_35_mW_int_0_mean                                        
                                         ];
                                     
consolidado_transmit_wind_X_int_0_std  = [ transmit_wind_5_mW_int_0_std
                                           transmit_wind_10_mW_int_0_std
                                           transmit_wind_15_mW_int_0_std
                                           transmit_wind_20_mW_int_0_std
                                           transmit_wind_25_mW_int_0_std
                                           transmit_wind_30_mW_int_0_std
                                           transmit_wind_35_mW_int_0_std                                        
                                         ];   
                                     
transmit_wind_X_int_0_mean =  mean(consolidado_transmit_wind_X_int_0_mean);                             
transmit_wind_X_int_0_std  =  std(consolidado_transmit_wind_X_int_0_mean);                             
                                     
% Consumo de RX                                      
consolidado_listen_wind_X_int_0_mean  = [ listen_wind_5_mW_int_0_mean
                                           listen_wind_10_mW_int_0_mean
                                           listen_wind_15_mW_int_0_mean
                                           listen_wind_20_mW_int_0_mean
                                           listen_wind_25_mW_int_0_mean
                                           listen_wind_30_mW_int_0_mean
                                           listen_wind_35_mW_int_0_mean                                        
                                         ];
                                     
consolidado_listen_wind_X_int_0_std  = [ listen_wind_5_mW_int_0_std
                                           listen_wind_10_mW_int_0_std
                                           listen_wind_15_mW_int_0_std
                                           listen_wind_20_mW_int_0_std
                                           listen_wind_25_mW_int_0_std
                                           listen_wind_30_mW_int_0_std
                                           listen_wind_35_mW_int_0_std                                        
                                         ];                    


listen_wind_X_int_0_mean =  mean(consolidado_listen_wind_X_int_0_mean);                             
listen_wind_X_int_0_std  =  std(consolidado_listen_wind_X_int_0_mean);                             

%% organizo los datos para hacer el plot con la funcion bar
consolidado_bar_x_wind_X_int_0_mean = ...
[ cpu_wind_5_mW_int_0_mean  lpm_wind_5_mW_int_0_mean  transmit_wind_5_mW_int_0_mean  listen_wind_5_mW_int_0_mean;
  cpu_wind_10_mW_int_0_mean lpm_wind_10_mW_int_0_mean transmit_wind_10_mW_int_0_mean listen_wind_10_mW_int_0_mean;
  cpu_wind_15_mW_int_0_mean lpm_wind_15_mW_int_0_mean transmit_wind_15_mW_int_0_mean listen_wind_15_mW_int_0_mean;
  cpu_wind_20_mW_int_0_mean lpm_wind_20_mW_int_0_mean transmit_wind_20_mW_int_0_mean listen_wind_20_mW_int_0_mean;
  cpu_wind_25_mW_int_0_mean lpm_wind_25_mW_int_0_mean transmit_wind_25_mW_int_0_mean listen_wind_25_mW_int_0_mean;
  cpu_wind_30_mW_int_0_mean lpm_wind_30_mW_int_0_mean transmit_wind_30_mW_int_0_mean listen_wind_30_mW_int_0_mean;
  cpu_wind_35_mW_int_0_mean lpm_wind_35_mW_int_0_mean transmit_wind_35_mW_int_0_mean listen_wind_35_mW_int_0_mean];

% Este vector es para plotear. Por eso multiplico el lpm por un factor de
% factor_ploteo
consolidado_bar_x_wind_X_int_0_mean_mod = ...
[ cpu_wind_5_mW_int_0_mean  lpm_wind_5_mW_int_0_mean*factor_ploteo  transmit_wind_5_mW_int_0_mean  listen_wind_5_mW_int_0_mean;
  cpu_wind_10_mW_int_0_mean lpm_wind_10_mW_int_0_mean*factor_ploteo transmit_wind_10_mW_int_0_mean listen_wind_10_mW_int_0_mean;
  cpu_wind_15_mW_int_0_mean lpm_wind_15_mW_int_0_mean*factor_ploteo transmit_wind_15_mW_int_0_mean listen_wind_15_mW_int_0_mean;
  cpu_wind_20_mW_int_0_mean lpm_wind_20_mW_int_0_mean*factor_ploteo transmit_wind_20_mW_int_0_mean listen_wind_20_mW_int_0_mean;
  cpu_wind_25_mW_int_0_mean lpm_wind_25_mW_int_0_mean*factor_ploteo transmit_wind_25_mW_int_0_mean listen_wind_25_mW_int_0_mean;
  cpu_wind_30_mW_int_0_mean lpm_wind_30_mW_int_0_mean*factor_ploteo transmit_wind_30_mW_int_0_mean listen_wind_30_mW_int_0_mean;
  cpu_wind_35_mW_int_0_mean lpm_wind_35_mW_int_0_mean*factor_ploteo transmit_wind_35_mW_int_0_mean listen_wind_35_mW_int_0_mean];

