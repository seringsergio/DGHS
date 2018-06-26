% Count ppl_100_tx
EWMA_ppl_01_100_tx_range_00_01   = sum( EWMA_ppl_01_100_tx >= range_00 & EWMA_ppl_01_100_tx < range_01 ); 
EWMA_ppl_01_100_tx_range_01_02   = sum( EWMA_ppl_01_100_tx >= range_01 & EWMA_ppl_01_100_tx < range_02 ); 
EWMA_ppl_01_100_tx_range_02_03   = sum( EWMA_ppl_01_100_tx >= range_02 & EWMA_ppl_01_100_tx < range_03 ); 
EWMA_ppl_01_100_tx_range_03_04   = sum( EWMA_ppl_01_100_tx >= range_03 & EWMA_ppl_01_100_tx < range_04 ); 
EWMA_ppl_01_100_tx_range_04_05   = sum( EWMA_ppl_01_100_tx >= range_04 & EWMA_ppl_01_100_tx < range_05 ); 
EWMA_ppl_01_100_tx_range_05_06   = sum( EWMA_ppl_01_100_tx >= range_05 & EWMA_ppl_01_100_tx < range_06 ); 
EWMA_ppl_01_100_tx_range_06_07   = sum( EWMA_ppl_01_100_tx >= range_06 & EWMA_ppl_01_100_tx < range_07 ); 
EWMA_ppl_01_100_tx_range_07_08   = sum( EWMA_ppl_01_100_tx >= range_07 & EWMA_ppl_01_100_tx < range_08 ); 
EWMA_ppl_01_100_tx_range_08_09   = sum( EWMA_ppl_01_100_tx >= range_08 & EWMA_ppl_01_100_tx < range_09 ); 
EWMA_ppl_01_100_tx_range_09_10   = sum( EWMA_ppl_01_100_tx >= range_09 & EWMA_ppl_01_100_tx < range_10 ); 

count_EWMA_ppl_01_100_tx = [EWMA_ppl_01_100_tx_range_00_01;     
                            EWMA_ppl_01_100_tx_range_01_02; 
                            EWMA_ppl_01_100_tx_range_02_03; 
                            EWMA_ppl_01_100_tx_range_03_04; 
                            EWMA_ppl_01_100_tx_range_04_05; 
                            EWMA_ppl_01_100_tx_range_05_06; 
                            EWMA_ppl_01_100_tx_range_06_07; 
                            EWMA_ppl_01_100_tx_range_07_08; 
                            EWMA_ppl_01_100_tx_range_08_09; 
                            EWMA_ppl_01_100_tx_range_09_10];

% Count ppl_95_tx
EWMA_ppl_01_95_tx_range_00_01   = sum( EWMA_ppl_01_95_tx >= range_00 & EWMA_ppl_01_95_tx < range_01 ); 
EWMA_ppl_01_95_tx_range_01_02   = sum( EWMA_ppl_01_95_tx >= range_01 & EWMA_ppl_01_95_tx < range_02 ); 
EWMA_ppl_01_95_tx_range_02_03   = sum( EWMA_ppl_01_95_tx >= range_02 & EWMA_ppl_01_95_tx < range_03 ); 
EWMA_ppl_01_95_tx_range_03_04   = sum( EWMA_ppl_01_95_tx >= range_03 & EWMA_ppl_01_95_tx < range_04 ); 
EWMA_ppl_01_95_tx_range_04_05   = sum( EWMA_ppl_01_95_tx >= range_04 & EWMA_ppl_01_95_tx < range_05 ); 
EWMA_ppl_01_95_tx_range_05_06   = sum( EWMA_ppl_01_95_tx >= range_05 & EWMA_ppl_01_95_tx < range_06 ); 
EWMA_ppl_01_95_tx_range_06_07   = sum( EWMA_ppl_01_95_tx >= range_06 & EWMA_ppl_01_95_tx < range_07 ); 
EWMA_ppl_01_95_tx_range_07_08   = sum( EWMA_ppl_01_95_tx >= range_07 & EWMA_ppl_01_95_tx < range_08 ); 
EWMA_ppl_01_95_tx_range_08_09   = sum( EWMA_ppl_01_95_tx >= range_08 & EWMA_ppl_01_95_tx < range_09 ); 
EWMA_ppl_01_95_tx_range_09_10   = sum( EWMA_ppl_01_95_tx >= range_09 & EWMA_ppl_01_95_tx < range_10 ); 

count_EWMA_ppl_01_95_tx = [ EWMA_ppl_01_95_tx_range_00_01;     
                            EWMA_ppl_01_95_tx_range_01_02; 
                            EWMA_ppl_01_95_tx_range_02_03; 
                            EWMA_ppl_01_95_tx_range_03_04; 
                            EWMA_ppl_01_95_tx_range_04_05; 
                            EWMA_ppl_01_95_tx_range_05_06; 
                            EWMA_ppl_01_95_tx_range_06_07; 
                            EWMA_ppl_01_95_tx_range_07_08; 
                            EWMA_ppl_01_95_tx_range_08_09; 
                            EWMA_ppl_01_95_tx_range_09_10]; 
                        
% Count ppl_90_tx
EWMA_ppl_01_90_tx_range_00_01   = sum( EWMA_ppl_01_90_tx >= range_00 & EWMA_ppl_01_90_tx < range_01 ); 
EWMA_ppl_01_90_tx_range_01_02   = sum( EWMA_ppl_01_90_tx >= range_01 & EWMA_ppl_01_90_tx < range_02 ); 
EWMA_ppl_01_90_tx_range_02_03   = sum( EWMA_ppl_01_90_tx >= range_02 & EWMA_ppl_01_90_tx < range_03 ); 
EWMA_ppl_01_90_tx_range_03_04   = sum( EWMA_ppl_01_90_tx >= range_03 & EWMA_ppl_01_90_tx < range_04 ); 
EWMA_ppl_01_90_tx_range_04_05   = sum( EWMA_ppl_01_90_tx >= range_04 & EWMA_ppl_01_90_tx < range_05 ); 
EWMA_ppl_01_90_tx_range_05_06   = sum( EWMA_ppl_01_90_tx >= range_05 & EWMA_ppl_01_90_tx < range_06 ); 
EWMA_ppl_01_90_tx_range_06_07   = sum( EWMA_ppl_01_90_tx >= range_06 & EWMA_ppl_01_90_tx < range_07 ); 
EWMA_ppl_01_90_tx_range_07_08   = sum( EWMA_ppl_01_90_tx >= range_07 & EWMA_ppl_01_90_tx < range_08 ); 
EWMA_ppl_01_90_tx_range_08_09   = sum( EWMA_ppl_01_90_tx >= range_08 & EWMA_ppl_01_90_tx < range_09 ); 
EWMA_ppl_01_90_tx_range_09_10   = sum( EWMA_ppl_01_90_tx >= range_09 & EWMA_ppl_01_90_tx < range_10 ); 

count_EWMA_ppl_01_90_tx = [ EWMA_ppl_01_90_tx_range_00_01;     
                            EWMA_ppl_01_90_tx_range_01_02; 
                            EWMA_ppl_01_90_tx_range_02_03; 
                            EWMA_ppl_01_90_tx_range_03_04; 
                            EWMA_ppl_01_90_tx_range_04_05; 
                            EWMA_ppl_01_90_tx_range_05_06; 
                            EWMA_ppl_01_90_tx_range_06_07; 
                            EWMA_ppl_01_90_tx_range_07_08; 
                            EWMA_ppl_01_90_tx_range_08_09; 
                            EWMA_ppl_01_90_tx_range_09_10];  
                        
                        
% Count ppl_80_tx
EWMA_ppl_01_80_tx_range_00_01   = sum( EWMA_ppl_01_80_tx >= range_00 & EWMA_ppl_01_80_tx < range_01 ); 
EWMA_ppl_01_80_tx_range_01_02   = sum( EWMA_ppl_01_80_tx >= range_01 & EWMA_ppl_01_80_tx < range_02 ); 
EWMA_ppl_01_80_tx_range_02_03   = sum( EWMA_ppl_01_80_tx >= range_02 & EWMA_ppl_01_80_tx < range_03 ); 
EWMA_ppl_01_80_tx_range_03_04   = sum( EWMA_ppl_01_80_tx >= range_03 & EWMA_ppl_01_80_tx < range_04 ); 
EWMA_ppl_01_80_tx_range_04_05   = sum( EWMA_ppl_01_80_tx >= range_04 & EWMA_ppl_01_80_tx < range_05 ); 
EWMA_ppl_01_80_tx_range_05_06   = sum( EWMA_ppl_01_80_tx >= range_05 & EWMA_ppl_01_80_tx < range_06 ); 
EWMA_ppl_01_80_tx_range_06_07   = sum( EWMA_ppl_01_80_tx >= range_06 & EWMA_ppl_01_80_tx < range_07 ); 
EWMA_ppl_01_80_tx_range_07_08   = sum( EWMA_ppl_01_80_tx >= range_07 & EWMA_ppl_01_80_tx < range_08 ); 
EWMA_ppl_01_80_tx_range_08_09   = sum( EWMA_ppl_01_80_tx >= range_08 & EWMA_ppl_01_80_tx < range_09 ); 
EWMA_ppl_01_80_tx_range_09_10   = sum( EWMA_ppl_01_80_tx >= range_09 & EWMA_ppl_01_80_tx < range_10 ); 

count_EWMA_ppl_01_80_tx = [ EWMA_ppl_01_80_tx_range_00_01;     
                            EWMA_ppl_01_80_tx_range_01_02; 
                            EWMA_ppl_01_80_tx_range_02_03; 
                            EWMA_ppl_01_80_tx_range_03_04; 
                            EWMA_ppl_01_80_tx_range_04_05; 
                            EWMA_ppl_01_80_tx_range_05_06; 
                            EWMA_ppl_01_80_tx_range_06_07; 
                            EWMA_ppl_01_80_tx_range_07_08; 
                            EWMA_ppl_01_80_tx_range_08_09; 
                            EWMA_ppl_01_80_tx_range_09_10];    
                 
% Count ppl_70_tx
EWMA_ppl_01_70_tx_range_00_01   = sum( EWMA_ppl_01_70_tx >= range_00 & EWMA_ppl_01_70_tx < range_01 ); 
EWMA_ppl_01_70_tx_range_01_02   = sum( EWMA_ppl_01_70_tx >= range_01 & EWMA_ppl_01_70_tx < range_02 ); 
EWMA_ppl_01_70_tx_range_02_03   = sum( EWMA_ppl_01_70_tx >= range_02 & EWMA_ppl_01_70_tx < range_03 ); 
EWMA_ppl_01_70_tx_range_03_04   = sum( EWMA_ppl_01_70_tx >= range_03 & EWMA_ppl_01_70_tx < range_04 ); 
EWMA_ppl_01_70_tx_range_04_05   = sum( EWMA_ppl_01_70_tx >= range_04 & EWMA_ppl_01_70_tx < range_05 ); 
EWMA_ppl_01_70_tx_range_05_06   = sum( EWMA_ppl_01_70_tx >= range_05 & EWMA_ppl_01_70_tx < range_06 ); 
EWMA_ppl_01_70_tx_range_06_07   = sum( EWMA_ppl_01_70_tx >= range_06 & EWMA_ppl_01_70_tx < range_07 ); 
EWMA_ppl_01_70_tx_range_07_08   = sum( EWMA_ppl_01_70_tx >= range_07 & EWMA_ppl_01_70_tx < range_08 ); 
EWMA_ppl_01_70_tx_range_08_09   = sum( EWMA_ppl_01_70_tx >= range_08 & EWMA_ppl_01_70_tx < range_09 ); 
EWMA_ppl_01_70_tx_range_09_10   = sum( EWMA_ppl_01_70_tx >= range_09 & EWMA_ppl_01_70_tx < range_10 ); 

count_EWMA_ppl_01_70_tx = [ EWMA_ppl_01_70_tx_range_00_01;     
                            EWMA_ppl_01_70_tx_range_01_02; 
                            EWMA_ppl_01_70_tx_range_02_03; 
                            EWMA_ppl_01_70_tx_range_03_04; 
                            EWMA_ppl_01_70_tx_range_04_05; 
                            EWMA_ppl_01_70_tx_range_05_06; 
                            EWMA_ppl_01_70_tx_range_06_07; 
                            EWMA_ppl_01_70_tx_range_07_08; 
                            EWMA_ppl_01_70_tx_range_08_09; 
                            EWMA_ppl_01_70_tx_range_09_10];                        
                        
% Count ppl_60_tx
EWMA_ppl_01_60_tx_range_00_01   = sum( EWMA_ppl_01_60_tx >= range_00 & EWMA_ppl_01_60_tx < range_01 ); 
EWMA_ppl_01_60_tx_range_01_02   = sum( EWMA_ppl_01_60_tx >= range_01 & EWMA_ppl_01_60_tx < range_02 ); 
EWMA_ppl_01_60_tx_range_02_03   = sum( EWMA_ppl_01_60_tx >= range_02 & EWMA_ppl_01_60_tx < range_03 ); 
EWMA_ppl_01_60_tx_range_03_04   = sum( EWMA_ppl_01_60_tx >= range_03 & EWMA_ppl_01_60_tx < range_04 ); 
EWMA_ppl_01_60_tx_range_04_05   = sum( EWMA_ppl_01_60_tx >= range_04 & EWMA_ppl_01_60_tx < range_05 ); 
EWMA_ppl_01_60_tx_range_05_06   = sum( EWMA_ppl_01_60_tx >= range_05 & EWMA_ppl_01_60_tx < range_06 ); 
EWMA_ppl_01_60_tx_range_06_07   = sum( EWMA_ppl_01_60_tx >= range_06 & EWMA_ppl_01_60_tx < range_07 ); 
EWMA_ppl_01_60_tx_range_07_08   = sum( EWMA_ppl_01_60_tx >= range_07 & EWMA_ppl_01_60_tx < range_08 ); 
EWMA_ppl_01_60_tx_range_08_09   = sum( EWMA_ppl_01_60_tx >= range_08 & EWMA_ppl_01_60_tx < range_09 ); 
EWMA_ppl_01_60_tx_range_09_10   = sum( EWMA_ppl_01_60_tx >= range_09 & EWMA_ppl_01_60_tx < range_10 ); 

count_EWMA_ppl_01_60_tx = [ EWMA_ppl_01_60_tx_range_00_01;     
                            EWMA_ppl_01_60_tx_range_01_02; 
                            EWMA_ppl_01_60_tx_range_02_03; 
                            EWMA_ppl_01_60_tx_range_03_04; 
                            EWMA_ppl_01_60_tx_range_04_05; 
                            EWMA_ppl_01_60_tx_range_05_06; 
                            EWMA_ppl_01_60_tx_range_06_07; 
                            EWMA_ppl_01_60_tx_range_07_08; 
                            EWMA_ppl_01_60_tx_range_08_09; 
                            EWMA_ppl_01_60_tx_range_09_10];
                        
                        
% Count ppl_50_tx
EWMA_ppl_01_50_tx_range_00_01   = sum( EWMA_ppl_01_50_tx >= range_00 & EWMA_ppl_01_50_tx < range_01 ); 
EWMA_ppl_01_50_tx_range_01_02   = sum( EWMA_ppl_01_50_tx >= range_01 & EWMA_ppl_01_50_tx < range_02 ); 
EWMA_ppl_01_50_tx_range_02_03   = sum( EWMA_ppl_01_50_tx >= range_02 & EWMA_ppl_01_50_tx < range_03 ); 
EWMA_ppl_01_50_tx_range_03_04   = sum( EWMA_ppl_01_50_tx >= range_03 & EWMA_ppl_01_50_tx < range_04 ); 
EWMA_ppl_01_50_tx_range_04_05   = sum( EWMA_ppl_01_50_tx >= range_04 & EWMA_ppl_01_50_tx < range_05 ); 
EWMA_ppl_01_50_tx_range_05_06   = sum( EWMA_ppl_01_50_tx >= range_05 & EWMA_ppl_01_50_tx < range_06 ); 
EWMA_ppl_01_50_tx_range_06_07   = sum( EWMA_ppl_01_50_tx >= range_06 & EWMA_ppl_01_50_tx < range_07 ); 
EWMA_ppl_01_50_tx_range_07_08   = sum( EWMA_ppl_01_50_tx >= range_07 & EWMA_ppl_01_50_tx < range_08 ); 
EWMA_ppl_01_50_tx_range_08_09   = sum( EWMA_ppl_01_50_tx >= range_08 & EWMA_ppl_01_50_tx < range_09 ); 
EWMA_ppl_01_50_tx_range_09_10   = sum( EWMA_ppl_01_50_tx >= range_09 & EWMA_ppl_01_50_tx < range_10 ); 

count_EWMA_ppl_01_50_tx = [ EWMA_ppl_01_50_tx_range_00_01;     
                            EWMA_ppl_01_50_tx_range_01_02; 
                            EWMA_ppl_01_50_tx_range_02_03; 
                            EWMA_ppl_01_50_tx_range_03_04; 
                            EWMA_ppl_01_50_tx_range_04_05; 
                            EWMA_ppl_01_50_tx_range_05_06; 
                            EWMA_ppl_01_50_tx_range_06_07; 
                            EWMA_ppl_01_50_tx_range_07_08; 
                            EWMA_ppl_01_50_tx_range_08_09; 
                            EWMA_ppl_01_50_tx_range_09_10];     
                        
                        
% Count ppl_40_tx
EWMA_ppl_01_40_tx_range_00_01   = sum( EWMA_ppl_01_40_tx >= range_00 & EWMA_ppl_01_40_tx < range_01 ); 
EWMA_ppl_01_40_tx_range_01_02   = sum( EWMA_ppl_01_40_tx >= range_01 & EWMA_ppl_01_40_tx < range_02 ); 
EWMA_ppl_01_40_tx_range_02_03   = sum( EWMA_ppl_01_40_tx >= range_02 & EWMA_ppl_01_40_tx < range_03 ); 
EWMA_ppl_01_40_tx_range_03_04   = sum( EWMA_ppl_01_40_tx >= range_03 & EWMA_ppl_01_40_tx < range_04 ); 
EWMA_ppl_01_40_tx_range_04_05   = sum( EWMA_ppl_01_40_tx >= range_04 & EWMA_ppl_01_40_tx < range_05 ); 
EWMA_ppl_01_40_tx_range_05_06   = sum( EWMA_ppl_01_40_tx >= range_05 & EWMA_ppl_01_40_tx < range_06 ); 
EWMA_ppl_01_40_tx_range_06_07   = sum( EWMA_ppl_01_40_tx >= range_06 & EWMA_ppl_01_40_tx < range_07 ); 
EWMA_ppl_01_40_tx_range_07_08   = sum( EWMA_ppl_01_40_tx >= range_07 & EWMA_ppl_01_40_tx < range_08 ); 
EWMA_ppl_01_40_tx_range_08_09   = sum( EWMA_ppl_01_40_tx >= range_08 & EWMA_ppl_01_40_tx < range_09 ); 
EWMA_ppl_01_40_tx_range_09_10   = sum( EWMA_ppl_01_40_tx >= range_09 & EWMA_ppl_01_40_tx < range_10 ); 

count_EWMA_ppl_01_40_tx = [ EWMA_ppl_01_40_tx_range_00_01;     
                            EWMA_ppl_01_40_tx_range_01_02; 
                            EWMA_ppl_01_40_tx_range_02_03; 
                            EWMA_ppl_01_40_tx_range_03_04; 
                            EWMA_ppl_01_40_tx_range_04_05; 
                            EWMA_ppl_01_40_tx_range_05_06; 
                            EWMA_ppl_01_40_tx_range_06_07; 
                            EWMA_ppl_01_40_tx_range_07_08; 
                            EWMA_ppl_01_40_tx_range_08_09; 
                            EWMA_ppl_01_40_tx_range_09_10];  
                        
% Count ppl_30_tx
EWMA_ppl_01_30_tx_range_00_01   = sum( EWMA_ppl_01_30_tx >= range_00 & EWMA_ppl_01_30_tx < range_01 ); 
EWMA_ppl_01_30_tx_range_01_02   = sum( EWMA_ppl_01_30_tx >= range_01 & EWMA_ppl_01_30_tx < range_02 ); 
EWMA_ppl_01_30_tx_range_02_03   = sum( EWMA_ppl_01_30_tx >= range_02 & EWMA_ppl_01_30_tx < range_03 ); 
EWMA_ppl_01_30_tx_range_03_04   = sum( EWMA_ppl_01_30_tx >= range_03 & EWMA_ppl_01_30_tx < range_04 ); 
EWMA_ppl_01_30_tx_range_04_05   = sum( EWMA_ppl_01_30_tx >= range_04 & EWMA_ppl_01_30_tx < range_05 ); 
EWMA_ppl_01_30_tx_range_05_06   = sum( EWMA_ppl_01_30_tx >= range_05 & EWMA_ppl_01_30_tx < range_06 ); 
EWMA_ppl_01_30_tx_range_06_07   = sum( EWMA_ppl_01_30_tx >= range_06 & EWMA_ppl_01_30_tx < range_07 ); 
EWMA_ppl_01_30_tx_range_07_08   = sum( EWMA_ppl_01_30_tx >= range_07 & EWMA_ppl_01_30_tx < range_08 ); 
EWMA_ppl_01_30_tx_range_08_09   = sum( EWMA_ppl_01_30_tx >= range_08 & EWMA_ppl_01_30_tx < range_09 ); 
EWMA_ppl_01_30_tx_range_09_10   = sum( EWMA_ppl_01_30_tx >= range_09 & EWMA_ppl_01_30_tx < range_10 ); 

count_EWMA_ppl_01_30_tx = [ EWMA_ppl_01_30_tx_range_00_01;     
                            EWMA_ppl_01_30_tx_range_01_02; 
                            EWMA_ppl_01_30_tx_range_02_03; 
                            EWMA_ppl_01_30_tx_range_03_04; 
                            EWMA_ppl_01_30_tx_range_04_05; 
                            EWMA_ppl_01_30_tx_range_05_06; 
                            EWMA_ppl_01_30_tx_range_06_07; 
                            EWMA_ppl_01_30_tx_range_07_08; 
                            EWMA_ppl_01_30_tx_range_08_09; 
                            EWMA_ppl_01_30_tx_range_09_10];                        
                        
                        
% Count ppl_20_tx
EWMA_ppl_01_20_tx_range_00_01   = sum( EWMA_ppl_01_20_tx >= range_00 & EWMA_ppl_01_20_tx < range_01 ); 
EWMA_ppl_01_20_tx_range_01_02   = sum( EWMA_ppl_01_20_tx >= range_01 & EWMA_ppl_01_20_tx < range_02 ); 
EWMA_ppl_01_20_tx_range_02_03   = sum( EWMA_ppl_01_20_tx >= range_02 & EWMA_ppl_01_20_tx < range_03 ); 
EWMA_ppl_01_20_tx_range_03_04   = sum( EWMA_ppl_01_20_tx >= range_03 & EWMA_ppl_01_20_tx < range_04 ); 
EWMA_ppl_01_20_tx_range_04_05   = sum( EWMA_ppl_01_20_tx >= range_04 & EWMA_ppl_01_20_tx < range_05 ); 
EWMA_ppl_01_20_tx_range_05_06   = sum( EWMA_ppl_01_20_tx >= range_05 & EWMA_ppl_01_20_tx < range_06 ); 
EWMA_ppl_01_20_tx_range_06_07   = sum( EWMA_ppl_01_20_tx >= range_06 & EWMA_ppl_01_20_tx < range_07 ); 
EWMA_ppl_01_20_tx_range_07_08   = sum( EWMA_ppl_01_20_tx >= range_07 & EWMA_ppl_01_20_tx < range_08 ); 
EWMA_ppl_01_20_tx_range_08_09   = sum( EWMA_ppl_01_20_tx >= range_08 & EWMA_ppl_01_20_tx < range_09 ); 
EWMA_ppl_01_20_tx_range_09_10   = sum( EWMA_ppl_01_20_tx >= range_09 & EWMA_ppl_01_20_tx < range_10 ); 

count_EWMA_ppl_01_20_tx = [ EWMA_ppl_01_20_tx_range_00_01;     
                            EWMA_ppl_01_20_tx_range_01_02; 
                            EWMA_ppl_01_20_tx_range_02_03; 
                            EWMA_ppl_01_20_tx_range_03_04; 
                            EWMA_ppl_01_20_tx_range_04_05; 
                            EWMA_ppl_01_20_tx_range_05_06; 
                            EWMA_ppl_01_20_tx_range_06_07; 
                            EWMA_ppl_01_20_tx_range_07_08; 
                            EWMA_ppl_01_20_tx_range_08_09; 
                            EWMA_ppl_01_20_tx_range_09_10]; 
                        
                        
% Count ppl_10_tx
EWMA_ppl_01_10_tx_range_00_01   = sum( EWMA_ppl_01_10_tx >= range_00 & EWMA_ppl_01_10_tx < range_01 ); 
EWMA_ppl_01_10_tx_range_01_02   = sum( EWMA_ppl_01_10_tx >= range_01 & EWMA_ppl_01_10_tx < range_02 ); 
EWMA_ppl_01_10_tx_range_02_03   = sum( EWMA_ppl_01_10_tx >= range_02 & EWMA_ppl_01_10_tx < range_03 ); 
EWMA_ppl_01_10_tx_range_03_04   = sum( EWMA_ppl_01_10_tx >= range_03 & EWMA_ppl_01_10_tx < range_04 ); 
EWMA_ppl_01_10_tx_range_04_05   = sum( EWMA_ppl_01_10_tx >= range_04 & EWMA_ppl_01_10_tx < range_05 ); 
EWMA_ppl_01_10_tx_range_05_06   = sum( EWMA_ppl_01_10_tx >= range_05 & EWMA_ppl_01_10_tx < range_06 ); 
EWMA_ppl_01_10_tx_range_06_07   = sum( EWMA_ppl_01_10_tx >= range_06 & EWMA_ppl_01_10_tx < range_07 ); 
EWMA_ppl_01_10_tx_range_07_08   = sum( EWMA_ppl_01_10_tx >= range_07 & EWMA_ppl_01_10_tx < range_08 ); 
EWMA_ppl_01_10_tx_range_08_09   = sum( EWMA_ppl_01_10_tx >= range_08 & EWMA_ppl_01_10_tx < range_09 ); 
EWMA_ppl_01_10_tx_range_09_10   = sum( EWMA_ppl_01_10_tx >= range_09 & EWMA_ppl_01_10_tx < range_10 ); 

count_EWMA_ppl_01_10_tx = [ EWMA_ppl_01_10_tx_range_00_01;     
                            EWMA_ppl_01_10_tx_range_01_02; 
                            EWMA_ppl_01_10_tx_range_02_03; 
                            EWMA_ppl_01_10_tx_range_03_04; 
                            EWMA_ppl_01_10_tx_range_04_05; 
                            EWMA_ppl_01_10_tx_range_05_06; 
                            EWMA_ppl_01_10_tx_range_06_07; 
                            EWMA_ppl_01_10_tx_range_07_08; 
                            EWMA_ppl_01_10_tx_range_08_09; 
                            EWMA_ppl_01_10_tx_range_09_10]; 
                        
                        
% Count ppl_0_tx
EWMA_ppl_01_0_tx_range_00_01   = sum( EWMA_ppl_01_0_tx >= range_00 & EWMA_ppl_01_0_tx < range_01 ); 
EWMA_ppl_01_0_tx_range_01_02   = sum( EWMA_ppl_01_0_tx >= range_01 & EWMA_ppl_01_0_tx < range_02 ); 
EWMA_ppl_01_0_tx_range_02_03   = sum( EWMA_ppl_01_0_tx >= range_02 & EWMA_ppl_01_0_tx < range_03 ); 
EWMA_ppl_01_0_tx_range_03_04   = sum( EWMA_ppl_01_0_tx >= range_03 & EWMA_ppl_01_0_tx < range_04 ); 
EWMA_ppl_01_0_tx_range_04_05   = sum( EWMA_ppl_01_0_tx >= range_04 & EWMA_ppl_01_0_tx < range_05 ); 
EWMA_ppl_01_0_tx_range_05_06   = sum( EWMA_ppl_01_0_tx >= range_05 & EWMA_ppl_01_0_tx < range_06 ); 
EWMA_ppl_01_0_tx_range_06_07   = sum( EWMA_ppl_01_0_tx >= range_06 & EWMA_ppl_01_0_tx < range_07 ); 
EWMA_ppl_01_0_tx_range_07_08   = sum( EWMA_ppl_01_0_tx >= range_07 & EWMA_ppl_01_0_tx < range_08 ); 
EWMA_ppl_01_0_tx_range_08_09   = sum( EWMA_ppl_01_0_tx >= range_08 & EWMA_ppl_01_0_tx < range_09 ); 
EWMA_ppl_01_0_tx_range_09_10   = sum( EWMA_ppl_01_0_tx >= range_09 & EWMA_ppl_01_0_tx < range_10 ); 

count_EWMA_ppl_01_0_tx  = [ EWMA_ppl_01_0_tx_range_00_01;     
                            EWMA_ppl_01_0_tx_range_01_02; 
                            EWMA_ppl_01_0_tx_range_02_03; 
                            EWMA_ppl_01_0_tx_range_03_04; 
                            EWMA_ppl_01_0_tx_range_04_05; 
                            EWMA_ppl_01_0_tx_range_05_06; 
                            EWMA_ppl_01_0_tx_range_06_07; 
                            EWMA_ppl_01_0_tx_range_07_08; 
                            EWMA_ppl_01_0_tx_range_08_09; 
                            EWMA_ppl_01_0_tx_range_09_10];                        
                        