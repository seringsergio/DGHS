
%% diff: calcula la diferencia entre el siguiente elemento y el actual


all_cpu_rpl_leaf_diff      = diff(all_cpu_rpl_leaf); 
all_lpm_rpl_leaf_diff      = diff(all_lpm_rpl_leaf); 
all_transmit_rpl_leaf_diff = diff(all_transmit_rpl_leaf); 
all_listen_rpl_leaf_diff   = diff(all_listen_rpl_leaf); 

%% Dado que el contador de powertrace se reinicia, en un punto la diff da negativa.
%  Por lo tanto toca eliminar los datos negativos de los datos.
%  Para eliminar los Zeros de un vector ejecuto A(A>=0)

all_cpu_rpl_leaf_diff = all_cpu_rpl_leaf_diff( all_cpu_rpl_leaf_diff>=0 );
all_lpm_rpl_leaf_diff = all_lpm_rpl_leaf_diff( all_lpm_rpl_leaf_diff>=0 );
all_transmit_rpl_leaf_diff = all_transmit_rpl_leaf_diff( all_transmit_rpl_leaf_diff>=0 );
all_listen_rpl_leaf_diff = all_listen_rpl_leaf_diff( all_listen_rpl_leaf_diff>=0 );

% Hacer los vectores del mismo tamaño. Del minimo tamaño.

minLength = min( [length(all_cpu_rpl_leaf_diff),length(all_lpm_rpl_leaf_diff),length(all_transmit_rpl_leaf_diff),length(all_listen_rpl_leaf_diff)]   );

all_cpu_rpl_leaf_diff = all_cpu_rpl_leaf_diff(1:minLength);
all_lpm_rpl_leaf_diff = all_lpm_rpl_leaf_diff(1:minLength);
all_transmit_rpl_leaf_diff = all_transmit_rpl_leaf_diff(1:minLength);
all_listen_rpl_leaf_diff = all_listen_rpl_leaf_diff(1:minLength);


%% power en miliWatios mW

all_cpu_rpl_lead_diff_mW = all_cpu_rpl_leaf_diff * current_CPU_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
all_lpm_rpl_lead_diff_mW = all_lpm_rpl_leaf_diff * current_LPM_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
all_transmit_rpl_lead_diff_mW = all_transmit_rpl_leaf_diff * current_TX_remote_0_dBm * voltage_remote / rtimer_second_remote / powertrace_period_rpl;
all_listen_rpl_lead_diff_mW = all_listen_rpl_leaf_diff * current_RX_remote * voltage_remote / rtimer_second_remote / powertrace_period_rpl;

%% total power consumption in mWall_cpu_wind_15_diff_mW_int_0_mean

remote_power_consumption_rpl_lead = all_cpu_rpl_lead_diff_mW + all_lpm_rpl_lead_diff_mW + all_transmit_rpl_lead_diff_mW + all_listen_rpl_lead_diff_mW;


%% Promedio y desviacion estandar 
remote_power_consumption_rpl_lead_mean = mean(remote_power_consumption_rpl_lead);
remote_power_consumption_rpl_lead_std  = std(remote_power_consumption_rpl_lead);

% diferenciado 
all_cpu_rpl_lead_diff_mW_mean      = mean(all_cpu_rpl_lead_diff_mW); 
all_lpm_rpl_lead_diff_mW_mean      = mean(all_lpm_rpl_lead_diff_mW);  
all_transmit_rpl_lead_diff_mW_mean = mean(all_transmit_rpl_lead_diff_mW);
all_listen_rpl_lead_diff_mW_mean   = mean(all_listen_rpl_lead_diff_mW);

all_cpu_rpl_lead_diff_mW_std      = std(all_cpu_rpl_lead_diff_mW); 
all_lpm_rpl_lead_diff_mW_std      = std(all_lpm_rpl_lead_diff_mW);  
all_transmit_rpl_lead_diff_mW_std = std(all_transmit_rpl_lead_diff_mW);
all_listen_rpl_lead_diff_mW_std   = std(all_listen_rpl_lead_diff_mW);

