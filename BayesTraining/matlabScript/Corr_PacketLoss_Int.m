close all
clear all
clc


%% read the file
% V1: Solamente con el nodo interferencia de 50% desde el comienzo
seqno_node_2   = xlsread('/home/seringsergio/Desktop/DGHS/results/Corr_PacketLoss_Int/tree_plot_Corr_PacketLoss_Int_nodeID_2.xlsx','tree_plot_Corr_PacketLoss_Int_nodeID_2','C2:C276');
est_int_node_2 = xlsread('/home/seringsergio/Desktop/DGHS/results/Corr_PacketLoss_Int/tree_plot_Corr_PacketLoss_Int_nodeID_2.xlsx','tree_plot_Corr_PacketLoss_Int_nodeID_2','G2:G276');

seqno_node_3   = xlsread('/home/seringsergio/Desktop/DGHS/results/Corr_PacketLoss_Int/tree_plot_Corr_PacketLoss_Int_nodeID_3.xlsx','tree_plot_Corr_PacketLoss_Int_nodeID_3','C2:C217');
est_int_node_3 = xlsread('/home/seringsergio/Desktop/DGHS/results/Corr_PacketLoss_Int/tree_plot_Corr_PacketLoss_Int_nodeID_3.xlsx','tree_plot_Corr_PacketLoss_Int_nodeID_3','G2:G217');

% V2: Poniendo y quitando el nodo interferencia de 30% y el de 50% 
% seqno_node_2   = xlsread('/home/seringsergio/Desktop/DGHS/results/Corr_PacketLoss_Int/tree_plot_Corr_PacketLoss_Int_50_30_node_2.xlsx','Sheet1','C2:C533');
% est_int_node_2 = xlsread('/home/seringsergio/Desktop/DGHS/results/Corr_PacketLoss_Int/tree_plot_Corr_PacketLoss_Int_50_30_node_2.xlsx','Sheet1','G2:G533');
% 
% seqno_node_3   = xlsread('/home/seringsergio/Desktop/DGHS/results/Corr_PacketLoss_Int/tree_plot_Corr_PacketLoss_Int_50_30_node_3.xlsx','Sheet1','C2:C533');
% est_int_node_3 = xlsread('/home/seringsergio/Desktop/DGHS/results/Corr_PacketLoss_Int/tree_plot_Corr_PacketLoss_Int_50_30_node_3.xlsx','Sheet1','G2:G533');


%% Constantes
%  num_paq_anl = 40; % MEDIAN Es el numero de paquetes analizados
% num_paq_anl = 40; % MEDIAN Es el numero de paquetes analizados

% num_paq_anl = 15; % MEAN Es el numero de paquetes analizados
% num_paq_anl = 25; % MEAN Es el numero de paquetes analizados
% num_paq_anl = 40; % MEAN Es el numero de paquetes analizados
% num_paq_anl = 50; % MEAN Es el numero de paquetes analizados
% num_paq_anl = 60; % MEAN Es el numero de paquetes analizados



%  for num_paq_anl = 5:1:50
 for num_paq_anl = 19

        clearvars -except num_paq_anl seqno_node_2 est_int_node_2 seqno_node_3 est_int_node_3 % borrar variables MENOS algunas
        %% Preprocesing : Preparar los datos

        % nodo 2

        % Calculo de packet reception rate
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

        % promedio de la interferencia 
        i = 1;
        while(length(est_int_node_2) > (i*num_paq_anl))
            est_int_node_2_div = est_int_node_2( (((i-1)*num_paq_anl)+1) :    (i*num_paq_anl) );
            est_int_node_2_mean(i) = mean(est_int_node_2_div);
            est_int_node_2_median(i) = median(est_int_node_2_div);
            i = i + 1;
        end

        %nodo 3

        % Calculo de packet reception rate
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

        % promedio de la interferencia 
        i = 1;
        while(length(est_int_node_3) > (i*num_paq_anl))
            est_int_node_3_div = est_int_node_3( (((i-1)*num_paq_anl)+1) :    (i*num_paq_anl) );
            est_int_node_3_mean(i) = mean(est_int_node_3_div);
            est_int_node_3_median(i) = median(est_int_node_3_div);
            i = i + 1;
        end

        %% Calculo de la correlacion
%          corrplot([est_int_node_2_mean' PRR_node_2'],'Type','Pearson')
%          corrplot([est_int_node_2_median' PRR_node_2'],'Type','Pearson')
%          corrplot([est_int_node_3_mean' PRR_node_3'],'Type','Pearson')
%          corrplot([est_int_node_3_median' PRR_node_3'],'Type','Pearson')

         matriz_corr_node_2_mean = corr([est_int_node_2_mean' PRR_node_2'],'Type','Pearson');
         matriz_corr_node_2_median = corr([est_int_node_2_median' PRR_node_2'],'Type','Pearson');

         matriz_corr_node_3_mean = corr([est_int_node_3_mean' PRR_node_3'],'Type','Pearson');
         matriz_corr_node_3_median = corr([est_int_node_3_median' PRR_node_3'],'Type','Pearson');

         fprintf('%8.1f %8.2f %8.2f %8.2f %8.2f\n', [num_paq_anl,matriz_corr_node_2_mean(1,2),matriz_corr_node_2_median(1,2),matriz_corr_node_3_mean(1,2),matriz_corr_node_3_median(1,2)]')
 end

%% plot 
figure
scatter(est_int_node_3_mean,PRR_node_3,'o','filled','LineWidth',4,'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'b' )
set(gca,'fontsize',24) % Colocar mas grandes los numeros de los ejes
xlabel('Estimated level of interference (%)','FontSize', 28,'fontweight','bold');
ylabel('Packet reception rate (%)','FontSize', 28,'fontweight','bold');
title(['Correlation =  ' num2str(matriz_corr_node_3_mean(1,2),'%.2f')], 'FontSize', 30, 'fontweight','bold');

%Find line that fits
coeffs = polyfit(est_int_node_3_mean, PRR_node_3, 1);
% Get fitted values
fittedX = linspace(10, 70, 200);
fittedY = polyval(coeffs, fittedX);
% Plot the fitted line
hold on;
plot(fittedX, fittedY, 'r-', 'LineWidth', 3);

