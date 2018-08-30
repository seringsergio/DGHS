

power_rpl_citt_leaf_mean = [cpu_wind_5_mW_int_70_mean  lpm_wind_5_mW_int_70_mean  transmit_wind_5_mW_int_70_mean  listen_wind_5_mW_int_70_mean;
                            cpu_rpl_lead_mW_mean       lpm_rpl_lead_mW_mean       transmit_rpl_lead_mW_mean       listen_rpl_lead_mW_mean   
                           ];

% Este vector es para plotear. Por eso multiplico el lpm por un factor de
% factor_ploteo
power_rpl_citt_leaf_mean_plot = [cpu_wind_5_mW_int_70_mean               lpm_wind_5_mW_int_70_mean*factor_ploteo  transmit_wind_5_mW_int_70_mean  listen_wind_5_mW_int_70_mean;
                                 cpu_rpl_lead_mW_mean*factor_ploteo_cpu  lpm_rpl_lead_mW_mean*factor_ploteo       transmit_rpl_lead_mW_mean       listen_rpl_lead_mW_mean   
                                ];
                   
consolidado_rpl_citt_leaf_mean = [remote_power_consumption_int_70_wind_5_mean
                                  remote_power_consumption_rpl_lead_mean + cpu_rpl_lead_mW_mean*factor_ploteo_cpu + lpm_rpl_lead_mW_mean*factor_ploteo                                
                                 ];

consolidado_rpl_citt_leaf_std = [remote_power_consumption_int_70_wind_5_std
                                 remote_power_consumption_rpl_lead_std                                  
                                 ];
                             
                                   