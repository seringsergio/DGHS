%% Exponential weighted moving average 

% _100_
[ rows, columns ] = size(EWMA_btp_01_100_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_100_tx(i) =  EWMA_btp_01_100_tx(i);
    else
        EWMA2_btp_01_100_tx(i) = alpha * EWMA_btp_01_100_tx(i) + (1-alpha)*EWMA2_btp_01_100_tx(i-1);        
    end
    
end

EWMA2_mean_btp_01_100_tx = mean(EWMA2_btp_01_100_tx); 
EWMA1_mean_btp_01_100_tx = mean(EWMA_btp_01_100_tx);
EWMA1_std_btp_01_100_tx  = std(EWMA_btp_01_100_tx);


% _95_
[ rows, columns ] = size(EWMA_btp_01_95_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_95_tx(i) =  EWMA_btp_01_95_tx(i);
    else
        EWMA2_btp_01_95_tx(i) = alpha * EWMA_btp_01_95_tx(i) + (1-alpha)*EWMA2_btp_01_95_tx(i-1);        
    end
    
end

EWMA2_mean_btp_01_95_tx = mean(EWMA2_btp_01_95_tx);
EWMA1_mean_btp_01_95_tx = mean(EWMA_btp_01_95_tx);
EWMA1_std_btp_01_95_tx  = std(EWMA_btp_01_95_tx);


% _90_
[ rows, columns ] = size(EWMA_btp_01_90_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_90_tx(i) =  EWMA_btp_01_90_tx(i);
    else
        EWMA2_btp_01_90_tx(i) = alpha * EWMA_btp_01_90_tx(i) + (1-alpha)*EWMA2_btp_01_90_tx(i-1);        
    end
    
end

EWMA2_mean_btp_01_90_tx = mean(EWMA2_btp_01_90_tx); 
EWMA1_mean_btp_01_90_tx = mean(EWMA_btp_01_90_tx);
EWMA1_std_btp_01_90_tx  = std(EWMA_btp_01_90_tx);


% _80_
[ rows, columns ] = size(EWMA_btp_01_80_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_80_tx(i) =  EWMA_btp_01_80_tx(i);
    else
        EWMA2_btp_01_80_tx(i) = alpha * EWMA_btp_01_80_tx(i) + (1-alpha)*EWMA2_btp_01_80_tx(i-1);        
    end
    
end

EWMA2_mean_btp_01_80_tx = mean(EWMA2_btp_01_80_tx); 
EWMA1_mean_btp_01_80_tx = mean(EWMA_btp_01_80_tx);
EWMA1_std_btp_01_80_tx  = std(EWMA_btp_01_80_tx);


% _70_
[ rows, columns ] = size(EWMA_btp_01_70_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_70_tx(i) =  EWMA_btp_01_70_tx(i);
    else
        EWMA2_btp_01_70_tx(i) = alpha * EWMA_btp_01_70_tx(i) + (1-alpha)*EWMA2_btp_01_70_tx(i-1);       
    end
    
end

EWMA2_mean_btp_01_70_tx = mean(EWMA2_btp_01_70_tx);
EWMA1_mean_btp_01_70_tx = mean(EWMA_btp_01_70_tx);
EWMA1_std_btp_01_70_tx  = std(EWMA_btp_01_70_tx);


% _60_
[ rows, columns ] = size(EWMA_btp_01_60_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_60_tx(i) =  EWMA_btp_01_60_tx(i);
    else
        EWMA2_btp_01_60_tx(i) = alpha * EWMA_btp_01_60_tx(i) + (1-alpha)*EWMA2_btp_01_60_tx(i-1);        
    end
    
end

EWMA2_mean_btp_01_60_tx = mean(EWMA2_btp_01_60_tx); 
EWMA1_mean_btp_01_60_tx = mean(EWMA_btp_01_60_tx);
EWMA1_std_btp_01_60_tx  = std(EWMA_btp_01_60_tx);


% _50_
[ rows, columns ] = size(EWMA_btp_01_50_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_50_tx(i) =  EWMA_btp_01_50_tx(i);
    else
        EWMA2_btp_01_50_tx(i) = alpha * EWMA_btp_01_50_tx(i) + (1-alpha)*EWMA2_btp_01_50_tx(i-1);        
    end
    
end

EWMA2_mean_btp_01_50_tx = mean(EWMA2_btp_01_50_tx); 
EWMA1_mean_btp_01_50_tx = mean(EWMA_btp_01_50_tx);
EWMA1_std_btp_01_50_tx  = std(EWMA_btp_01_50_tx);

% _40_
[ rows, columns ] = size(EWMA_btp_01_40_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_40_tx(i) =  EWMA_btp_01_40_tx(i);
    else
        EWMA2_btp_01_40_tx(i) = alpha * EWMA_btp_01_40_tx(i) + (1-alpha)*EWMA2_btp_01_40_tx(i-1);        
    end
    
end

EWMA2_mean_btp_01_40_tx = mean(EWMA2_btp_01_40_tx);
EWMA1_mean_btp_01_40_tx = mean(EWMA_btp_01_40_tx);
EWMA1_std_btp_01_40_tx  = std(EWMA_btp_01_40_tx);

% _30_
[ rows, columns ] = size(EWMA_btp_01_30_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_30_tx(i) =  EWMA_btp_01_30_tx(i);
    else
        EWMA2_btp_01_30_tx(i) = alpha * EWMA_btp_01_30_tx(i) + (1-alpha)*EWMA2_btp_01_30_tx(i-1);        
    end
    
end

EWMA2_mean_btp_01_30_tx = mean(EWMA2_btp_01_30_tx); 
EWMA1_mean_btp_01_30_tx = mean(EWMA_btp_01_30_tx);
EWMA1_std_btp_01_30_tx  = std(EWMA_btp_01_30_tx);

% _20_
[ rows, columns ] = size(EWMA_btp_01_20_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_20_tx(i) =  EWMA_btp_01_20_tx(i);
    else
        EWMA2_btp_01_20_tx(i) = alpha * EWMA_btp_01_20_tx(i) + (1-alpha)*EWMA2_btp_01_20_tx(i-1);        
    end
    
end

EWMA2_mean_btp_01_20_tx = mean(EWMA2_btp_01_20_tx);
EWMA1_mean_btp_01_20_tx = mean(EWMA_btp_01_20_tx);
EWMA1_std_btp_01_20_tx  = std(EWMA_btp_01_20_tx);

% _10_
[ rows, columns ] = size(EWMA_btp_01_10_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_10_tx(i) =  EWMA_btp_01_10_tx(i);
    else
        EWMA2_btp_01_10_tx(i) = alpha * EWMA_btp_01_10_tx(i) + (1-alpha)*EWMA2_btp_01_10_tx(i-1);        
    end
    
end

EWMA2_mean_btp_01_10_tx = mean(EWMA2_btp_01_10_tx); 
EWMA1_mean_btp_01_10_tx = mean(EWMA_btp_01_10_tx);
EWMA1_std_btp_01_10_tx  = std(EWMA_btp_01_10_tx);

% _0_
[ rows, columns ] = size(EWMA_btp_01_0_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_btp_01_0_tx(i) =  EWMA_btp_01_0_tx(i);
    else
        EWMA2_btp_01_0_tx(i) = alpha * EWMA_btp_01_0_tx(i) + (1-alpha)*EWMA2_btp_01_0_tx(i-1);        
    end
    
end

EWMA2_mean_btp_01_0_tx = mean(EWMA2_btp_01_0_tx); 
EWMA1_mean_btp_01_0_tx = mean(EWMA_btp_01_0_tx);
EWMA1_std_btp_01_0_tx  = std(EWMA_btp_01_0_tx);

% consolidado
EWMA2_mean_btp_01_vec = [ EWMA2_mean_btp_01_0_tx
                          EWMA2_mean_btp_01_10_tx
                          EWMA2_mean_btp_01_20_tx
                          EWMA2_mean_btp_01_30_tx
                          EWMA2_mean_btp_01_40_tx
                          EWMA2_mean_btp_01_50_tx
                          EWMA2_mean_btp_01_60_tx
                          EWMA2_mean_btp_01_70_tx
                          EWMA2_mean_btp_01_80_tx
                          EWMA2_mean_btp_01_90_tx
                          EWMA2_mean_btp_01_100_tx
                          ]; 

EWMA1_mean_btp_01_vec = [ EWMA1_mean_btp_01_0_tx
                          EWMA1_mean_btp_01_10_tx
                          EWMA1_mean_btp_01_20_tx
                          EWMA1_mean_btp_01_30_tx
                          EWMA1_mean_btp_01_40_tx
                          EWMA1_mean_btp_01_50_tx
                          EWMA1_mean_btp_01_60_tx
                          EWMA1_mean_btp_01_70_tx
                          EWMA1_mean_btp_01_80_tx
                          EWMA1_mean_btp_01_90_tx
                          EWMA1_mean_btp_01_100_tx
                          ];   
                      
EWMA1_std_btp_01_vec = [  EWMA1_std_btp_01_0_tx
                          EWMA1_std_btp_01_10_tx
                          EWMA1_std_btp_01_20_tx
                          EWMA1_std_btp_01_30_tx
                          EWMA1_std_btp_01_40_tx
                          EWMA1_std_btp_01_50_tx
                          EWMA1_std_btp_01_60_tx
                          EWMA1_std_btp_01_70_tx
                          EWMA1_std_btp_01_80_tx
                          EWMA1_std_btp_01_90_tx
                          EWMA1_std_btp_01_100_tx
                          ];              
                      
%% ppl (Percentage of Packet Loss)

% _100_
[ rows, columns ] = size(EWMA_ppl_01_100_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_100_tx(i) =  EWMA_ppl_01_100_tx(i);
    else
        EWMA2_ppl_01_100_tx(i) = alpha * EWMA_ppl_01_100_tx(i) + (1-alpha)*EWMA2_ppl_01_100_tx(i-1);        
    end
    
end

EWMA2_mean_ppl_01_100_tx = mean(EWMA2_ppl_01_100_tx); 
EWMA1_mean_ppl_01_100_tx = mean(EWMA_ppl_01_100_tx);
EWMA1_std_ppl_01_100_tx  = std(EWMA_ppl_01_100_tx);


% _95_
[ rows, columns ] = size(EWMA_ppl_01_95_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_95_tx(i) =  EWMA_ppl_01_95_tx(i);
    else
        EWMA2_ppl_01_95_tx(i) = alpha * EWMA_ppl_01_95_tx(i) + (1-alpha)*EWMA2_ppl_01_95_tx(i-1);        
    end
    
end

EWMA2_mean_ppl_01_95_tx = mean(EWMA2_ppl_01_95_tx);
EWMA1_mean_ppl_01_95_tx = mean(EWMA_ppl_01_95_tx);
EWMA1_std_ppl_01_95_tx  = std(EWMA_ppl_01_95_tx);


% _90_
[ rows, columns ] = size(EWMA_ppl_01_90_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_90_tx(i) =  EWMA_ppl_01_90_tx(i);
    else
        EWMA2_ppl_01_90_tx(i) = alpha * EWMA_ppl_01_90_tx(i) + (1-alpha)*EWMA2_ppl_01_90_tx(i-1);        
    end
    
end

EWMA2_mean_ppl_01_90_tx = mean(EWMA2_ppl_01_90_tx); 
EWMA1_mean_ppl_01_90_tx = mean(EWMA_ppl_01_90_tx);
EWMA1_std_ppl_01_90_tx  = std(EWMA_ppl_01_90_tx);


% _80_
[ rows, columns ] = size(EWMA_ppl_01_80_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_80_tx(i) =  EWMA_ppl_01_80_tx(i);
    else
        EWMA2_ppl_01_80_tx(i) = alpha * EWMA_ppl_01_80_tx(i) + (1-alpha)*EWMA2_ppl_01_80_tx(i-1);        
    end
    
end

EWMA2_mean_ppl_01_80_tx = mean(EWMA2_ppl_01_80_tx); 
EWMA1_mean_ppl_01_80_tx = mean(EWMA_ppl_01_80_tx);
EWMA1_std_ppl_01_80_tx  = std(EWMA_ppl_01_80_tx);


% _70_
[ rows, columns ] = size(EWMA_ppl_01_70_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_70_tx(i) =  EWMA_ppl_01_70_tx(i);
    else
        EWMA2_ppl_01_70_tx(i) = alpha * EWMA_ppl_01_70_tx(i) + (1-alpha)*EWMA2_ppl_01_70_tx(i-1);       
    end
    
end

EWMA2_mean_ppl_01_70_tx = mean(EWMA2_ppl_01_70_tx);
EWMA1_mean_ppl_01_70_tx = mean(EWMA_ppl_01_70_tx);
EWMA1_std_ppl_01_70_tx  = std(EWMA_ppl_01_70_tx);


% _60_
[ rows, columns ] = size(EWMA_ppl_01_60_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_60_tx(i) =  EWMA_ppl_01_60_tx(i);
    else
        EWMA2_ppl_01_60_tx(i) = alpha * EWMA_ppl_01_60_tx(i) + (1-alpha)*EWMA2_ppl_01_60_tx(i-1);        
    end
    
end

EWMA2_mean_ppl_01_60_tx = mean(EWMA2_ppl_01_60_tx); 
EWMA1_mean_ppl_01_60_tx = mean(EWMA_ppl_01_60_tx);
EWMA1_std_ppl_01_60_tx  = std(EWMA_ppl_01_60_tx);


% _50_
[ rows, columns ] = size(EWMA_ppl_01_50_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_50_tx(i) =  EWMA_ppl_01_50_tx(i);
    else
        EWMA2_ppl_01_50_tx(i) = alpha * EWMA_ppl_01_50_tx(i) + (1-alpha)*EWMA2_ppl_01_50_tx(i-1);        
    end
    
end

EWMA2_mean_ppl_01_50_tx = mean(EWMA2_ppl_01_50_tx); 
EWMA1_mean_ppl_01_50_tx = mean(EWMA_ppl_01_50_tx);
EWMA1_std_ppl_01_50_tx  = std(EWMA_ppl_01_50_tx);

% _40_
[ rows, columns ] = size(EWMA_ppl_01_40_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_40_tx(i) =  EWMA_ppl_01_40_tx(i);
    else
        EWMA2_ppl_01_40_tx(i) = alpha * EWMA_ppl_01_40_tx(i) + (1-alpha)*EWMA2_ppl_01_40_tx(i-1);        
    end
    
end

EWMA2_mean_ppl_01_40_tx = mean(EWMA2_ppl_01_40_tx);
EWMA1_mean_ppl_01_40_tx = mean(EWMA_ppl_01_40_tx);
EWMA1_std_ppl_01_40_tx  = std(EWMA_ppl_01_40_tx);

% _30_
[ rows, columns ] = size(EWMA_ppl_01_30_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_30_tx(i) =  EWMA_ppl_01_30_tx(i);
    else
        EWMA2_ppl_01_30_tx(i) = alpha * EWMA_ppl_01_30_tx(i) + (1-alpha)*EWMA2_ppl_01_30_tx(i-1);        
    end
    
end

EWMA2_mean_ppl_01_30_tx = mean(EWMA2_ppl_01_30_tx); 
EWMA1_mean_ppl_01_30_tx = mean(EWMA_ppl_01_30_tx);
EWMA1_std_ppl_01_30_tx  = std(EWMA_ppl_01_30_tx);

% _20_
[ rows, columns ] = size(EWMA_ppl_01_20_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_20_tx(i) =  EWMA_ppl_01_20_tx(i);
    else
        EWMA2_ppl_01_20_tx(i) = alpha * EWMA_ppl_01_20_tx(i) + (1-alpha)*EWMA2_ppl_01_20_tx(i-1);        
    end
    
end

EWMA2_mean_ppl_01_20_tx = mean(EWMA2_ppl_01_20_tx);
EWMA1_mean_ppl_01_20_tx = mean(EWMA_ppl_01_20_tx);
EWMA1_std_ppl_01_20_tx  = std(EWMA_ppl_01_20_tx);

% _10_
[ rows, columns ] = size(EWMA_ppl_01_10_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_10_tx(i) =  EWMA_ppl_01_10_tx(i);
    else
        EWMA2_ppl_01_10_tx(i) = alpha * EWMA_ppl_01_10_tx(i) + (1-alpha)*EWMA2_ppl_01_10_tx(i-1);        
    end
    
end

EWMA2_mean_ppl_01_10_tx = mean(EWMA2_ppl_01_10_tx); 
EWMA1_mean_ppl_01_10_tx = mean(EWMA_ppl_01_10_tx);
EWMA1_std_ppl_01_10_tx  = std(EWMA_ppl_01_10_tx);

% _0_
[ rows, columns ] = size(EWMA_ppl_01_0_tx);

for i = 1:rows
    
    if(i == 1)
        EWMA2_ppl_01_0_tx(i) =  EWMA_ppl_01_0_tx(i);
    else
        EWMA2_ppl_01_0_tx(i) = alpha * EWMA_ppl_01_0_tx(i) + (1-alpha)*EWMA2_ppl_01_0_tx(i-1);        
    end
    
end

EWMA2_mean_ppl_01_0_tx = mean(EWMA2_ppl_01_0_tx); 
EWMA1_mean_ppl_01_0_tx = mean(EWMA_ppl_01_0_tx);
EWMA1_std_ppl_01_0_tx  = std(EWMA_ppl_01_0_tx);

% consolidado
EWMA2_mean_ppl_01_vec = [ EWMA2_mean_ppl_01_0_tx
                          EWMA2_mean_ppl_01_10_tx
                          EWMA2_mean_ppl_01_20_tx
                          EWMA2_mean_ppl_01_30_tx
                          EWMA2_mean_ppl_01_40_tx
                          EWMA2_mean_ppl_01_50_tx
                          EWMA2_mean_ppl_01_60_tx
                          EWMA2_mean_ppl_01_70_tx
                          EWMA2_mean_ppl_01_80_tx
                          EWMA2_mean_ppl_01_90_tx
                          EWMA2_mean_ppl_01_100_tx
                          ]; 

EWMA1_mean_ppl_01_vec = [ EWMA1_mean_ppl_01_0_tx
                          EWMA1_mean_ppl_01_10_tx
                          EWMA1_mean_ppl_01_20_tx
                          EWMA1_mean_ppl_01_30_tx
                          EWMA1_mean_ppl_01_40_tx
                          EWMA1_mean_ppl_01_50_tx
                          EWMA1_mean_ppl_01_60_tx
                          EWMA1_mean_ppl_01_70_tx
                          EWMA1_mean_ppl_01_80_tx
                          EWMA1_mean_ppl_01_90_tx
                          EWMA1_mean_ppl_01_100_tx
                          ];   
                      
EWMA1_std_ppl_01_vec = [  EWMA1_std_ppl_01_0_tx
                          EWMA1_std_ppl_01_10_tx
                          EWMA1_std_ppl_01_20_tx
                          EWMA1_std_ppl_01_30_tx
                          EWMA1_std_ppl_01_40_tx
                          EWMA1_std_ppl_01_50_tx
                          EWMA1_std_ppl_01_60_tx
                          EWMA1_std_ppl_01_70_tx
                          EWMA1_std_ppl_01_80_tx
                          EWMA1_std_ppl_01_90_tx
                          EWMA1_std_ppl_01_100_tx
                          ];                      