%% Plot the power consumption in time

plot(X_axis_time,remote_power_consumption_id_1,'b-o','LineWidth',4)
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
%set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 max(X_axis_time)]);
ylim([0 max(remote_power_consumption_id_1)+0.50 ]);
xlabel('Time (s)','FontSize', 20,'fontweight','bold');
ylabel('Power (mW)','FontSize', 20,'fontweight','bold');
title('Power consumption Node 1', 'FontSize', 22, 'fontweight','bold');
% legenda1 = 'Bayesian detector';
% legenda =legend(legenda1,'Location','SouthEast');
% set(legenda,'FontSize',14);

% X_axis_nodes 

figure
hold on
bar(1:num_nodes,consolidado_remote_power_consumption_mean','b') 
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'xtick',0:num_nodes) % para que solo muestre numeros enteros en el eje X

% Esta funcion (terrorbar) la descargue de internet para variar la longitud
% del errorbar. Width. CapSize. 
% Ref: https://la.mathworks.com/matlabcentral/fileexchange/52367-terrorbar-m-error-bars-with-controlled-widths-post-r2014b
terrorbar(1:num_nodes, consolidado_remote_power_consumption_mean, consolidado_remote_power_consumption_std',0.7,'centi');
xlabel('Node ID','FontSize', 20,'fontweight','bold');
ylabel('Power (mW)','FontSize', 20,'fontweight','bold');
title('Power consumption', 'FontSize', 22, 'fontweight','bold');
