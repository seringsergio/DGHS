%% sink int_0 citt

seqno_sink_citt_int_0_7dBm        = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_sink_citt_int_0_7dBm_v3.xlsx','latency_PRR_sink_citt_int_0_7dBm','B2:B747');
nodeID_sink_citt_int_0_7dBm       = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_sink_citt_int_0_7dBm_v3.xlsx','latency_PRR_sink_citt_int_0_7dBm','C2:C747');
[temp, date_sink_citt_int_0_7dBm] = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_sink_citt_int_0_7dBm_v3.xlsx','latency_PRR_sink_citt_int_0_7dBm','D2:D747');


%% leaf node int_0 citt

seqno_leaf_citt_int_0_7dBm        = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_leaf_citt_int_0_7dBm_v3.xlsx','latency_PRR_leaf_citt_int_0_7dBm','B2:B905');
nodeID_leaf_citt_int_0_7dBm       = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_leaf_citt_int_0_7dBm_v3.xlsx','latency_PRR_leaf_citt_int_0_7dBm','C2:C905');
[temp, date_leaf_citt_int_0_7dBm] = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_leaf_citt_int_0_7dBm_v3.xlsx','latency_PRR_leaf_citt_int_0_7dBm','D2:D905');


% %% sink int_0 citt
% 
% seqno_sink_citt_int_0_7dBm        = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_sink_citt_int_0_7dBm_v2.xlsx','latency_PRR_sink_citt_int_0_7dBm','B2:B251');
% nodeID_sink_citt_int_0_7dBm       = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_sink_citt_int_0_7dBm_v2.xlsx','latency_PRR_sink_citt_int_0_7dBm','C2:C251');
% [temp, date_sink_citt_int_0_7dBm] = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_sink_citt_int_0_7dBm_v2.xlsx','latency_PRR_sink_citt_int_0_7dBm','D2:D251');
% 
% 
% %% leaf node int_0 citt
% 
% seqno_leaf_citt_int_0_7dBm        = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_leaf_citt_int_0_7dBm_v2.xlsx','latency_PRR_leaf_citt_int_0_7dBm','B2:B279');
% nodeID_leaf_citt_int_0_7dBm       = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_leaf_citt_int_0_7dBm_v2.xlsx','latency_PRR_leaf_citt_int_0_7dBm','C2:C279');
% [temp, date_leaf_citt_int_0_7dBm] = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_leaf_citt_int_0_7dBm_v2.xlsx','latency_PRR_leaf_citt_int_0_7dBm','D2:D279');


% %% sink int_0 citt
% 
% seqno_sink_citt_int_0_7dBm        = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_sink_citt_int_0_7dBm_v1.xlsx','latency_PRR_sink_citt_int_0_7dBm','B2:B149');
% nodeID_sink_citt_int_0_7dBm       = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_sink_citt_int_0_7dBm_v1.xlsx','latency_PRR_sink_citt_int_0_7dBm','C2:C149');
% [temp, date_sink_citt_int_0_7dBm] = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_sink_citt_int_0_7dBm_v1.xlsx','latency_PRR_sink_citt_int_0_7dBm','D2:D149');
% 
% 
% %% leaf node int_0 citt
% 
% seqno_leaf_citt_int_0_7dBm        = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_leaf_citt_int_0_7dBm_v1.xlsx','latency_PRR_leaf_citt_int_0_7dBm','B2:B420');
% nodeID_leaf_citt_int_0_7dBm       = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_leaf_citt_int_0_7dBm_v1.xlsx','latency_PRR_leaf_citt_int_0_7dBm','C2:C420');
% [temp, date_leaf_citt_int_0_7dBm] = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_leaf_citt_int_0_7dBm_v1.xlsx','latency_PRR_leaf_citt_int_0_7dBm','D2:D420');

% %% sink int_0 RPL
% 
% seqno_sink_RPL_int_0        = xlsread('/home/seringsergio/Desktop/DGHS/results/latency-PRR/latency_PRR_sink_RPL_int_0.xlsx','latency_PRR_sink_RPL_int_0','B2:B14585');
% nodeID_sink_RPL_int_0       = xlsread('/home/seringsergio/Desktop/DGHS/results/latency-PRR/latency_PRR_sink_RPL_int_0.xlsx','latency_PRR_sink_RPL_int_0','C2:C14585');
% [temp, date_sink_RPL_int_0] = xlsread('/home/seringsergio/Desktop/DGHS/results/latency-PRR/latency_PRR_sink_RPL_int_0.xlsx','latency_PRR_sink_RPL_int_0','D2:D14585');
% 
% 
% %% leaf node int_0 RPL
% 
% seqno_leaf_RPL_int_0        = xlsread('/home/seringsergio/Desktop/DGHS/results/latency-PRR/latency_PRR_leaf_RPL_int_0.xlsx','latency_PRR_leaf_RPL_int_0','B2:B14628');
% nodeID_leaf_RPL_int_0       = xlsread('/home/seringsergio/Desktop/DGHS/results/latency-PRR/latency_PRR_leaf_RPL_int_0.xlsx','latency_PRR_leaf_RPL_int_0','C2:C14628');
% [temp, date_leaf_RPL_int_0] = xlsread('/home/seringsergio/Desktop/DGHS/results/latency-PRR/latency_PRR_leaf_RPL_int_0.xlsx','latency_PRR_leaf_RPL_int_0','D2:D14628');


%% sink int_0 RPL 7dBm

seqno_sink_RPL_int_0_7dBm        = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_sink_RPL_int_0_7dBm.xlsx','latency_PRR_sink_RPL_int_0_7dBm','B2:B4575');
nodeID_sink_RPL_int_0_7dBm       = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_sink_RPL_int_0_7dBm.xlsx','latency_PRR_sink_RPL_int_0_7dBm','C2:C4575');
[temp, date_sink_RPL_int_0_7dBm] = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_sink_RPL_int_0_7dBm.xlsx','latency_PRR_sink_RPL_int_0_7dBm','D2:D4575');


%% leaf int_0 RPL 7dBm

seqno_leaf_RPL_int_0_7dBm        = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_leaf_RPL_int_0_7dBm.xlsx','latency_PRR_leaf_RPL_int_0_7dBm','B2:B6175');
nodeID_leaf_RPL_int_0_7dBm       = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_leaf_RPL_int_0_7dBm.xlsx','latency_PRR_leaf_RPL_int_0_7dBm','C2:C6175');
[temp, date_leaf_RPL_int_0_7dBm] = xlsread('/home/seringsergio/Desktop/DGHS/results/9_nodes/Latency_PRR/latency_PRR_leaf_RPL_int_0_7dBm.xlsx','latency_PRR_leaf_RPL_int_0_7dBm','D2:D6175');




