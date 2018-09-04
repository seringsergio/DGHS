



power_rpl_citt_leaf_mean = [cpu_wind_X_int_0_mean  lpm_wind_X_int_0_mean  transmit_wind_X_int_0_mean  listen_wind_X_int_0_mean;
                            cpu_rpl_leaf_mW_mean       lpm_rpl_leaf_mW_mean       transmit_rpl_leaf_mW_mean       listen_rpl_leaf_mW_mean   
                           ];

% Este vector es para plotear. Por eso multiplico el lpm por un factor de
% factor_ploteo
power_rpl_citt_leaf_mean_plot = [cpu_wind_X_int_0_mean               lpm_wind_X_int_0_mean*factor_ploteo  transmit_wind_X_int_0_mean  listen_wind_X_int_0_mean;
                                 cpu_rpl_leaf_mW_mean*factor_ploteo_cpu  lpm_rpl_leaf_mW_mean*factor_ploteo       transmit_rpl_leaf_mW_mean       listen_rpl_leaf_mW_mean   
                                ];
                   
consolidado_rpl_citt_leaf_mean = [ cpu_wind_X_int_0_mean+lpm_wind_X_int_0_mean+transmit_wind_X_int_0_mean+listen_wind_X_int_0_mean
                                  remote_power_consumption_rpl_leaf_mean + cpu_rpl_leaf_mW_mean*factor_ploteo_cpu + lpm_rpl_leaf_mW_mean*factor_ploteo  % las sumas son para colocar las lineas de desviacion standard en la posicion correcta                        
                                 ];

consolidado_rpl_citt_leaf_std = [cpu_wind_X_int_0_std+lpm_wind_X_int_0_std+transmit_wind_X_int_0_std+listen_wind_X_int_0_std
                                 remote_power_consumption_rpl_leaf_std                                  
                                 ];
                             
consolidado_cpu_wind_35_mW_int_x_citt_mean = [cpu_wind_35_mW_int_0_citt_mean
                                              cpu_wind_35_mW_int_10_citt_mean
                                              cpu_wind_35_mW_int_20_citt_mean
                                              cpu_wind_35_mW_int_30_citt_mean
                                              cpu_wind_35_mW_int_40_citt_mean
                                              cpu_wind_35_mW_int_50_citt_mean
                                              cpu_wind_35_mW_int_60_citt_mean
                                              cpu_wind_35_mW_int_70_citt_mean
                                              cpu_wind_35_mW_int_80_citt_mean
                                              cpu_wind_35_mW_int_90_citt_mean
                                              cpu_wind_35_mW_int_100_citt_mean               
                                             ];         
                                         
consolidado_lpm_wind_35_mW_int_0_citt_mean = [ lpm_wind_35_mW_int_0_citt_mean
                                               lpm_wind_35_mW_int_10_citt_mean
                                               lpm_wind_35_mW_int_20_citt_mean
                                               lpm_wind_35_mW_int_30_citt_mean
                                               lpm_wind_35_mW_int_40_citt_mean
                                               lpm_wind_35_mW_int_50_citt_mean
                                               lpm_wind_35_mW_int_60_citt_mean
                                               lpm_wind_35_mW_int_70_citt_mean
                                               lpm_wind_35_mW_int_80_citt_mean
                                               lpm_wind_35_mW_int_90_citt_mean
                                               lpm_wind_35_mW_int_100_citt_mean
                                              ];

consolidado_transmit_wind_35_mW_int_0_citt_mean = [transmit_wind_35_mW_int_0_citt_mean                                          
                                                   transmit_wind_35_mW_int_10_citt_mean
                                                   transmit_wind_35_mW_int_20_citt_mean
                                                   transmit_wind_35_mW_int_30_citt_mean
                                                   transmit_wind_35_mW_int_40_citt_mean
                                                   transmit_wind_35_mW_int_50_citt_mean
                                                   transmit_wind_35_mW_int_60_citt_mean
                                                   transmit_wind_35_mW_int_70_citt_mean
                                                   transmit_wind_35_mW_int_80_citt_mean
                                                   transmit_wind_35_mW_int_90_citt_mean
                                                   transmit_wind_35_mW_int_100_citt_mean
                                                   ];
                                               
consolidado_listen_wind_35_mW_int_0_citt_mean = [listen_wind_35_mW_int_0_citt_mean                                               
                                                 listen_wind_35_mW_int_10_citt_mean
                                                 listen_wind_35_mW_int_20_citt_mean
                                                 listen_wind_35_mW_int_30_citt_mean
                                                 listen_wind_35_mW_int_40_citt_mean
                                                 listen_wind_35_mW_int_50_citt_mean
                                                 listen_wind_35_mW_int_60_citt_mean
                                                 listen_wind_35_mW_int_70_citt_mean
                                                 listen_wind_35_mW_int_80_citt_mean
                                                 listen_wind_35_mW_int_90_citt_mean
                                                 listen_wind_35_mW_int_100_citt_mean
                                                 ];
                                             
consolidado_listen_wind_35_mW_int_0_citt_std = [listen_wind_35_mW_int_0_citt_std                                               
                                                 listen_wind_35_mW_int_10_citt_std
                                                 listen_wind_35_mW_int_20_citt_std
                                                 listen_wind_35_mW_int_30_citt_std
                                                 listen_wind_35_mW_int_40_citt_std
                                                 listen_wind_35_mW_int_50_citt_std
                                                 listen_wind_35_mW_int_60_citt_std
                                                 listen_wind_35_mW_int_70_citt_std
                                                 listen_wind_35_mW_int_80_citt_std
                                                 listen_wind_35_mW_int_90_citt_std
                                                 listen_wind_35_mW_int_100_citt_std
                                                 ];

consolidado_cpu_rpl_leaf_int_x_mW_mean = [cpu_rpl_leaf_int_0_mW_mean
                                          cpu_rpl_leaf_int_10_mW_mean
                                          cpu_rpl_leaf_int_20_mW_mean
                                          cpu_rpl_leaf_int_30_mW_mean
                                          cpu_rpl_leaf_int_40_mW_mean
                                          cpu_rpl_leaf_int_50_mW_mean
                                          cpu_rpl_leaf_int_60_mW_mean
                                          cpu_rpl_leaf_int_70_mW_mean
                                          cpu_rpl_leaf_int_80_mW_mean
                                          cpu_rpl_leaf_int_90_mW_mean
                                          cpu_rpl_leaf_int_100_mW_mean
                                          ];
                                      
consolidado_lpm_rpl_leaf_int_x_mW_mean = [lpm_rpl_leaf_int_0_mW_mean
                                          lpm_rpl_leaf_int_10_mW_mean
                                          lpm_rpl_leaf_int_20_mW_mean
                                          lpm_rpl_leaf_int_30_mW_mean
                                          lpm_rpl_leaf_int_40_mW_mean
                                          lpm_rpl_leaf_int_50_mW_mean
                                          lpm_rpl_leaf_int_60_mW_mean
                                          lpm_rpl_leaf_int_70_mW_mean
                                          lpm_rpl_leaf_int_80_mW_mean
                                          lpm_rpl_leaf_int_90_mW_mean
                                          lpm_rpl_leaf_int_100_mW_mean
                                          ];  
                                      
consolidado_transmit_rpl_leaf_int_x_mW_mean = [transmit_rpl_leaf_int_0_mW_mean
                                          transmit_rpl_leaf_int_10_mW_mean
                                          transmit_rpl_leaf_int_20_mW_mean
                                          transmit_rpl_leaf_int_30_mW_mean
                                          transmit_rpl_leaf_int_40_mW_mean
                                          transmit_rpl_leaf_int_50_mW_mean
                                          transmit_rpl_leaf_int_60_mW_mean
                                          transmit_rpl_leaf_int_70_mW_mean
                                          transmit_rpl_leaf_int_80_mW_mean
                                          transmit_rpl_leaf_int_90_mW_mean
                                          transmit_rpl_leaf_int_100_mW_mean
                                          ];   
                                      
                                      
consolidado_listen_rpl_leaf_int_x_mW_mean = [listen_rpl_leaf_int_0_mW_mean
                                          listen_rpl_leaf_int_10_mW_mean
                                          listen_rpl_leaf_int_20_mW_mean
                                          listen_rpl_leaf_int_30_mW_mean
                                          listen_rpl_leaf_int_40_mW_mean
                                          listen_rpl_leaf_int_50_mW_mean
                                          listen_rpl_leaf_int_60_mW_mean
                                          listen_rpl_leaf_int_70_mW_mean
                                          listen_rpl_leaf_int_80_mW_mean
                                          listen_rpl_leaf_int_90_mW_mean
                                          listen_rpl_leaf_int_100_mW_mean
                                          ];
                                      
consolidado_listen_rpl_leaf_int_x_mW_std = [listen_rpl_leaf_int_0_mW_std
                                          listen_rpl_leaf_int_10_mW_std
                                          listen_rpl_leaf_int_20_mW_std
                                          listen_rpl_leaf_int_30_mW_std
                                          listen_rpl_leaf_int_40_mW_std
                                          listen_rpl_leaf_int_50_mW_std
                                          listen_rpl_leaf_int_60_mW_std
                                          listen_rpl_leaf_int_70_mW_std
                                          listen_rpl_leaf_int_80_mW_std
                                          listen_rpl_leaf_int_90_mW_std
                                          listen_rpl_leaf_int_100_mW_std
                                          ];                                      
                                      
