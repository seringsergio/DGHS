%% para remover outliers del vector 
%  a = [1 2 30 4]
%  se ejecuta: 
%  a = a(~Isoutlier(a)); % remove the outliers
%  Esa funcion no esta en matlab 2014b pero se puede buscar su
%  implementacion:
%
% function [av]=Isoutlier(FF)
%   mk=median(FF);
%   M_d=mad(FF,1);
%   c=-1/(sqrt(2)*erfcinv(3/2));
%   smad=c*M_d;
%   tsmad=3*smad
%   av=(abs(FF-mk)>=tsmad);
%  end



%% for a window = 5 int_0  _v2
cpu_wind_5_int_0               = cpu_wind_5_int_0(~Isoutlier(cpu_wind_5_int_0));
lpm_wind_5_int_0               = lpm_wind_5_int_0(~Isoutlier(lpm_wind_5_int_0));
transmit_wind_5_int_0          = transmit_wind_5_int_0(~Isoutlier(transmit_wind_5_int_0));
listen_wind_5_int_0            = listen_wind_5_int_0(~Isoutlier(listen_wind_5_int_0));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_5_int_0) length(lpm_wind_5_int_0) length(transmit_wind_5_int_0) length(listen_wind_5_int_0) ] );

cpu_wind_5_int_0      = cpu_wind_5_int_0(1:minLength);
lpm_wind_5_int_0      = lpm_wind_5_int_0(1:minLength);
transmit_wind_5_int_0 = transmit_wind_5_int_0(1:minLength);
listen_wind_5_int_0   = listen_wind_5_int_0(1:minLength);

%% for a window = 10 int_0 _v2
cpu_wind_10_int_0               = cpu_wind_10_int_0(~Isoutlier(cpu_wind_10_int_0));
lpm_wind_10_int_0               = lpm_wind_10_int_0(~Isoutlier(lpm_wind_10_int_0));
transmit_wind_10_int_0          = transmit_wind_10_int_0(~Isoutlier(transmit_wind_10_int_0));
listen_wind_10_int_0            = listen_wind_10_int_0(~Isoutlier(listen_wind_10_int_0));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_10_int_0) length(lpm_wind_10_int_0) length(transmit_wind_10_int_0) length(listen_wind_10_int_0) ] );

cpu_wind_10_int_0      = cpu_wind_10_int_0(1:minLength);
lpm_wind_10_int_0      = lpm_wind_10_int_0(1:minLength);
transmit_wind_10_int_0 = transmit_wind_10_int_0(1:minLength);
listen_wind_10_int_0   = listen_wind_10_int_0(1:minLength);

%% for a window = 15 int_0 _v2
cpu_wind_15_int_0               = cpu_wind_15_int_0(~Isoutlier(cpu_wind_15_int_0));
lpm_wind_15_int_0               = lpm_wind_15_int_0(~Isoutlier(lpm_wind_15_int_0));
transmit_wind_15_int_0          = transmit_wind_15_int_0(~Isoutlier(transmit_wind_15_int_0));
listen_wind_15_int_0            = listen_wind_15_int_0(~Isoutlier(listen_wind_15_int_0));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_15_int_0) length(lpm_wind_15_int_0) length(transmit_wind_15_int_0) length(listen_wind_15_int_0) ] );

cpu_wind_15_int_0      = cpu_wind_15_int_0(1:minLength);
lpm_wind_15_int_0      = lpm_wind_15_int_0(1:minLength);
transmit_wind_15_int_0 = transmit_wind_15_int_0(1:minLength);
listen_wind_15_int_0   = listen_wind_15_int_0(1:minLength);

%% for a window = 20 int_0 _v2
cpu_wind_20_int_0               = cpu_wind_20_int_0(~Isoutlier(cpu_wind_20_int_0));
lpm_wind_20_int_0               = lpm_wind_20_int_0(~Isoutlier(lpm_wind_20_int_0));
transmit_wind_20_int_0          = transmit_wind_20_int_0(~Isoutlier(transmit_wind_20_int_0));
listen_wind_20_int_0            = listen_wind_20_int_0(~Isoutlier(listen_wind_20_int_0));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_20_int_0) length(lpm_wind_20_int_0) length(transmit_wind_20_int_0) length(listen_wind_20_int_0) ] );

cpu_wind_20_int_0      = cpu_wind_20_int_0(1:minLength);
lpm_wind_20_int_0      = lpm_wind_20_int_0(1:minLength);
transmit_wind_20_int_0 = transmit_wind_20_int_0(1:minLength);
listen_wind_20_int_0   = listen_wind_20_int_0(1:minLength);

%% for a window = 25 int_0 _v2
cpu_wind_25_int_0               = cpu_wind_25_int_0(~Isoutlier(cpu_wind_25_int_0));
lpm_wind_25_int_0               = lpm_wind_25_int_0(~Isoutlier(lpm_wind_25_int_0));
transmit_wind_25_int_0          = transmit_wind_25_int_0(~Isoutlier(transmit_wind_25_int_0));
listen_wind_25_int_0            = listen_wind_25_int_0(~Isoutlier(listen_wind_25_int_0));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_25_int_0) length(lpm_wind_25_int_0) length(transmit_wind_25_int_0) length(listen_wind_25_int_0) ] );

cpu_wind_25_int_0      = cpu_wind_25_int_0(1:minLength);
lpm_wind_25_int_0      = lpm_wind_25_int_0(1:minLength);
transmit_wind_25_int_0 = transmit_wind_25_int_0(1:minLength);
listen_wind_25_int_0   = listen_wind_25_int_0(1:minLength);

%% for a window = 30 int_0 _v2
cpu_wind_30_int_0               = cpu_wind_30_int_0(~Isoutlier(cpu_wind_30_int_0));
lpm_wind_30_int_0               = lpm_wind_30_int_0(~Isoutlier(lpm_wind_30_int_0));
transmit_wind_30_int_0          = transmit_wind_30_int_0(~Isoutlier(transmit_wind_30_int_0));
listen_wind_30_int_0            = listen_wind_30_int_0(~Isoutlier(listen_wind_30_int_0));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_30_int_0) length(lpm_wind_30_int_0) length(transmit_wind_30_int_0) length(listen_wind_30_int_0) ] );

cpu_wind_30_int_0      = cpu_wind_30_int_0(1:minLength);
lpm_wind_30_int_0      = lpm_wind_30_int_0(1:minLength);
transmit_wind_30_int_0 = transmit_wind_30_int_0(1:minLength);
listen_wind_30_int_0   = listen_wind_30_int_0(1:minLength);

%% for a window = 35 int_0 _v2
cpu_wind_35_int_0               = cpu_wind_35_int_0(~Isoutlier(cpu_wind_35_int_0));
lpm_wind_35_int_0               = lpm_wind_35_int_0(~Isoutlier(lpm_wind_35_int_0));
transmit_wind_35_int_0          = transmit_wind_35_int_0(~Isoutlier(transmit_wind_35_int_0));
listen_wind_35_int_0            = listen_wind_35_int_0(~Isoutlier(listen_wind_35_int_0));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_35_int_0) length(lpm_wind_35_int_0) length(transmit_wind_35_int_0) length(listen_wind_35_int_0) ] );

cpu_wind_35_int_0      = cpu_wind_35_int_0(1:minLength);
lpm_wind_35_int_0      = lpm_wind_35_int_0(1:minLength);
transmit_wind_35_int_0 = transmit_wind_35_int_0(1:minLength);
listen_wind_35_int_0   = listen_wind_35_int_0(1:minLength);


%% for a window = 5 int_70  _v2
cpu_wind_5_int_70               = cpu_wind_5_int_70(~Isoutlier(cpu_wind_5_int_70));
lpm_wind_5_int_70               = lpm_wind_5_int_70(~Isoutlier(lpm_wind_5_int_70));
transmit_wind_5_int_70          = transmit_wind_5_int_70(~Isoutlier(transmit_wind_5_int_70));
listen_wind_5_int_70            = listen_wind_5_int_70(~Isoutlier(listen_wind_5_int_70));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_5_int_70) length(lpm_wind_5_int_70) length(transmit_wind_5_int_70) length(listen_wind_5_int_70) ] );

cpu_wind_5_int_70      = cpu_wind_5_int_70(1:minLength);
lpm_wind_5_int_70      = lpm_wind_5_int_70(1:minLength);
transmit_wind_5_int_70 = transmit_wind_5_int_70(1:minLength);
listen_wind_5_int_70   = listen_wind_5_int_70(1:minLength);

%% for a window = 10 int_70 _v2
cpu_wind_10_int_70               = cpu_wind_10_int_70(~Isoutlier(cpu_wind_10_int_70));
lpm_wind_10_int_70               = lpm_wind_10_int_70(~Isoutlier(lpm_wind_10_int_70));
transmit_wind_10_int_70          = transmit_wind_10_int_70(~Isoutlier(transmit_wind_10_int_70));
listen_wind_10_int_70            = listen_wind_10_int_70(~Isoutlier(listen_wind_10_int_70));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_10_int_70) length(lpm_wind_10_int_70) length(transmit_wind_10_int_70) length(listen_wind_10_int_70) ] );

cpu_wind_10_int_70      = cpu_wind_10_int_70(1:minLength);
lpm_wind_10_int_70      = lpm_wind_10_int_70(1:minLength);
transmit_wind_10_int_70 = transmit_wind_10_int_70(1:minLength);
listen_wind_10_int_70   = listen_wind_10_int_70(1:minLength);

%% for a window = 15 int_70 _v2
cpu_wind_15_int_70               = cpu_wind_15_int_70(~Isoutlier(cpu_wind_15_int_70));
lpm_wind_15_int_70               = lpm_wind_15_int_70(~Isoutlier(lpm_wind_15_int_70));
transmit_wind_15_int_70          = transmit_wind_15_int_70(~Isoutlier(transmit_wind_15_int_70));
listen_wind_15_int_70            = listen_wind_15_int_70(~Isoutlier(listen_wind_15_int_70));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_15_int_70) length(lpm_wind_15_int_70) length(transmit_wind_15_int_70) length(listen_wind_15_int_70) ] );

cpu_wind_15_int_70      = cpu_wind_15_int_70(1:minLength);
lpm_wind_15_int_70      = lpm_wind_15_int_70(1:minLength);
transmit_wind_15_int_70 = transmit_wind_15_int_70(1:minLength);
listen_wind_15_int_70   = listen_wind_15_int_70(1:minLength);

%% for a window = 20 int_70 _v2
cpu_wind_20_int_70               = cpu_wind_20_int_70(~Isoutlier(cpu_wind_20_int_70));
lpm_wind_20_int_70               = lpm_wind_20_int_70(~Isoutlier(lpm_wind_20_int_70));
transmit_wind_20_int_70          = transmit_wind_20_int_70(~Isoutlier(transmit_wind_20_int_70));
listen_wind_20_int_70            = listen_wind_20_int_70(~Isoutlier(listen_wind_20_int_70));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_20_int_70) length(lpm_wind_20_int_70) length(transmit_wind_20_int_70) length(listen_wind_20_int_70) ] );

cpu_wind_20_int_70      = cpu_wind_20_int_70(1:minLength);
lpm_wind_20_int_70      = lpm_wind_20_int_70(1:minLength);
transmit_wind_20_int_70 = transmit_wind_20_int_70(1:minLength);
listen_wind_20_int_70   = listen_wind_20_int_70(1:minLength);

%% for a window = 25 int_70 _v2
cpu_wind_25_int_70               = cpu_wind_25_int_70(~Isoutlier(cpu_wind_25_int_70));
lpm_wind_25_int_70               = lpm_wind_25_int_70(~Isoutlier(lpm_wind_25_int_70));
transmit_wind_25_int_70          = transmit_wind_25_int_70(~Isoutlier(transmit_wind_25_int_70));
listen_wind_25_int_70            = listen_wind_25_int_70(~Isoutlier(listen_wind_25_int_70));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_25_int_70) length(lpm_wind_25_int_70) length(transmit_wind_25_int_70) length(listen_wind_25_int_70) ] );

cpu_wind_25_int_70      = cpu_wind_25_int_70(1:minLength);
lpm_wind_25_int_70      = lpm_wind_25_int_70(1:minLength);
transmit_wind_25_int_70 = transmit_wind_25_int_70(1:minLength);
listen_wind_25_int_70   = listen_wind_25_int_70(1:minLength);

%% for a window = 30 int_70 _v2
cpu_wind_30_int_70               = cpu_wind_30_int_70(~Isoutlier(cpu_wind_30_int_70));
lpm_wind_30_int_70               = lpm_wind_30_int_70(~Isoutlier(lpm_wind_30_int_70));
transmit_wind_30_int_70          = transmit_wind_30_int_70(~Isoutlier(transmit_wind_30_int_70));
listen_wind_30_int_70            = listen_wind_30_int_70(~Isoutlier(listen_wind_30_int_70));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_30_int_70) length(lpm_wind_30_int_70) length(transmit_wind_30_int_70) length(listen_wind_30_int_70) ] );

cpu_wind_30_int_70      = cpu_wind_30_int_70(1:minLength);
lpm_wind_30_int_70      = lpm_wind_30_int_70(1:minLength);
transmit_wind_30_int_70 = transmit_wind_30_int_70(1:minLength);
listen_wind_30_int_70   = listen_wind_30_int_70(1:minLength);

%% for a window = 35 int_70 _v2
cpu_wind_35_int_70               = cpu_wind_35_int_70(~Isoutlier(cpu_wind_35_int_70));
lpm_wind_35_int_70               = lpm_wind_35_int_70(~Isoutlier(lpm_wind_35_int_70));
transmit_wind_35_int_70          = transmit_wind_35_int_70(~Isoutlier(transmit_wind_35_int_70));
listen_wind_35_int_70            = listen_wind_35_int_70(~Isoutlier(listen_wind_35_int_70));

% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_wind_35_int_70) length(lpm_wind_35_int_70) length(transmit_wind_35_int_70) length(listen_wind_35_int_70) ] );

cpu_wind_35_int_70      = cpu_wind_35_int_70(1:minLength);
lpm_wind_35_int_70      = lpm_wind_35_int_70(1:minLength);
transmit_wind_35_int_70 = transmit_wind_35_int_70(1:minLength);
listen_wind_35_int_70   = listen_wind_35_int_70(1:minLength);
