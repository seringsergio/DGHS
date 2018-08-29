

power_rpl_citt_leaf_mean = [all_cpu_wind_5_diff_mW_int_70_mean  all_lpm_wind_5_diff_mW_int_70_mean  all_transmit_wind_5_diff_mW_int_70_mean  all_listen_wind_5_diff_mW_int_70_mean;
                            all_cpu_rpl_lead_diff_mW_mean       all_lpm_rpl_lead_diff_mW_mean       all_transmit_rpl_lead_diff_mW_mean       all_listen_rpl_lead_diff_mW_mean   
                           ];

% Este vector es para plotear. Por eso multiplico el lpm por un factor de
% factor_ploteo
power_rpl_citt_leaf_mean_plot = [all_cpu_wind_5_diff_mW_int_70_mean               all_lpm_wind_5_diff_mW_int_70_mean*factor_ploteo  all_transmit_wind_5_diff_mW_int_70_mean  all_listen_wind_5_diff_mW_int_70_mean;
                                 all_cpu_rpl_lead_diff_mW_mean*factor_ploteo_cpu  all_lpm_rpl_lead_diff_mW_mean*factor_ploteo       all_transmit_rpl_lead_diff_mW_mean       all_listen_rpl_lead_diff_mW_mean   
                                ];
                   
consolidado_rpl_citt_leaf_mean = [remote_power_consumption_int_70_wind_5_mean
                                  remote_power_consumption_rpl_lead_mean + all_cpu_rpl_lead_diff_mW_mean*factor_ploteo_cpu + all_lpm_rpl_lead_diff_mW_mean*factor_ploteo                                
                                 ];

consolidado_rpl_citt_leaf_std = [remote_power_consumption_int_70_wind_5_std
                                 remote_power_consumption_rpl_lead_std                                  
                                 ];
                             
                                   