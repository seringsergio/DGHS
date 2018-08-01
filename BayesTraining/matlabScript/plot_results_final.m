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

figure;

subplot(10,1,1:2);

h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_01,'r-','LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(error_int_vec_EWMA_01*-1)-2.00 max(error_int_vec_EWMA_01)+2.00 ]);
ylabel('Error','FontSize', 20,'fontweight','bold');
title('Detection of the interference EWMA 0.1', 'FontSize', 22, 'fontweight','bold');

subplot(10,1,3:4);

h1  = errorbar(int_vec_0_100,vec_zeros,std_int_vec_EWMA_01,'k-s','LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(std_int_vec_EWMA_01*-1)-2.00 max(std_int_vec_EWMA_01)+2.00 ]);
ylabel('Std Dev','FontSize', 20,'fontweight','bold');

subplot(10,1,5:10);

plot(int_vec_0_100, mean_int_vec_EWMA_01,'b-o','LineWidth',4)
hold on 
plot(int_vec_0_100, int_vec_0_100,'--','color',dark_green,'LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
xlabel('Percentage of interference (%)','FontSize', 20,'fontweight','bold');
ylabel('Detected interference (%)','FontSize', 20,'fontweight','bold');
legenda1 = 'Bayesian detector';
legenda2 = 'Ideal detector';
legenda =legend(legenda1,legenda2,'Location','SouthEast');
set(legenda,'FontSize',14);

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