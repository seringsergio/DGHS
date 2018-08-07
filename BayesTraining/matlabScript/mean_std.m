%% Exponential weighted moving average 

% _100_
[ rows, columns ] = size(EWMA_btp_01_100_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_100_tx_wind_10(i) =  EWMA_btp_01_100_tx_wind_10(i);
    else
        EWMA2_btp_01_100_tx_wind_10(i) = alpha * EWMA_btp_01_100_tx_wind_10(i) + (1-alpha)*EWMA2_btp_01_100_tx_wind_10(i-1);        
    end
    
end

EWMA2_mean_btp_01_100_tx_wind_10 = mean(EWMA2_btp_01_100_tx_wind_10); 
EWMA1_mean_btp_01_100_tx_wind_10 = mean(EWMA_btp_01_100_tx_wind_10);
EWMA1_std_btp_01_100_tx_wind_10  = std(EWMA_btp_01_100_tx_wind_10);


% _95_
[ rows, columns ] = size(EWMA_btp_01_95_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_95_tx_wind_10(i) =  EWMA_btp_01_95_tx_wind_10(i);
    else
        EWMA2_btp_01_95_tx_wind_10(i) = alpha * EWMA_btp_01_95_tx_wind_10(i) + (1-alpha)*EWMA2_btp_01_95_tx_wind_10(i-1);        
    end
    
end

EWMA2_mean_btp_01_95_tx_wind_10 = mean(EWMA2_btp_01_95_tx_wind_10);
EWMA1_mean_btp_01_95_tx_wind_10 = mean(EWMA_btp_01_95_tx_wind_10);
EWMA1_std_btp_01_95_tx_wind_10  = std(EWMA_btp_01_95_tx_wind_10);


% _90_
[ rows, columns ] = size(EWMA_btp_01_90_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_90_tx_wind_10(i) =  EWMA_btp_01_90_tx_wind_10(i);
    else
        EWMA2_btp_01_90_tx_wind_10(i) = alpha * EWMA_btp_01_90_tx_wind_10(i) + (1-alpha)*EWMA2_btp_01_90_tx_wind_10(i-1);        
    end
    
end

EWMA2_mean_btp_01_90_tx_wind_10 = mean(EWMA2_btp_01_90_tx_wind_10); 
EWMA1_mean_btp_01_90_tx_wind_10 = mean(EWMA_btp_01_90_tx_wind_10);
EWMA1_std_btp_01_90_tx_wind_10  = std(EWMA_btp_01_90_tx_wind_10);


% _80_
[ rows, columns ] = size(EWMA_btp_01_80_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_80_tx_wind_10(i) =  EWMA_btp_01_80_tx_wind_10(i);
    else
        EWMA2_btp_01_80_tx_wind_10(i) = alpha * EWMA_btp_01_80_tx_wind_10(i) + (1-alpha)*EWMA2_btp_01_80_tx_wind_10(i-1);        
    end
    
end

EWMA2_mean_btp_01_80_tx_wind_10 = mean(EWMA2_btp_01_80_tx_wind_10); 
EWMA1_mean_btp_01_80_tx_wind_10 = mean(EWMA_btp_01_80_tx_wind_10);
EWMA1_std_btp_01_80_tx_wind_10  = std(EWMA_btp_01_80_tx_wind_10);


% _70_
[ rows, columns ] = size(EWMA_btp_01_70_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_70_tx_wind_10(i) =  EWMA_btp_01_70_tx_wind_10(i);
    else
        EWMA2_btp_01_70_tx_wind_10(i) = alpha * EWMA_btp_01_70_tx_wind_10(i) + (1-alpha)*EWMA2_btp_01_70_tx_wind_10(i-1);       
    end
    
end

EWMA2_mean_btp_01_70_tx_wind_10 = mean(EWMA2_btp_01_70_tx_wind_10);
EWMA1_mean_btp_01_70_tx_wind_10 = mean(EWMA_btp_01_70_tx_wind_10);
EWMA1_std_btp_01_70_tx_wind_10  = std(EWMA_btp_01_70_tx_wind_10);


% _60_
[ rows, columns ] = size(EWMA_btp_01_60_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_60_tx_wind_10(i) =  EWMA_btp_01_60_tx_wind_10(i);
    else
        EWMA2_btp_01_60_tx_wind_10(i) = alpha * EWMA_btp_01_60_tx_wind_10(i) + (1-alpha)*EWMA2_btp_01_60_tx_wind_10(i-1);        
    end
    
end

EWMA2_mean_btp_01_60_tx_wind_10 = mean(EWMA2_btp_01_60_tx_wind_10); 
EWMA1_mean_btp_01_60_tx_wind_10 = mean(EWMA_btp_01_60_tx_wind_10);
EWMA1_std_btp_01_60_tx_wind_10  = std(EWMA_btp_01_60_tx_wind_10);


% _50_
[ rows, columns ] = size(EWMA_btp_01_50_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_50_tx_wind_10(i) =  EWMA_btp_01_50_tx_wind_10(i);
    else
        EWMA2_btp_01_50_tx_wind_10(i) = alpha * EWMA_btp_01_50_tx_wind_10(i) + (1-alpha)*EWMA2_btp_01_50_tx_wind_10(i-1);        
    end
    
end

EWMA2_mean_btp_01_50_tx_wind_10 = mean(EWMA2_btp_01_50_tx_wind_10); 
EWMA1_mean_btp_01_50_tx_wind_10 = mean(EWMA_btp_01_50_tx_wind_10);
EWMA1_std_btp_01_50_tx_wind_10  = std(EWMA_btp_01_50_tx_wind_10);

% _40_
[ rows, columns ] = size(EWMA_btp_01_40_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_40_tx_wind_10(i) =  EWMA_btp_01_40_tx_wind_10(i);
    else
        EWMA2_btp_01_40_tx_wind_10(i) = alpha * EWMA_btp_01_40_tx_wind_10(i) + (1-alpha)*EWMA2_btp_01_40_tx_wind_10(i-1);        
    end
    
end

EWMA2_mean_btp_01_40_tx_wind_10 = mean(EWMA2_btp_01_40_tx_wind_10);
EWMA1_mean_btp_01_40_tx_wind_10 = mean(EWMA_btp_01_40_tx_wind_10);
EWMA1_std_btp_01_40_tx_wind_10  = std(EWMA_btp_01_40_tx_wind_10);

% _30_
[ rows, columns ] = size(EWMA_btp_01_30_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_30_tx_wind_10(i) =  EWMA_btp_01_30_tx_wind_10(i);
    else
        EWMA2_btp_01_30_tx_wind_10(i) = alpha * EWMA_btp_01_30_tx_wind_10(i) + (1-alpha)*EWMA2_btp_01_30_tx_wind_10(i-1);        
    end
    
end

EWMA2_mean_btp_01_30_tx_wind_10 = mean(EWMA2_btp_01_30_tx_wind_10); 
EWMA1_mean_btp_01_30_tx_wind_10 = mean(EWMA_btp_01_30_tx_wind_10);
EWMA1_std_btp_01_30_tx_wind_10  = std(EWMA_btp_01_30_tx_wind_10);

% _20_
[ rows, columns ] = size(EWMA_btp_01_20_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_20_tx_wind_10(i) =  EWMA_btp_01_20_tx_wind_10(i);
    else
        EWMA2_btp_01_20_tx_wind_10(i) = alpha * EWMA_btp_01_20_tx_wind_10(i) + (1-alpha)*EWMA2_btp_01_20_tx_wind_10(i-1);        
    end
    
end

EWMA2_mean_btp_01_20_tx_wind_10 = mean(EWMA2_btp_01_20_tx_wind_10);
EWMA1_mean_btp_01_20_tx_wind_10 = mean(EWMA_btp_01_20_tx_wind_10);
EWMA1_std_btp_01_20_tx_wind_10  = std(EWMA_btp_01_20_tx_wind_10);

% _10_
[ rows, columns ] = size(EWMA_btp_01_10_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_10_tx_wind_10(i) =  EWMA_btp_01_10_tx_wind_10(i);
    else
        EWMA2_btp_01_10_tx_wind_10(i) = alpha * EWMA_btp_01_10_tx_wind_10(i) + (1-alpha)*EWMA2_btp_01_10_tx_wind_10(i-1);        
    end
    
end

EWMA2_mean_btp_01_10_tx_wind_10 = mean(EWMA2_btp_01_10_tx_wind_10); 
EWMA1_mean_btp_01_10_tx_wind_10 = mean(EWMA_btp_01_10_tx_wind_10);
EWMA1_std_btp_01_10_tx_wind_10  = std(EWMA_btp_01_10_tx_wind_10);

% _0_
[ rows, columns ] = size(EWMA_btp_01_0_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_0_tx_wind_10(i) =  EWMA_btp_01_0_tx_wind_10(i);
    else
        EWMA2_btp_01_0_tx_wind_10(i) = alpha * EWMA_btp_01_0_tx_wind_10(i) + (1-alpha)*EWMA2_btp_01_0_tx_wind_10(i-1);        
    end
    
end

EWMA2_mean_btp_01_0_tx_wind_10 = mean(EWMA2_btp_01_0_tx_wind_10); 
EWMA1_mean_btp_01_0_tx_wind_10 = mean(EWMA_btp_01_0_tx_wind_10);
EWMA1_std_btp_01_0_tx_wind_10  = std(EWMA_btp_01_0_tx_wind_10);

% consolidado
EWMA2_mean_btp_01_vec = [ EWMA2_mean_btp_01_0_tx_wind_10
                          EWMA2_mean_btp_01_10_tx_wind_10
                          EWMA2_mean_btp_01_20_tx_wind_10
                          EWMA2_mean_btp_01_30_tx_wind_10
                          EWMA2_mean_btp_01_40_tx_wind_10
                          EWMA2_mean_btp_01_50_tx_wind_10
                          EWMA2_mean_btp_01_60_tx_wind_10
                          EWMA2_mean_btp_01_70_tx_wind_10
                          EWMA2_mean_btp_01_80_tx_wind_10
                          EWMA2_mean_btp_01_90_tx_wind_10
                          EWMA2_mean_btp_01_100_tx_wind_10
                          ]; 

EWMA1_mean_btp_01_vec = [ EWMA1_mean_btp_01_0_tx_wind_10
                          EWMA1_mean_btp_01_10_tx_wind_10
                          EWMA1_mean_btp_01_20_tx_wind_10
                          EWMA1_mean_btp_01_30_tx_wind_10
                          EWMA1_mean_btp_01_40_tx_wind_10
                          EWMA1_mean_btp_01_50_tx_wind_10
                          EWMA1_mean_btp_01_60_tx_wind_10
                          EWMA1_mean_btp_01_70_tx_wind_10
                          EWMA1_mean_btp_01_80_tx_wind_10
                          EWMA1_mean_btp_01_90_tx_wind_10
                          EWMA1_mean_btp_01_100_tx_wind_10
                          ];   
                      
EWMA1_std_btp_01_vec = [  EWMA1_std_btp_01_0_tx_wind_10
                          EWMA1_std_btp_01_10_tx_wind_10
                          EWMA1_std_btp_01_20_tx_wind_10
                          EWMA1_std_btp_01_30_tx_wind_10
                          EWMA1_std_btp_01_40_tx_wind_10
                          EWMA1_std_btp_01_50_tx_wind_10
                          EWMA1_std_btp_01_60_tx_wind_10
                          EWMA1_std_btp_01_70_tx_wind_10
                          EWMA1_std_btp_01_80_tx_wind_10
                          EWMA1_std_btp_01_90_tx_wind_10
                          EWMA1_std_btp_01_100_tx_wind_10
                          ];              
                      
%% ppl (Percentage of Packet Loss)

% _100_
[ rows, columns ] = size(EWMA_ppl_01_100_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_100_tx_wind_10(i) =  EWMA_ppl_01_100_tx_wind_10(i);
    else
        EWMA2_ppl_01_100_tx_wind_10(i) = alpha * EWMA_ppl_01_100_tx_wind_10(i) + (1-alpha)*EWMA2_ppl_01_100_tx_wind_10(i-1);        
    end
    
end

EWMA2_mean_ppl_01_100_tx_wind_10 = mean(EWMA2_ppl_01_100_tx_wind_10); 
EWMA1_mean_ppl_01_100_tx_wind_10 = mean(EWMA_ppl_01_100_tx_wind_10);
EWMA1_std_ppl_01_100_tx_wind_10  = std(EWMA_ppl_01_100_tx_wind_10);


% _95_
[ rows, columns ] = size(EWMA_ppl_01_95_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_95_tx_wind_10(i) =  EWMA_ppl_01_95_tx_wind_10(i);
    else
        EWMA2_ppl_01_95_tx_wind_10(i) = alpha * EWMA_ppl_01_95_tx_wind_10(i) + (1-alpha)*EWMA2_ppl_01_95_tx_wind_10(i-1);        
    end
    
end

EWMA2_mean_ppl_01_95_tx_wind_10 = mean(EWMA2_ppl_01_95_tx_wind_10);
EWMA1_mean_ppl_01_95_tx_wind_10 = mean(EWMA_ppl_01_95_tx_wind_10);
EWMA1_std_ppl_01_95_tx_wind_10  = std(EWMA_ppl_01_95_tx_wind_10);


% _90_
[ rows, columns ] = size(EWMA_ppl_01_90_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_90_tx_wind_10(i) =  EWMA_ppl_01_90_tx_wind_10(i);
    else
        EWMA2_ppl_01_90_tx_wind_10(i) = alpha * EWMA_ppl_01_90_tx_wind_10(i) + (1-alpha)*EWMA2_ppl_01_90_tx_wind_10(i-1);        
    end
    
end

EWMA2_mean_ppl_01_90_tx_wind_10 = mean(EWMA2_ppl_01_90_tx_wind_10); 
EWMA1_mean_ppl_01_90_tx_wind_10 = mean(EWMA_ppl_01_90_tx_wind_10);
EWMA1_std_ppl_01_90_tx_wind_10  = std(EWMA_ppl_01_90_tx_wind_10);


% _80_
[ rows, columns ] = size(EWMA_ppl_01_80_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_80_tx_wind_10(i) =  EWMA_ppl_01_80_tx_wind_10(i);
    else
        EWMA2_ppl_01_80_tx_wind_10(i) = alpha * EWMA_ppl_01_80_tx_wind_10(i) + (1-alpha)*EWMA2_ppl_01_80_tx_wind_10(i-1);        
    end
    
end

EWMA2_mean_ppl_01_80_tx_wind_10 = mean(EWMA2_ppl_01_80_tx_wind_10); 
EWMA1_mean_ppl_01_80_tx_wind_10 = mean(EWMA_ppl_01_80_tx_wind_10);
EWMA1_std_ppl_01_80_tx_wind_10  = std(EWMA_ppl_01_80_tx_wind_10);


% _70_
[ rows, columns ] = size(EWMA_ppl_01_70_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_70_tx_wind_10(i) =  EWMA_ppl_01_70_tx_wind_10(i);
    else
        EWMA2_ppl_01_70_tx_wind_10(i) = alpha * EWMA_ppl_01_70_tx_wind_10(i) + (1-alpha)*EWMA2_ppl_01_70_tx_wind_10(i-1);       
    end
    
end

EWMA2_mean_ppl_01_70_tx_wind_10 = mean(EWMA2_ppl_01_70_tx_wind_10);
EWMA1_mean_ppl_01_70_tx_wind_10 = mean(EWMA_ppl_01_70_tx_wind_10);
EWMA1_std_ppl_01_70_tx_wind_10  = std(EWMA_ppl_01_70_tx_wind_10);


% _60_
[ rows, columns ] = size(EWMA_ppl_01_60_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_60_tx_wind_10(i) =  EWMA_ppl_01_60_tx_wind_10(i);
    else
        EWMA2_ppl_01_60_tx_wind_10(i) = alpha * EWMA_ppl_01_60_tx_wind_10(i) + (1-alpha)*EWMA2_ppl_01_60_tx_wind_10(i-1);        
    end
    
end

EWMA2_mean_ppl_01_60_tx_wind_10 = mean(EWMA2_ppl_01_60_tx_wind_10); 
EWMA1_mean_ppl_01_60_tx_wind_10 = mean(EWMA_ppl_01_60_tx_wind_10);
EWMA1_std_ppl_01_60_tx_wind_10  = std(EWMA_ppl_01_60_tx_wind_10);


% _50_
[ rows, columns ] = size(EWMA_ppl_01_50_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_50_tx_wind_10(i) =  EWMA_ppl_01_50_tx_wind_10(i);
    else
        EWMA2_ppl_01_50_tx_wind_10(i) = alpha * EWMA_ppl_01_50_tx_wind_10(i) + (1-alpha)*EWMA2_ppl_01_50_tx_wind_10(i-1);        
    end
    
end

EWMA2_mean_ppl_01_50_tx_wind_10 = mean(EWMA2_ppl_01_50_tx_wind_10); 
EWMA1_mean_ppl_01_50_tx_wind_10 = mean(EWMA_ppl_01_50_tx_wind_10);
EWMA1_std_ppl_01_50_tx_wind_10  = std(EWMA_ppl_01_50_tx_wind_10);

% _40_
[ rows, columns ] = size(EWMA_ppl_01_40_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_40_tx_wind_10(i) =  EWMA_ppl_01_40_tx_wind_10(i);
    else
        EWMA2_ppl_01_40_tx_wind_10(i) = alpha * EWMA_ppl_01_40_tx_wind_10(i) + (1-alpha)*EWMA2_ppl_01_40_tx_wind_10(i-1);        
    end
    
end

EWMA2_mean_ppl_01_40_tx_wind_10 = mean(EWMA2_ppl_01_40_tx_wind_10);
EWMA1_mean_ppl_01_40_tx_wind_10 = mean(EWMA_ppl_01_40_tx_wind_10);
EWMA1_std_ppl_01_40_tx_wind_10  = std(EWMA_ppl_01_40_tx_wind_10);

% _30_
[ rows, columns ] = size(EWMA_ppl_01_30_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_30_tx_wind_10(i) =  EWMA_ppl_01_30_tx_wind_10(i);
    else
        EWMA2_ppl_01_30_tx_wind_10(i) = alpha * EWMA_ppl_01_30_tx_wind_10(i) + (1-alpha)*EWMA2_ppl_01_30_tx_wind_10(i-1);        
    end
    
end

EWMA2_mean_ppl_01_30_tx_wind_10 = mean(EWMA2_ppl_01_30_tx_wind_10); 
EWMA1_mean_ppl_01_30_tx_wind_10 = mean(EWMA_ppl_01_30_tx_wind_10);
EWMA1_std_ppl_01_30_tx_wind_10  = std(EWMA_ppl_01_30_tx_wind_10);

% _20_
[ rows, columns ] = size(EWMA_ppl_01_20_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_20_tx_wind_10(i) =  EWMA_ppl_01_20_tx_wind_10(i);
    else
        EWMA2_ppl_01_20_tx_wind_10(i) = alpha * EWMA_ppl_01_20_tx_wind_10(i) + (1-alpha)*EWMA2_ppl_01_20_tx_wind_10(i-1);        
    end
    
end

EWMA2_mean_ppl_01_20_tx_wind_10 = mean(EWMA2_ppl_01_20_tx_wind_10);
EWMA1_mean_ppl_01_20_tx_wind_10 = mean(EWMA_ppl_01_20_tx_wind_10);
EWMA1_std_ppl_01_20_tx_wind_10  = std(EWMA_ppl_01_20_tx_wind_10);

% _10_
[ rows, columns ] = size(EWMA_ppl_01_10_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_10_tx_wind_10(i) =  EWMA_ppl_01_10_tx_wind_10(i);
    else
        EWMA2_ppl_01_10_tx_wind_10(i) = alpha * EWMA_ppl_01_10_tx_wind_10(i) + (1-alpha)*EWMA2_ppl_01_10_tx_wind_10(i-1);        
    end
    
end

EWMA2_mean_ppl_01_10_tx_wind_10 = mean(EWMA2_ppl_01_10_tx_wind_10); 
EWMA1_mean_ppl_01_10_tx_wind_10 = mean(EWMA_ppl_01_10_tx_wind_10);
EWMA1_std_ppl_01_10_tx_wind_10  = std(EWMA_ppl_01_10_tx_wind_10);

% _0_
[ rows, columns ] = size(EWMA_ppl_01_0_tx_wind_10);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_0_tx_wind_10(i) =  EWMA_ppl_01_0_tx_wind_10(i);
    else
        EWMA2_ppl_01_0_tx_wind_10(i) = alpha * EWMA_ppl_01_0_tx_wind_10(i) + (1-alpha)*EWMA2_ppl_01_0_tx_wind_10(i-1);        
    end
    
end

EWMA2_mean_ppl_01_0_tx_wind_10 = mean(EWMA2_ppl_01_0_tx_wind_10); 
EWMA1_mean_ppl_01_0_tx_wind_10 = mean(EWMA_ppl_01_0_tx_wind_10);
EWMA1_std_ppl_01_0_tx_wind_10  = std(EWMA_ppl_01_0_tx_wind_10);

% consolidado
EWMA2_mean_ppl_01_vec = [ EWMA2_mean_ppl_01_0_tx_wind_10
                          EWMA2_mean_ppl_01_10_tx_wind_10
                          EWMA2_mean_ppl_01_20_tx_wind_10
                          EWMA2_mean_ppl_01_30_tx_wind_10
                          EWMA2_mean_ppl_01_40_tx_wind_10
                          EWMA2_mean_ppl_01_50_tx_wind_10
                          EWMA2_mean_ppl_01_60_tx_wind_10
                          EWMA2_mean_ppl_01_70_tx_wind_10
                          EWMA2_mean_ppl_01_80_tx_wind_10
                          EWMA2_mean_ppl_01_90_tx_wind_10
                          EWMA2_mean_ppl_01_100_tx_wind_10
                          ]; 

EWMA1_mean_ppl_01_vec = [ EWMA1_mean_ppl_01_0_tx_wind_10
                          EWMA1_mean_ppl_01_10_tx_wind_10
                          EWMA1_mean_ppl_01_20_tx_wind_10
                          EWMA1_mean_ppl_01_30_tx_wind_10
                          EWMA1_mean_ppl_01_40_tx_wind_10
                          EWMA1_mean_ppl_01_50_tx_wind_10
                          EWMA1_mean_ppl_01_60_tx_wind_10
                          EWMA1_mean_ppl_01_70_tx_wind_10
                          EWMA1_mean_ppl_01_80_tx_wind_10
                          EWMA1_mean_ppl_01_90_tx_wind_10
                          EWMA1_mean_ppl_01_100_tx_wind_10
                          ];   
                      
EWMA1_std_ppl_01_vec = [  EWMA1_std_ppl_01_0_tx_wind_10
                          EWMA1_std_ppl_01_10_tx_wind_10
                          EWMA1_std_ppl_01_20_tx_wind_10
                          EWMA1_std_ppl_01_30_tx_wind_10
                          EWMA1_std_ppl_01_40_tx_wind_10
                          EWMA1_std_ppl_01_50_tx_wind_10
                          EWMA1_std_ppl_01_60_tx_wind_10
                          EWMA1_std_ppl_01_70_tx_wind_10
                          EWMA1_std_ppl_01_80_tx_wind_10
                          EWMA1_std_ppl_01_90_tx_wind_10
                          EWMA1_std_ppl_01_100_tx_wind_10
                          ];                      