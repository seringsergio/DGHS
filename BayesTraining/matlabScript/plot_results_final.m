%% bpt (Backoff Time per packet)
figure

subplot(10,1,1:3);

h1  = errorbar(int_vec_0_100,vec_zeros,EWMA1_std_btp_01_vec,'r-','LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(EWMA1_std_btp_01_vec*-1)-15 max(EWMA1_std_btp_01_vec)+15 ]);
ylabel('Std Dev','FontSize', 20,'fontweight','bold');
title('Backoff time per packet', 'FontSize', 22, 'fontweight','bold');

subplot(10,1,4:10);

plot(int_vec_0_100, EWMA1_mean_btp_01_vec,'b-o','LineWidth',4)
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
xlabel('Percentage of interference (%)','FontSize', 20,'fontweight','bold');
ylabel('Backoff time (ms)','FontSize', 20,'fontweight','bold');


%% ppl (Percentage of Packet Loss)
figure

subplot(10,1,1:3);

h1  = errorbar(int_vec_0_100,vec_zeros,EWMA1_std_ppl_01_vec,'r-','LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(EWMA1_std_ppl_01_vec*-1)-0.02 max(EWMA1_std_ppl_01_vec)+0.02 ]);
ylabel('Std Dev','FontSize', 20,'fontweight','bold');
title('Percentage of packet loss', 'FontSize', 22, 'fontweight','bold');

subplot(10,1,4:10);

plot(int_vec_0_100, EWMA1_mean_ppl_01_vec,'b-o','LineWidth',4)
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
xlabel('Percentage of interference (%)','FontSize', 20,'fontweight','bold');
ylabel('Packet loss (%)','FontSize', 20,'fontweight','bold');

%% Detection accuracy

% para graficar la deteccion de interferencia variando el valor del EWMA
% 0.1 0.2 0.3 0.4 .... 0.9 
plot_EWMA_0X


% %% Vary EWMA 0.1 0.2 0.3 .... 0.9 : mean_error_int_vec_EWMA_0X_vec
% 
% figure;
% subplot(10,1,1:2);
% 
% h1  = errorbar(EWMA_vec,vec_zeros_9,std_error_int_vec_EWMA_0X_vec,'r-','LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
% xlim([min(EWMA_vec) max(EWMA_vec)]);
% ylim([min(std_error_int_vec_EWMA_0X_vec*-1)-2.00 max(std_error_int_vec_EWMA_0X_vec)+2.00 ]);
% ylabel('Std Dev','FontSize', 20,'fontweight','bold');
% title('Detection error', 'FontSize', 22, 'fontweight','bold');
% 
% subplot(10,1,3:10);
% plot(EWMA_vec, mean_error_int_vec_EWMA_0X_vec,'b-o','LineWidth',4)
% xlim([min(EWMA_vec) max(EWMA_vec)]);
% ylim([0 max(mean_error_int_vec_EWMA_0X_vec)+1.00]);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% xlabel('α','FontSize', 20,'fontweight','bold');
% ylabel('Detection error','FontSize', 20,'fontweight','bold');
% %legenda1 = 'Bayesian detector';
% %legenda2 = 'Ideal detector';
% %legenda =legend(legenda1,legenda2,'Location','SouthEast');
% %set(legenda,'FontSize',14);

%% Vary EWMA 0.1 0.2 0.3 .... 0.9 : mean_percentage_det_int_vec_EWMA_0X_vec_wind_10

figure;
subplot(10,1,1:2);

h1  = errorbar(EWMA_vec,vec_zeros_9,std_percentage_det_int_vec_EWMA_0X_vec_wind_10,'r-','LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([min(EWMA_vec) max(EWMA_vec)]);
ylim([min(std_percentage_det_int_vec_EWMA_0X_vec_wind_10*-1)-2.00 max(std_percentage_det_int_vec_EWMA_0X_vec_wind_10)+2.00 ]);
ylabel('Std Dev','FontSize', 20,'fontweight','bold');
title('Percentage of success', 'FontSize', 22, 'fontweight','bold');

subplot(10,1,3:10);
plot(EWMA_vec, mean_percentage_det_int_vec_EWMA_0X_vec_wind_10,'b-o','LineWidth',4)
xlim([min(EWMA_vec) max(EWMA_vec)]);
ylim([0 max(mean_percentage_det_int_vec_EWMA_0X_vec_wind_10)+1.00]);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
xlabel('α','FontSize', 20,'fontweight','bold');
ylabel('Percentage of success (%)','FontSize', 20,'fontweight','bold');
%legenda1 = 'Bayesian detector';
%legenda2 = 'Ideal detector';
%legenda =legend(legenda1,legenda2,'Location','SouthEast');
%set(legenda,'FontSize',14);


%% Errores variando alpha 0.1 0.2 0.3 .... 0.9

figure;
subplot(18,1,17:18);



h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_01_wind_10,'b-','LineWidth',4);
text(xtext1,ytext1,num2str(mean_error_int_vec_EWMA_01_wind_10,'%.1f'),'FontSize', 20, 'fontweight','bold');
hold on
plot(int_vec_0_100, where_error_int_vec_EWMA_01_wind_10, 'ks', 'MarkerFaceColor', 'r', 'MarkerSize',10, 'LineWidth',2)
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(error_int_vec_EWMA_01_wind_10*-1)-2.00 max(error_int_vec_EWMA_01_wind_10)+2.00 ]);
ylabel('0.1','FontSize', 20,'fontweight','bold');
xlabel('Percentage of interference (%)','FontSize', 20,'fontweight','bold');

subplot(18,1,15:16);

h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_02_wind_10,'b-','LineWidth',4);
text(xtext1,ytext1,num2str(mean_error_int_vec_EWMA_02_wind_10,'%.1f'),'FontSize', 20, 'fontweight','bold');
hold on
plot(int_vec_0_100, where_error_int_vec_EWMA_02_wind_10, 'ks', 'MarkerFaceColor', 'r', 'MarkerSize',10, 'LineWidth',2)
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(error_int_vec_EWMA_02_wind_10*-1)-2.00 max(error_int_vec_EWMA_02_wind_10)+2.00 ]);
ylabel('0.2','FontSize', 20,'fontweight','bold');

subplot(18,1,13:14);

h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_03_wind_10,'b-','LineWidth',4);
text(xtext1,ytext1,num2str(mean_error_int_vec_EWMA_03_wind_10,'%.1f'),'FontSize', 20, 'fontweight','bold');
hold on
plot(int_vec_0_100, where_error_int_vec_EWMA_03_wind_10, 'ks', 'MarkerFaceColor', 'r', 'MarkerSize',10, 'LineWidth',2)
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(error_int_vec_EWMA_03_wind_10*-1)-2.00 max(error_int_vec_EWMA_03_wind_10)+2.00 ]);
ylabel('0.3','FontSize', 20,'fontweight','bold');

subplot(18,1,11:12);

h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_04_wind_10,'b-','LineWidth',4);
text(xtext1,ytext1,num2str(mean_error_int_vec_EWMA_04_wind_10,'%.1f'),'FontSize', 20, 'fontweight','bold');
hold on
plot(int_vec_0_100, where_error_int_vec_EWMA_04_wind_10, 'ks', 'MarkerFaceColor', 'r', 'MarkerSize',10, 'LineWidth',2)
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(error_int_vec_EWMA_04_wind_10*-1)-2.00 max(error_int_vec_EWMA_04_wind_10)+2.00 ]);
ylabel('0.4','FontSize', 20,'fontweight','bold');


subplot(18,1,9:10);

h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_05_wind_10,'b-','LineWidth',4);
text(xtext1,ytext1,num2str(mean_error_int_vec_EWMA_05_wind_10,'%.1f'),'FontSize', 20, 'fontweight','bold');
hold on
plot(int_vec_0_100, where_error_int_vec_EWMA_05_wind_10, 'ks', 'MarkerFaceColor', 'r', 'MarkerSize',10, 'LineWidth',2)
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(error_int_vec_EWMA_05_wind_10*-1)-2.00 max(error_int_vec_EWMA_05_wind_10)+2.00 ]);
ylabel('0.5','FontSize', 20,'fontweight','bold');

subplot(18,1,7:8);

h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_06_wind_10,'b-','LineWidth',4);
text(xtext1,ytext1,num2str(mean_error_int_vec_EWMA_06_wind_10,'%.1f'),'FontSize', 20, 'fontweight','bold');
hold on
plot(int_vec_0_100, where_error_int_vec_EWMA_06_wind_10, 'ks', 'MarkerFaceColor', 'r', 'MarkerSize',10, 'LineWidth',2)
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(error_int_vec_EWMA_06_wind_10*-1)-2.00 max(error_int_vec_EWMA_06_wind_10)+2.00 ]);
ylabel('0.6','FontSize', 20,'fontweight','bold');


subplot(18,1,5:6);

h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_07_wind_10,'b-','LineWidth',4);
text(xtext1,ytext1,num2str(mean_error_int_vec_EWMA_07_wind_10,'%.1f'),'FontSize', 20, 'fontweight','bold');
hold on
plot(int_vec_0_100, where_error_int_vec_EWMA_07_wind_10, 'ks', 'MarkerFaceColor', 'r', 'MarkerSize',10, 'LineWidth',2)
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(error_int_vec_EWMA_07_wind_10*-1)-2.00 max(error_int_vec_EWMA_07_wind_10)+2.00 ]);
ylabel('0.7','FontSize', 20,'fontweight','bold');

subplot(18,1,3:4);

h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_08_wind_10,'b-','LineWidth',4);
text(xtext1,ytext1,num2str(mean_error_int_vec_EWMA_08_wind_10,'%.1f'),'FontSize', 20, 'fontweight','bold');
hold on
plot(int_vec_0_100, where_error_int_vec_EWMA_08_wind_10, 'ks', 'MarkerFaceColor', 'r', 'MarkerSize',10, 'LineWidth',2)
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(error_int_vec_EWMA_08_wind_10*-1)-2.00 max(error_int_vec_EWMA_08_wind_10)+2.00 ]);
ylabel('0.8','FontSize', 20,'fontweight','bold');


subplot(18,1,1:2);

h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_09_wind_10,'b-','LineWidth',4);
text(xtext1,ytext1,num2str(mean_error_int_vec_EWMA_09_wind_10,'%.1f'),'FontSize', 20, 'fontweight','bold');
text(xtext1,ytext2,'avg','FontSize', 20, 'fontweight','bold');
text(xtext2,ytext2,'α','FontSize', 20, 'fontweight','bold');
hold on
plot(int_vec_0_100, where_error_int_vec_EWMA_09_wind_10, 'ks', 'MarkerFaceColor', 'r', 'MarkerSize',10, 'LineWidth',2)
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(error_int_vec_EWMA_09_wind_10*-1)-2.00 max(error_int_vec_EWMA_09_wind_10)+2.00 ]);
ylabel('0.9','FontSize', 20,'fontweight','bold');
title('Error for different α', 'FontSize', 22, 'fontweight','bold');

% figure;
% plot( EWMA_btp_01_100_tx)
% hold on
% plot( EWMA_btp_01_90_tx)
% hold on
% plot( EWMA_btp_01_80_tx)
% hold on
% plot( EWMA_btp_01_70_tx)
% hold on
% plot( EWMA_btp_01_60_tx)
% hold on
% plot( EWMA_btp_01_50_tx)
% hold on
% plot( EWMA_btp_01_40_tx)
% hold on
% plot( EWMA_btp_01_30_tx)
% hold on
% plot( EWMA_btp_01_20_tx)
% hold on
% plot( EWMA_btp_01_10_tx)
% hold on
% plot( EWMA_btp_01_0_tx)
% title('EWMA-btp 01')

% figure;
% plot(x_eje_btp_01, count_EWMA_btp_01_100_tx)
% hold on
% plot(x_eje_btp_01, count_EWMA_btp_01_90_tx)
% hold on
% plot(x_eje_btp_01, count_EWMA_btp_01_80_tx)
% hold on
% plot(x_eje_btp_01, count_EWMA_btp_01_70_tx)
% hold on
% plot(x_eje_btp_01, count_EWMA_btp_01_60_tx)
% hold on
% plot(x_eje_btp_01, count_EWMA_btp_01_50_tx)
% hold on
% plot(x_eje_btp_01, count_EWMA_btp_01_40_tx)
% hold on
% plot(x_eje_btp_01, count_EWMA_btp_01_30_tx)
% hold on
% plot(x_eje_btp_01, count_EWMA_btp_01_20_tx)
% hold on
% plot(x_eje_btp_01, count_EWMA_btp_01_10_tx)
% hold on
% plot(x_eje_btp_01, count_EWMA_btp_01_0_tx)
% title('count-EWMA-btp 01')