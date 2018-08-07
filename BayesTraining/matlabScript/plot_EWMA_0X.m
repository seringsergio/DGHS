
% EWMA _01
figure;
subplot(10,1,1:2);

h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_01,'r-','LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(error_int_vec_EWMA_01*-1)-2.00 max(error_int_vec_EWMA_01)+2.00 ]);
ylabel('Error','FontSize', 20,'fontweight','bold');
title('Detection of the interference EWMA _01', 'FontSize', 22, 'fontweight','bold');

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

% EWMA _02
figure;
subplot(10,1,1:2);

h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_02,'r-','LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(error_int_vec_EWMA_02*-1)-2.00 max(error_int_vec_EWMA_02)+2.00 ]);
ylabel('Error','FontSize', 20,'fontweight','bold');
title('Detection of the interference EWMA _02', 'FontSize', 22, 'fontweight','bold');

subplot(10,1,3:4);

h1  = errorbar(int_vec_0_100,vec_zeros,std_int_vec_EWMA_02,'k-s','LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(std_int_vec_EWMA_02*-1)-2.00 max(std_int_vec_EWMA_02)+2.00 ]);
ylabel('Std Dev','FontSize', 20,'fontweight','bold');

subplot(10,1,5:10);

plot(int_vec_0_100, mean_int_vec_EWMA_02,'b-o','LineWidth',4)
hold on 
plot(int_vec_0_100, int_vec_0_100,'--','color',dark_green,'LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
xlabel('Percentage of interference (%)','FontSize', 20,'fontweight','bold');
ylabel('Detected interference (%)','FontSize', 20,'fontweight','bold');
legenda1 = 'Bayesian detector';
legenda2 = 'Ideal detector';
legenda =legend(legenda1,legenda2,'Location','SouthEast');
set(legenda,'FontSize',14);
 
 
% EWMA _03
figure;
subplot(10,1,1:2);

h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_03,'r-','LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(error_int_vec_EWMA_03*-1)-2.00 max(error_int_vec_EWMA_03)+2.00 ]);
ylabel('Error','FontSize', 20,'fontweight','bold');
title('Detection of the interference EWMA _03', 'FontSize', 22, 'fontweight','bold');

subplot(10,1,3:4);

h1  = errorbar(int_vec_0_100,vec_zeros,std_int_vec_EWMA_03,'k-s','LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(std_int_vec_EWMA_03*-1)-2.00 max(std_int_vec_EWMA_03)+2.00 ]);
ylabel('Std Dev','FontSize', 20,'fontweight','bold');

subplot(10,1,5:10);

plot(int_vec_0_100, mean_int_vec_EWMA_03,'b-o','LineWidth',4)
hold on 
plot(int_vec_0_100, int_vec_0_100,'--','color',dark_green,'LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
xlabel('Percentage of interference (%)','FontSize', 20,'fontweight','bold');
ylabel('Detected interference (%)','FontSize', 20,'fontweight','bold');
legenda1 = 'Bayesian detector';
legenda2 = 'Ideal detector';
legenda =legend(legenda1,legenda2,'Location','SouthEast');
set(legenda,'FontSize',14);


% EWMA _04
figure;
subplot(10,1,1:2);

h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_04,'r-','LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(error_int_vec_EWMA_04*-1)-2.00 max(error_int_vec_EWMA_04)+2.00 ]);
ylabel('Error','FontSize', 20,'fontweight','bold');
title('Detection of the interference EWMA _04', 'FontSize', 22, 'fontweight','bold');

subplot(10,1,3:4);

h1  = errorbar(int_vec_0_100,vec_zeros,std_int_vec_EWMA_04,'k-s','LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(std_int_vec_EWMA_04*-1)-2.00 max(std_int_vec_EWMA_04)+2.00 ]);
ylabel('Std Dev','FontSize', 20,'fontweight','bold');

subplot(10,1,5:10);

plot(int_vec_0_100, mean_int_vec_EWMA_04,'b-o','LineWidth',4)
hold on 
plot(int_vec_0_100, int_vec_0_100,'--','color',dark_green,'LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
xlabel('Percentage of interference (%)','FontSize', 20,'fontweight','bold');
ylabel('Detected interference (%)','FontSize', 20,'fontweight','bold');
legenda1 = 'Bayesian detector';
legenda2 = 'Ideal detector';
legenda =legend(legenda1,legenda2,'Location','SouthEast');
set(legenda,'FontSize',14);

% EWMA _05
figure;
subplot(10,1,1:2);

h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_05,'r-','LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(error_int_vec_EWMA_05*-1)-2.00 max(error_int_vec_EWMA_05)+2.00 ]);
ylabel('Error','FontSize', 20,'fontweight','bold');
title('Detection of the interference EWMA _05', 'FontSize', 22, 'fontweight','bold');

subplot(10,1,3:4);

h1  = errorbar(int_vec_0_100,vec_zeros,std_int_vec_EWMA_05,'k-s','LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(std_int_vec_EWMA_05*-1)-2.00 max(std_int_vec_EWMA_05)+2.00 ]);
ylabel('Std Dev','FontSize', 20,'fontweight','bold');

subplot(10,1,5:10);

plot(int_vec_0_100, mean_int_vec_EWMA_05,'b-o','LineWidth',4)
hold on 
plot(int_vec_0_100, int_vec_0_100,'--','color',dark_green,'LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
xlabel('Percentage of interference (%)','FontSize', 20,'fontweight','bold');
ylabel('Detected interference (%)','FontSize', 20,'fontweight','bold');
legenda1 = 'Bayesian detector';
legenda2 = 'Ideal detector';
legenda =legend(legenda1,legenda2,'Location','SouthEast');
set(legenda,'FontSize',14);


% EWMA _06
figure;
subplot(10,1,1:2);

h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_06,'r-','LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(error_int_vec_EWMA_06*-1)-2.00 max(error_int_vec_EWMA_06)+2.00 ]);
ylabel('Error','FontSize', 20,'fontweight','bold');
title('Detection of the interference EWMA _06', 'FontSize', 22, 'fontweight','bold');

subplot(10,1,3:4);

h1  = errorbar(int_vec_0_100,vec_zeros,std_int_vec_EWMA_06,'k-s','LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(std_int_vec_EWMA_06*-1)-2.00 max(std_int_vec_EWMA_06)+2.00 ]);
ylabel('Std Dev','FontSize', 20,'fontweight','bold');

subplot(10,1,5:10);

plot(int_vec_0_100, mean_int_vec_EWMA_06,'b-o','LineWidth',4)
hold on 
plot(int_vec_0_100, int_vec_0_100,'--','color',dark_green,'LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
xlabel('Percentage of interference (%)','FontSize', 20,'fontweight','bold');
ylabel('Detected interference (%)','FontSize', 20,'fontweight','bold');
legenda1 = 'Bayesian detector';
legenda2 = 'Ideal detector';
legenda =legend(legenda1,legenda2,'Location','SouthEast');
set(legenda,'FontSize',14);

% EWMA _07
figure;
subplot(10,1,1:2);

h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_07,'r-','LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(error_int_vec_EWMA_07*-1)-2.00 max(error_int_vec_EWMA_07)+2.00 ]);
ylabel('Error','FontSize', 20,'fontweight','bold');
title('Detection of the interference EWMA _07', 'FontSize', 22, 'fontweight','bold');

subplot(10,1,3:4);

h1  = errorbar(int_vec_0_100,vec_zeros,std_int_vec_EWMA_07,'k-s','LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(std_int_vec_EWMA_07*-1)-2.00 max(std_int_vec_EWMA_07)+2.00 ]);
ylabel('Std Dev','FontSize', 20,'fontweight','bold');

subplot(10,1,5:10);

plot(int_vec_0_100, mean_int_vec_EWMA_07,'b-o','LineWidth',4)
hold on 
plot(int_vec_0_100, int_vec_0_100,'--','color',dark_green,'LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
xlabel('Percentage of interference (%)','FontSize', 20,'fontweight','bold');
ylabel('Detected interference (%)','FontSize', 20,'fontweight','bold');
legenda1 = 'Bayesian detector';
legenda2 = 'Ideal detector';
legenda =legend(legenda1,legenda2,'Location','SouthEast');
set(legenda,'FontSize',14);


% EWMA _08
figure;
subplot(10,1,1:2);

h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_08,'r-','LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(error_int_vec_EWMA_08*-1)-2.00 max(error_int_vec_EWMA_08)+2.00 ]);
ylabel('Error','FontSize', 20,'fontweight','bold');
title('Detection of the interference EWMA _08', 'FontSize', 22, 'fontweight','bold');

subplot(10,1,3:4);

h1  = errorbar(int_vec_0_100,vec_zeros,std_int_vec_EWMA_08,'k-s','LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(std_int_vec_EWMA_08*-1)-2.00 max(std_int_vec_EWMA_08)+2.00 ]);
ylabel('Std Dev','FontSize', 20,'fontweight','bold');

subplot(10,1,5:10);

plot(int_vec_0_100, mean_int_vec_EWMA_08,'b-o','LineWidth',4)
hold on 
plot(int_vec_0_100, int_vec_0_100,'--','color',dark_green,'LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
xlabel('Percentage of interference (%)','FontSize', 20,'fontweight','bold');
ylabel('Detected interference (%)','FontSize', 20,'fontweight','bold');
legenda1 = 'Bayesian detector';
legenda2 = 'Ideal detector';
legenda =legend(legenda1,legenda2,'Location','SouthEast');
set(legenda,'FontSize',14);


% EWMA _09
figure;
subplot(10,1,1:2);

h1  = errorbar(int_vec_0_100,vec_zeros,error_int_vec_EWMA_09,'r-','LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(error_int_vec_EWMA_09*-1)-2.00 max(error_int_vec_EWMA_09)+2.00 ]);
ylabel('Error','FontSize', 20,'fontweight','bold');
title('Detection of the interference EWMA _09', 'FontSize', 22, 'fontweight','bold');

subplot(10,1,3:4);

h1  = errorbar(int_vec_0_100,vec_zeros,std_int_vec_EWMA_09,'k-s','LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
set(gca,'XTickLabel',{}) % quitar los numeros en el eje x
xlim([0 100]);
ylim([min(std_int_vec_EWMA_09*-1)-2.00 max(std_int_vec_EWMA_09)+2.00 ]);
ylabel('Std Dev','FontSize', 20,'fontweight','bold');

subplot(10,1,5:10);

plot(int_vec_0_100, mean_int_vec_EWMA_09,'b-o','LineWidth',4)
hold on 
plot(int_vec_0_100, int_vec_0_100,'--','color',dark_green,'LineWidth',4);
set(gca,'fontsize',16) % Colocar mas grandes los numeros de los ejes
xlabel('Percentage of interference (%)','FontSize', 20,'fontweight','bold');
ylabel('Detected interference (%)','FontSize', 20,'fontweight','bold');
legenda1 = 'Bayesian detector';
legenda2 = 'Ideal detector';
legenda =legend(legenda1,legenda2,'Location','SouthEast');
set(legenda,'FontSize',14);
