
% EWMA _01
figure;
subplot(10,1,1:2);

h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_01_wind_10,'r-','LineWidth',4);
set(gca,'fontsize',24) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(error_int_vec_EWMA_01_wind_10*-1)-2.00 max(error_int_vec_EWMA_01_wind_10)+2.00 ]);
ylabel('Error','FontSize', 28,'fontweight','bold');
title('Estimation of the level of interference', 'FontSize', 30, 'fontweight','bold');

subplot(10,1,3:4);

h1  = errorbar(int_vec_0_100,vec_zeros,std_int_vec_EWMA_01_wind_10,'k-s','LineWidth',4);
set(gca,'fontsize',24) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(std_int_vec_EWMA_01_wind_10*-1)-2.00 max(std_int_vec_EWMA_01_wind_10)+2.00 ]);
ylabel('Std','FontSize', 28,'fontweight','bold');

subplot(10,1,5:10);

plot(int_vec_0_100, mean_int_vec_EWMA_01_wind_10,'b-o','LineWidth',4)
hold on 
plot(int_vec_0_100, int_vec_0_100,'--','color',dark_green,'LineWidth',4);
set(gca,'fontsize',24) % Colocar mas grandes los numeros de los ejes
xlabel('Real level of interference (%)','FontSize', 28,'fontweight','bold');
ylabel('Estimated int. (%)','FontSize', 28,'fontweight','bold');
legenda1 = 'Naive Bayes classifier';
legenda2 = 'Ideal case';
legenda =legend(legenda1,legenda2,'Location','NorthWest');
set(legenda,'FontSize',28);

% % EWMA _02
% figure;
% subplot(10,1,1:2);
% 
% h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_02_wind_10,'r-','LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
% xlim([0 100]);
% ylim([min(error_int_vec_EWMA_02_wind_10*-1)-2.00 max(error_int_vec_EWMA_02_wind_10)+2.00 ]);
% ylabel('Error','FontSize', 20,'fontweight','bold');
% title('Detection of the interference EWMA _02', 'FontSize', 22, 'fontweight','bold');
% 
% subplot(10,1,3:4);
% 
% h1  = errorbar(int_vec_0_100,vec_zeros,std_int_vec_EWMA_02_wind_10,'k-s','LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
% xlim([0 100]);
% ylim([min(std_int_vec_EWMA_02_wind_10*-1)-2.00 max(std_int_vec_EWMA_02_wind_10)+2.00 ]);
% ylabel('Std Dev','FontSize', 20,'fontweight','bold');
% 
% subplot(10,1,5:10);
% 
% plot(int_vec_0_100, mean_int_vec_EWMA_02_wind_10,'b-o','LineWidth',4)
% hold on 
% plot(int_vec_0_100, int_vec_0_100,'--','color',dark_green,'LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% xlabel('Percentage of interference (%)','FontSize', 20,'fontweight','bold');
% ylabel('Detected interference (%)','FontSize', 20,'fontweight','bold');
% legenda1 = 'Bayesian detector';
% legenda2 = 'Ideal detector';
% legenda =legend(legenda1,legenda2,'Location','SouthEast');
% set(legenda,'FontSize',14);
%  
%  
% % EWMA _03
% figure;
% subplot(10,1,1:2);
% 
% h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_03_wind_10,'r-','LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
% xlim([0 100]);
% ylim([min(error_int_vec_EWMA_03_wind_10*-1)-2.00 max(error_int_vec_EWMA_03_wind_10)+2.00 ]);
% ylabel('Error','FontSize', 20,'fontweight','bold');
% title('Detection of the interference EWMA _03', 'FontSize', 22, 'fontweight','bold');
% 
% subplot(10,1,3:4);
% 
% h1  = errorbar(int_vec_0_100,vec_zeros,std_int_vec_EWMA_03_wind_10,'k-s','LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
% xlim([0 100]);
% ylim([min(std_int_vec_EWMA_03_wind_10*-1)-2.00 max(std_int_vec_EWMA_03_wind_10)+2.00 ]);
% ylabel('Std Dev','FontSize', 20,'fontweight','bold');
% 
% subplot(10,1,5:10);
% 
% plot(int_vec_0_100, mean_int_vec_EWMA_03_wind_10,'b-o','LineWidth',4)
% hold on 
% plot(int_vec_0_100, int_vec_0_100,'--','color',dark_green,'LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% xlabel('Percentage of interference (%)','FontSize', 20,'fontweight','bold');
% ylabel('Detected interference (%)','FontSize', 20,'fontweight','bold');
% legenda1 = 'Bayesian detector';
% legenda2 = 'Ideal detector';
% legenda =legend(legenda1,legenda2,'Location','SouthEast');
% set(legenda,'FontSize',14);
% 
% 
% % EWMA _04
% figure;
% subplot(10,1,1:2);
% 
% h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_04_wind_10,'r-','LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
% xlim([0 100]);
% ylim([min(error_int_vec_EWMA_04_wind_10*-1)-2.00 max(error_int_vec_EWMA_04_wind_10)+2.00 ]);
% ylabel('Error','FontSize', 20,'fontweight','bold');
% title('Detection of the interference EWMA _04', 'FontSize', 22, 'fontweight','bold');
% 
% subplot(10,1,3:4);
% 
% h1  = errorbar(int_vec_0_100,vec_zeros,std_int_vec_EWMA_04_wind_10,'k-s','LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
% xlim([0 100]);
% ylim([min(std_int_vec_EWMA_04_wind_10*-1)-2.00 max(std_int_vec_EWMA_04_wind_10)+2.00 ]);
% ylabel('Std Dev','FontSize', 20,'fontweight','bold');
% 
% subplot(10,1,5:10);
% 
% plot(int_vec_0_100, mean_int_vec_EWMA_04_wind_10,'b-o','LineWidth',4)
% hold on 
% plot(int_vec_0_100, int_vec_0_100,'--','color',dark_green,'LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% xlabel('Percentage of interference (%)','FontSize', 20,'fontweight','bold');
% ylabel('Detected interference (%)','FontSize', 20,'fontweight','bold');
% legenda1 = 'Bayesian detector';
% legenda2 = 'Ideal detector';
% legenda =legend(legenda1,legenda2,'Location','SouthEast');
% set(legenda,'FontSize',14);
% 
% % EWMA _05
% figure;
% subplot(10,1,1:2);
% 
% h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_05_wind_10,'r-','LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
% xlim([0 100]);
% ylim([min(error_int_vec_EWMA_05_wind_10*-1)-2.00 max(error_int_vec_EWMA_05_wind_10)+2.00 ]);
% ylabel('Error','FontSize', 20,'fontweight','bold');
% title('Detection of the interference EWMA _05', 'FontSize', 22, 'fontweight','bold');
% 
% subplot(10,1,3:4);
% 
% h1  = errorbar(int_vec_0_100,vec_zeros,std_int_vec_EWMA_05_wind_10,'k-s','LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
% xlim([0 100]);
% ylim([min(std_int_vec_EWMA_05_wind_10*-1)-2.00 max(std_int_vec_EWMA_05_wind_10)+2.00 ]);
% ylabel('Std Dev','FontSize', 20,'fontweight','bold');
% 
% subplot(10,1,5:10);
% 
% plot(int_vec_0_100, mean_int_vec_EWMA_05_wind_10,'b-o','LineWidth',4)
% hold on 
% plot(int_vec_0_100, int_vec_0_100,'--','color',dark_green,'LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% xlabel('Percentage of interference (%)','FontSize', 20,'fontweight','bold');
% ylabel('Detected interference (%)','FontSize', 20,'fontweight','bold');
% legenda1 = 'Bayesian detector';
% legenda2 = 'Ideal detector';
% legenda =legend(legenda1,legenda2,'Location','SouthEast');
% set(legenda,'FontSize',14);
% 
% 
% % EWMA _06
% figure;
% subplot(10,1,1:2);
% 
% h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_06_wind_10,'r-','LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
% xlim([0 100]);
% ylim([min(error_int_vec_EWMA_06_wind_10*-1)-2.00 max(error_int_vec_EWMA_06_wind_10)+2.00 ]);
% ylabel('Error','FontSize', 20,'fontweight','bold');
% title('Detection of the interference EWMA _06', 'FontSize', 22, 'fontweight','bold');
% 
% subplot(10,1,3:4);
% 
% h1  = errorbar(int_vec_0_100,vec_zeros,std_int_vec_EWMA_06_wind_10,'k-s','LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
% xlim([0 100]);
% ylim([min(std_int_vec_EWMA_06_wind_10*-1)-2.00 max(std_int_vec_EWMA_06_wind_10)+2.00 ]);
% ylabel('Std Dev','FontSize', 20,'fontweight','bold');
% 
% subplot(10,1,5:10);
% 
% plot(int_vec_0_100, mean_int_vec_EWMA_06_wind_10,'b-o','LineWidth',4)
% hold on 
% plot(int_vec_0_100, int_vec_0_100,'--','color',dark_green,'LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% xlabel('Percentage of interference (%)','FontSize', 20,'fontweight','bold');
% ylabel('Detected interference (%)','FontSize', 20,'fontweight','bold');
% legenda1 = 'Bayesian detector';
% legenda2 = 'Ideal detector';
% legenda =legend(legenda1,legenda2,'Location','SouthEast');
% set(legenda,'FontSize',14);
% 
% % EWMA _07
% figure;
% subplot(10,1,1:2);
% 
% h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_07_wind_10,'r-','LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
% xlim([0 100]);
% ylim([min(error_int_vec_EWMA_07_wind_10*-1)-2.00 max(error_int_vec_EWMA_07_wind_10)+2.00 ]);
% ylabel('Error','FontSize', 20,'fontweight','bold');
% title('Detection of the interference EWMA _07', 'FontSize', 22, 'fontweight','bold');
% 
% subplot(10,1,3:4);
% 
% h1  = errorbar(int_vec_0_100,vec_zeros,std_int_vec_EWMA_07_wind_10,'k-s','LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
% xlim([0 100]);
% ylim([min(std_int_vec_EWMA_07_wind_10*-1)-2.00 max(std_int_vec_EWMA_07_wind_10)+2.00 ]);
% ylabel('Std Dev','FontSize', 20,'fontweight','bold');
% 
% subplot(10,1,5:10);
% 
% plot(int_vec_0_100, mean_int_vec_EWMA_07_wind_10,'b-o','LineWidth',4)
% hold on 
% plot(int_vec_0_100, int_vec_0_100,'--','color',dark_green,'LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% xlabel('Percentage of interference (%)','FontSize', 20,'fontweight','bold');
% ylabel('Detected interference (%)','FontSize', 20,'fontweight','bold');
% legenda1 = 'Bayesian detector';
% legenda2 = 'Ideal detector';
% legenda =legend(legenda1,legenda2,'Location','SouthEast');
% set(legenda,'FontSize',14);
% 
% 
% % EWMA _08
% figure;
% subplot(10,1,1:2);
% 
% h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_08_wind_10,'r-','LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
% xlim([0 100]);
% ylim([min(error_int_vec_EWMA_08_wind_10*-1)-2.00 max(error_int_vec_EWMA_08_wind_10)+2.00 ]);
% ylabel('Error','FontSize', 20,'fontweight','bold');
% title('Detection of the interference EWMA _08', 'FontSize', 22, 'fontweight','bold');
% 
% subplot(10,1,3:4);
% 
% h1  = errorbar(int_vec_0_100,vec_zeros,std_int_vec_EWMA_08_wind_10,'k-s','LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
% xlim([0 100]);
% ylim([min(std_int_vec_EWMA_08_wind_10*-1)-2.00 max(std_int_vec_EWMA_08_wind_10)+2.00 ]);
% ylabel('Std Dev','FontSize', 20,'fontweight','bold');
% 
% subplot(10,1,5:10);
% 
% plot(int_vec_0_100, mean_int_vec_EWMA_08_wind_10,'b-o','LineWidth',4)
% hold on 
% plot(int_vec_0_100, int_vec_0_100,'--','color',dark_green,'LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% xlabel('Percentage of interference (%)','FontSize', 20,'fontweight','bold');
% ylabel('Detected interference (%)','FontSize', 20,'fontweight','bold');
% legenda1 = 'Bayesian detector';
% legenda2 = 'Ideal detector';
% legenda =legend(legenda1,legenda2,'Location','SouthEast');
% set(legenda,'FontSize',14);
% 
% 
% % EWMA _09
% figure;
% subplot(10,1,1:2);
% 
% h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_09_wind_10,'r-','LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
% xlim([0 100]);
% ylim([min(error_int_vec_EWMA_09_wind_10*-1)-2.00 max(error_int_vec_EWMA_09_wind_10)+2.00 ]);
% ylabel('Error','FontSize', 20,'fontweight','bold');
% title('Detection of the interference EWMA _09', 'FontSize', 22, 'fontweight','bold');
% 
% subplot(10,1,3:4);
% 
% h1  = errorbar(int_vec_0_100,vec_zeros,std_int_vec_EWMA_09_wind_10,'k-s','LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
% xlim([0 100]);
% ylim([min(std_int_vec_EWMA_09_wind_10*-1)-2.00 max(std_int_vec_EWMA_09_wind_10)+2.00 ]);
% ylabel('Std Dev','FontSize', 20,'fontweight','bold');
% 
% subplot(10,1,5:10);
% 
% plot(int_vec_0_100, mean_int_vec_EWMA_09_wind_10,'b-o','LineWidth',4)
% hold on 
% plot(int_vec_0_100, int_vec_0_100,'--','color',dark_green,'LineWidth',4);
% set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
% xlabel('Percentage of interference (%)','FontSize', 20,'fontweight','bold');
% ylabel('Detected interference (%)','FontSize', 20,'fontweight','bold');
% legenda1 = 'Bayesian detector';
% legenda2 = 'Ideal detector';
% legenda =legend(legenda1,legenda2,'Location','SouthEast');
% set(legenda,'FontSize',14);
