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


%% rpl leaf
cpu_rpl_leaf               = cpu_rpl_leaf(~Isoutlier(cpu_rpl_leaf));
lpm_rpl_leaf               = lpm_rpl_leaf(~Isoutlier(lpm_rpl_leaf));
transmit_rpl_leaf          = transmit_rpl_leaf(~Isoutlier(transmit_rpl_leaf));
listen_rpl_leaf            = listen_rpl_leaf(~Isoutlier(listen_rpl_leaf));

 
% Volver los vectores del mismo tamaño luego de quitar los outliers
minLength = min ( [ length(cpu_rpl_leaf) length(lpm_rpl_leaf) length(transmit_rpl_leaf) length(listen_rpl_leaf) ] );

cpu_rpl_leaf      = cpu_rpl_leaf(1:minLength);
lpm_rpl_leaf      = lpm_rpl_leaf(1:minLength);
transmit_rpl_leaf = transmit_rpl_leaf(1:minLength);
listen_rpl_leaf   = listen_rpl_leaf(1:minLength);