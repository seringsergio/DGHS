close all
clear all
clc


%% read the file
seqno_node_2   = xlsread('/home/seringsergio/Desktop/DGHS/results/Corr_PacketLoss_Int/tree_plot_Corr_PacketLoss_Int_nodeID_2.xlsx','tree_plot_Corr_PacketLoss_Int_nodeID_2','C2:C276');
est_int_node_2 = xlsread('/home/seringsergio/Desktop/DGHS/results/Corr_PacketLoss_Int/tree_plot_Corr_PacketLoss_Int_nodeID_2.xlsx','tree_plot_Corr_PacketLoss_Int_nodeID_2','G2:G276');

seqno_node_3   = xlsread('/home/seringsergio/Desktop/DGHS/results/Corr_PacketLoss_Int/tree_plot_Corr_PacketLoss_Int_nodeID_3.xlsx','tree_plot_Corr_PacketLoss_Int_nodeID_3','C2:C217');
est_int_node_3 = xlsread('/home/seringsergio/Desktop/DGHS/results/Corr_PacketLoss_Int/tree_plot_Corr_PacketLoss_Int_nodeID_3.xlsx','tree_plot_Corr_PacketLoss_Int_nodeID_3','G2:G217');

%% Constantes
% num_paq_anl = 20; % MEDIAN Es el numero de paquetes analizados
% num_paq_anl = 40; % MEDIAN Es el numero de paquetes analizados

% num_paq_anl = 15; % MEAN Es el numero de paquetes analizados
% num_paq_anl = 25; % MEAN Es el numero de paquetes analizados
% num_paq_anl = 40; % MEAN Es el numero de paquetes analizados
% num_paq_anl = 50; % MEAN Es el numero de paquetes analizados
% num_paq_anl = 60; % MEAN Es el numero de paquetes analizados

%% Preprocesing : Preparar los datos

% nodo 2

i = 1;
while( length(seqno_node_2) >  (i*num_paq_anl) )   
    
    seqno_node_2_div = seqno_node_2(   (((i-1)*num_paq_anl)+1) :    (i*num_paq_anl)   );
    
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%Calcular el numero de paquetes q faltan %%%%%%%%%%%%%%%
        num_missing = 0;
        for j = min(seqno_node_2_div):1:max(seqno_node_2_div)
            if isempty(find(seqno_node_2_div == j))
               j; % Cuales fueron los seqno que se perdieron? Rta: j
               num_missing = num_missing + 1;
             end    
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        num_total_packetes = max(seqno_node_2_div) - min(seqno_node_2_div) + 1;
     
     %Obtengo el Packet reception rate PRR
     PRR_node_2(i) = (num_total_packetes - num_missing)  / num_total_packetes * 100; % packet reception rate
        
    i = i + 1;
end

i = 1;
while(length(est_int_node_2) > (i*num_paq_anl))
    est_int_node_2_div = est_int_node_2( (((i-1)*num_paq_anl)+1) :    (i*num_paq_anl) );
    %est_int_node_2_vec(i) = mean(est_int_node_2_div);
    est_int_node_2_vec(i) = median(est_int_node_2_div);
    i = i + 1;
end

%nodo 3

i = 1;
while( length(seqno_node_3) >  (i*num_paq_anl) )   
    
    seqno_node_3_div = seqno_node_3(   (((i-1)*num_paq_anl)+1) :    (i*num_paq_anl)   );
    
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%Calcular el numero de paquetes q faltan %%%%%%%%%%%%%%%
        num_missing = 0;
        for j = min(seqno_node_3_div):1:max(seqno_node_3_div)
            if isempty(find(seqno_node_3_div == j))
               j; % Cuales fueron los seqno que se perdieron? Rta: j
               num_missing = num_missing + 1;
             end    
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        num_total_packetes = max(seqno_node_3_div) - min(seqno_node_3_div) + 1;
     
     %Obtengo el Packet reception rate PRR
     PRR_node_3(i) = (num_total_packetes - num_missing)  / num_total_packetes * 100; % packet reception rate
        
    i = i + 1;
end

i = 1;
while(length(est_int_node_3) > (i*num_paq_anl))
    est_int_node_3_div = est_int_node_3( (((i-1)*num_paq_anl)+1) :    (i*num_paq_anl) );
    %est_int_node_3_vec(i) = mean(est_int_node_3_div);
    est_int_node_3_vec(i) = median(est_int_node_3_div);
    i = i + 1;
end

%% Calculo de la correlacion
corrplot([est_int_node_2_vec' PRR_node_2'],'Type','Pearson')
corrplot([est_int_node_3_vec' PRR_node_3'],'Type','Pearson')