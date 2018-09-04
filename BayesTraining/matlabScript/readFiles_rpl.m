

%% rpl leaf int_0 nodo_leaf
clock_time_rpl_leaf        = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_leaf.xlsx','powertrace_rpl_leaf','B221:B1675');
all_cpu_rpl_leaf           = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_leaf.xlsx','powertrace_rpl_leaf','E221:E1675');
all_lpm_rpl_leaf           = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_leaf.xlsx','powertrace_rpl_leaf','F221:F1675');
all_transmit_rpl_leaf      = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_leaf.xlsx','powertrace_rpl_leaf','G221:G1675');
all_listen_rpl_leaf        = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_leaf.xlsx','powertrace_rpl_leaf','H221:H1675');
all_idle_transmit_rpl_leaf = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_leaf.xlsx','powertrace_rpl_leaf','I221:I1675');
all_idle_listen_rpl_leaf   = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_leaf.xlsx','powertrace_rpl_leaf','J221:J1675');
cpu_rpl_leaf               = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_leaf.xlsx','powertrace_rpl_leaf','K221:K1675');
lpm_rpl_leaf               = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_leaf.xlsx','powertrace_rpl_leaf','L221:L1675');
transmit_rpl_leaf          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_leaf.xlsx','powertrace_rpl_leaf','M221:M1675');
listen_rpl_leaf            = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_leaf.xlsx','powertrace_rpl_leaf','N221:N1675');
idle_transmit_rpl_leaf     = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_leaf.xlsx','powertrace_rpl_leaf','O221:O1675');
idle_listen_rpl_leaf       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_leaf.xlsx','powertrace_rpl_leaf','P221:P1675');

%% Nodo_leaf variando el porcentage de interferencia

% rpl leaf: int_0 - nodo_leaf
clock_time_rpl_leaf_int_0       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_0.xlsx','powertrace_rpl_int_0','B2:B317');
all_cpu_rpl_leaf_int_0          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_0.xlsx','powertrace_rpl_int_0','E2:E317');
all_lpm_rpl_leaf_int_0          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_0.xlsx','powertrace_rpl_int_0','F2:F317');
all_transmit_rpl_leaf_int_0     = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_0.xlsx','powertrace_rpl_int_0','G2:G317');
all_listen_rpl_leaf_int_0       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_0.xlsx','powertrace_rpl_int_0','H2:H317');
all_idle_transmit_rpl_leaf_int_0= xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_0.xlsx','powertrace_rpl_int_0','I2:I317');
all_idle_listen_rpl_leaf_int_0  = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_0.xlsx','powertrace_rpl_int_0','J2:J317');
cpu_rpl_leaf_int_0              = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_0.xlsx','powertrace_rpl_int_0','K2:K317');
lpm_rpl_leaf_int_0              = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_0.xlsx','powertrace_rpl_int_0','L2:L317');
transmit_rpl_leaf_int_0         = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_0.xlsx','powertrace_rpl_int_0','M2:M317');
listen_rpl_leaf_int_0           = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_0.xlsx','powertrace_rpl_int_0','N2:N317');
idle_transmit_rpl_leaf_int_0    = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_0.xlsx','powertrace_rpl_int_0','O2:O317');
idle_listen_rpl_leaf_int_0      = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_0.xlsx','powertrace_rpl_int_0','P2:P317');

% rpl leaf: int_10 - nodo_leaf
clock_time_rpl_leaf_int_10       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_10.xlsx','powertrace_rpl_int_10','B2:B316');
all_cpu_rpl_leaf_int_10          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_10.xlsx','powertrace_rpl_int_10','E2:E316');
all_lpm_rpl_leaf_int_10          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_10.xlsx','powertrace_rpl_int_10','F2:F316');
all_transmit_rpl_leaf_int_10     = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_10.xlsx','powertrace_rpl_int_10','G2:G316');
all_listen_rpl_leaf_int_10       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_10.xlsx','powertrace_rpl_int_10','H2:H316');
all_idle_transmit_rpl_leaf_int_10= xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_10.xlsx','powertrace_rpl_int_10','I2:I316');
all_idle_listen_rpl_leaf_int_10  = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_10.xlsx','powertrace_rpl_int_10','J2:J316');
cpu_rpl_leaf_int_10              = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_10.xlsx','powertrace_rpl_int_10','K2:K316');
lpm_rpl_leaf_int_10              = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_10.xlsx','powertrace_rpl_int_10','L2:L316');
transmit_rpl_leaf_int_10         = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_10.xlsx','powertrace_rpl_int_10','M2:M316');
listen_rpl_leaf_int_10           = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_10.xlsx','powertrace_rpl_int_10','N2:N316');
idle_transmit_rpl_leaf_int_10    = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_10.xlsx','powertrace_rpl_int_10','O2:O316');
idle_listen_rpl_leaf_int_10      = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_10.xlsx','powertrace_rpl_int_10','P2:P316');

% rpl leaf: int_20 - nodo_leaf
clock_time_rpl_leaf_int_20       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_20.xlsx','powertrace_rpl_int_20','B2:B316');
all_cpu_rpl_leaf_int_20          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_20.xlsx','powertrace_rpl_int_20','E2:E316');
all_lpm_rpl_leaf_int_20          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_20.xlsx','powertrace_rpl_int_20','F2:F316');
all_transmit_rpl_leaf_int_20     = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_20.xlsx','powertrace_rpl_int_20','G2:G316');
all_listen_rpl_leaf_int_20       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_20.xlsx','powertrace_rpl_int_20','H2:H316');
all_idle_transmit_rpl_leaf_int_20= xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_20.xlsx','powertrace_rpl_int_20','I2:I316');
all_idle_listen_rpl_leaf_int_20  = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_20.xlsx','powertrace_rpl_int_20','J2:J316');
cpu_rpl_leaf_int_20              = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_20.xlsx','powertrace_rpl_int_20','K2:K316');
lpm_rpl_leaf_int_20              = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_20.xlsx','powertrace_rpl_int_20','L2:L316');
transmit_rpl_leaf_int_20         = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_20.xlsx','powertrace_rpl_int_20','M2:M316');
listen_rpl_leaf_int_20           = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_20.xlsx','powertrace_rpl_int_20','N2:N316');
idle_transmit_rpl_leaf_int_20    = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_20.xlsx','powertrace_rpl_int_20','O2:O316');
idle_listen_rpl_leaf_int_20      = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_20.xlsx','powertrace_rpl_int_20','P2:P316');

% rpl leaf: int_30 - nodo_leaf
clock_time_rpl_leaf_int_30       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_30.xlsx','powertrace_rpl_int_30','B2:B1359');
all_cpu_rpl_leaf_int_30          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_30.xlsx','powertrace_rpl_int_30','E2:E1359');
all_lpm_rpl_leaf_int_30          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_30.xlsx','powertrace_rpl_int_30','F2:F1359');
all_transmit_rpl_leaf_int_30     = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_30.xlsx','powertrace_rpl_int_30','G2:G1359');
all_listen_rpl_leaf_int_30       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_30.xlsx','powertrace_rpl_int_30','H2:H1359');
all_idle_transmit_rpl_leaf_int_30= xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_30.xlsx','powertrace_rpl_int_30','I2:I1359');
all_idle_listen_rpl_leaf_int_30  = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_30.xlsx','powertrace_rpl_int_30','J2:J1359');
cpu_rpl_leaf_int_30              = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_30.xlsx','powertrace_rpl_int_30','K2:K1359');
lpm_rpl_leaf_int_30              = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_30.xlsx','powertrace_rpl_int_30','L2:L1359');
transmit_rpl_leaf_int_30         = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_30.xlsx','powertrace_rpl_int_30','M2:M1359');
listen_rpl_leaf_int_30           = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_30.xlsx','powertrace_rpl_int_30','N2:N1359');
idle_transmit_rpl_leaf_int_30    = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_30.xlsx','powertrace_rpl_int_30','O2:O1359');
idle_listen_rpl_leaf_int_30      = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_30.xlsx','powertrace_rpl_int_30','P2:P1359');

% rpl leaf: int_40 - nodo_leaf
clock_time_rpl_leaf_int_40       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_40.xlsx','powertrace_rpl_int_40','B2:B318');
all_cpu_rpl_leaf_int_40          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_40.xlsx','powertrace_rpl_int_40','E2:E318');
all_lpm_rpl_leaf_int_40          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_40.xlsx','powertrace_rpl_int_40','F2:F318');
all_transmit_rpl_leaf_int_40     = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_40.xlsx','powertrace_rpl_int_40','G2:G318');
all_listen_rpl_leaf_int_40       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_40.xlsx','powertrace_rpl_int_40','H2:H318');
all_idle_transmit_rpl_leaf_int_40= xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_40.xlsx','powertrace_rpl_int_40','I2:I318');
all_idle_listen_rpl_leaf_int_40  = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_40.xlsx','powertrace_rpl_int_40','J2:J318');
cpu_rpl_leaf_int_40              = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_40.xlsx','powertrace_rpl_int_40','K2:K318');
lpm_rpl_leaf_int_40              = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_40.xlsx','powertrace_rpl_int_40','L2:L318');
transmit_rpl_leaf_int_40         = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_40.xlsx','powertrace_rpl_int_40','M2:M318');
listen_rpl_leaf_int_40           = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_40.xlsx','powertrace_rpl_int_40','N2:N318');
idle_transmit_rpl_leaf_int_40    = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_40.xlsx','powertrace_rpl_int_40','O2:O318');
idle_listen_rpl_leaf_int_40      = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_40.xlsx','powertrace_rpl_int_40','P2:P318');

% rpl leaf: int_50 - nodo_leaf
clock_time_rpl_leaf_int_50       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_50.xlsx','powertrace_rpl_int_50','B2:B317');
all_cpu_rpl_leaf_int_50          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_50.xlsx','powertrace_rpl_int_50','E2:E317');
all_lpm_rpl_leaf_int_50          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_50.xlsx','powertrace_rpl_int_50','F2:F317');
all_transmit_rpl_leaf_int_50     = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_50.xlsx','powertrace_rpl_int_50','G2:G317');
all_listen_rpl_leaf_int_50       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_50.xlsx','powertrace_rpl_int_50','H2:H317');
all_idle_transmit_rpl_leaf_int_50= xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_50.xlsx','powertrace_rpl_int_50','I2:I317');
all_idle_listen_rpl_leaf_int_50  = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_50.xlsx','powertrace_rpl_int_50','J2:J317');
cpu_rpl_leaf_int_50              = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_50.xlsx','powertrace_rpl_int_50','K2:K317');
lpm_rpl_leaf_int_50              = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_50.xlsx','powertrace_rpl_int_50','L2:L317');
transmit_rpl_leaf_int_50         = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_50.xlsx','powertrace_rpl_int_50','M2:M317');
listen_rpl_leaf_int_50           = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_50.xlsx','powertrace_rpl_int_50','N2:N317');
idle_transmit_rpl_leaf_int_50    = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_50.xlsx','powertrace_rpl_int_50','O2:O317');
idle_listen_rpl_leaf_int_50      = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_50.xlsx','powertrace_rpl_int_50','P2:P317');

% rpl leaf: int_60 - nodo_leaf
clock_time_rpl_leaf_int_60       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_60.xlsx','powertrace_rpl_int_60','B2:B316');
all_cpu_rpl_leaf_int_60          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_60.xlsx','powertrace_rpl_int_60','E2:E316');
all_lpm_rpl_leaf_int_60          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_60.xlsx','powertrace_rpl_int_60','F2:F316');
all_transmit_rpl_leaf_int_60     = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_60.xlsx','powertrace_rpl_int_60','G2:G316');
all_listen_rpl_leaf_int_60       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_60.xlsx','powertrace_rpl_int_60','H2:H316');
all_idle_transmit_rpl_leaf_int_60= xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_60.xlsx','powertrace_rpl_int_60','I2:I316');
all_idle_listen_rpl_leaf_int_60  = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_60.xlsx','powertrace_rpl_int_60','J2:J316');
cpu_rpl_leaf_int_60              = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_60.xlsx','powertrace_rpl_int_60','K2:K316');
lpm_rpl_leaf_int_60              = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_60.xlsx','powertrace_rpl_int_60','L2:L316');
transmit_rpl_leaf_int_60         = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_60.xlsx','powertrace_rpl_int_60','M2:M316');
listen_rpl_leaf_int_60           = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_60.xlsx','powertrace_rpl_int_60','N2:N316');
idle_transmit_rpl_leaf_int_60    = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_60.xlsx','powertrace_rpl_int_60','O2:O316');
idle_listen_rpl_leaf_int_60      = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_60.xlsx','powertrace_rpl_int_60','P2:P316');

% rpl leaf: int_70 - nodo_leaf
clock_time_rpl_leaf_int_70       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_70.xlsx','powertrace_rpl_int_70','B2:B323');
all_cpu_rpl_leaf_int_70          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_70.xlsx','powertrace_rpl_int_70','E2:E323');
all_lpm_rpl_leaf_int_70          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_70.xlsx','powertrace_rpl_int_70','F2:F323');
all_transmit_rpl_leaf_int_70     = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_70.xlsx','powertrace_rpl_int_70','G2:G323');
all_listen_rpl_leaf_int_70       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_70.xlsx','powertrace_rpl_int_70','H2:H323');
all_idle_transmit_rpl_leaf_int_70= xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_70.xlsx','powertrace_rpl_int_70','I2:I323');
all_idle_listen_rpl_leaf_int_70  = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_70.xlsx','powertrace_rpl_int_70','J2:J323');
cpu_rpl_leaf_int_70              = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_70.xlsx','powertrace_rpl_int_70','K2:K323');
lpm_rpl_leaf_int_70              = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_70.xlsx','powertrace_rpl_int_70','L2:L323');
transmit_rpl_leaf_int_70         = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_70.xlsx','powertrace_rpl_int_70','M2:M323');
listen_rpl_leaf_int_70           = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_70.xlsx','powertrace_rpl_int_70','N2:N323');
idle_transmit_rpl_leaf_int_70    = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_70.xlsx','powertrace_rpl_int_70','O2:O323');
idle_listen_rpl_leaf_int_70      = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_70.xlsx','powertrace_rpl_int_70','P2:P323');

% rpl leaf: int_80 - nodo_leaf
clock_time_rpl_leaf_int_80       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_80.xlsx','powertrace_rpl_int_80','B2:B328');
all_cpu_rpl_leaf_int_80          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_80.xlsx','powertrace_rpl_int_80','E2:E328');
all_lpm_rpl_leaf_int_80          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_80.xlsx','powertrace_rpl_int_80','F2:F328');
all_transmit_rpl_leaf_int_80     = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_80.xlsx','powertrace_rpl_int_80','G2:G328');
all_listen_rpl_leaf_int_80       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_80.xlsx','powertrace_rpl_int_80','H2:H328');
all_idle_transmit_rpl_leaf_int_80= xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_80.xlsx','powertrace_rpl_int_80','I2:I328');
all_idle_listen_rpl_leaf_int_80  = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_80.xlsx','powertrace_rpl_int_80','J2:J328');
cpu_rpl_leaf_int_80              = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_80.xlsx','powertrace_rpl_int_80','K2:K328');
lpm_rpl_leaf_int_80              = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_80.xlsx','powertrace_rpl_int_80','L2:L328');
transmit_rpl_leaf_int_80         = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_80.xlsx','powertrace_rpl_int_80','M2:M328');
listen_rpl_leaf_int_80           = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_80.xlsx','powertrace_rpl_int_80','N2:N328');
idle_transmit_rpl_leaf_int_80    = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_80.xlsx','powertrace_rpl_int_80','O2:O328');
idle_listen_rpl_leaf_int_80      = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_80.xlsx','powertrace_rpl_int_80','P2:P328');

% rpl leaf: int_90 - nodo_leaf
clock_time_rpl_leaf_int_90       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_90.xlsx','powertrace_rpl_int_90','B2:B318');
all_cpu_rpl_leaf_int_90          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_90.xlsx','powertrace_rpl_int_90','E2:E318');
all_lpm_rpl_leaf_int_90          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_90.xlsx','powertrace_rpl_int_90','F2:F318');
all_transmit_rpl_leaf_int_90     = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_90.xlsx','powertrace_rpl_int_90','G2:G318');
all_listen_rpl_leaf_int_90       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_90.xlsx','powertrace_rpl_int_90','H2:H318');
all_idle_transmit_rpl_leaf_int_90= xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_90.xlsx','powertrace_rpl_int_90','I2:I318');
all_idle_listen_rpl_leaf_int_90  = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_90.xlsx','powertrace_rpl_int_90','J2:J318');
cpu_rpl_leaf_int_90              = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_90.xlsx','powertrace_rpl_int_90','K2:K318');
lpm_rpl_leaf_int_90              = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_90.xlsx','powertrace_rpl_int_90','L2:L318');
transmit_rpl_leaf_int_90         = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_90.xlsx','powertrace_rpl_int_90','M2:M318');
listen_rpl_leaf_int_90           = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_90.xlsx','powertrace_rpl_int_90','N2:N318');
idle_transmit_rpl_leaf_int_90    = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_90.xlsx','powertrace_rpl_int_90','O2:O318');
idle_listen_rpl_leaf_int_90      = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_90.xlsx','powertrace_rpl_int_90','P2:P318');

% rpl leaf: int_100 - nodo_leaf
clock_time_rpl_leaf_int_100       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_100.xlsx','powertrace_rpl_int_100','B2:B317');
all_cpu_rpl_leaf_int_100          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_100.xlsx','powertrace_rpl_int_100','E2:E317');
all_lpm_rpl_leaf_int_100          = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_100.xlsx','powertrace_rpl_int_100','F2:F317');
all_transmit_rpl_leaf_int_100     = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_100.xlsx','powertrace_rpl_int_100','G2:G317');
all_listen_rpl_leaf_int_100       = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_100.xlsx','powertrace_rpl_int_100','H2:H317');
all_idle_transmit_rpl_leaf_int_100= xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_100.xlsx','powertrace_rpl_int_100','I2:I317');
all_idle_listen_rpl_leaf_int_100  = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_100.xlsx','powertrace_rpl_int_100','J2:J317');
cpu_rpl_leaf_int_100              = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_100.xlsx','powertrace_rpl_int_100','K2:K317');
lpm_rpl_leaf_int_100              = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_100.xlsx','powertrace_rpl_int_100','L2:L317');
transmit_rpl_leaf_int_100         = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_100.xlsx','powertrace_rpl_int_100','M2:M317');
listen_rpl_leaf_int_100           = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_100.xlsx','powertrace_rpl_int_100','N2:N317');
idle_transmit_rpl_leaf_int_100    = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_100.xlsx','powertrace_rpl_int_100','O2:O317');
idle_listen_rpl_leaf_int_100      = xlsread('/home/seringsergio/Desktop/DGHS/rpl/results/powertrace_rpl_int_100.xlsx','powertrace_rpl_int_100','P2:P317');
