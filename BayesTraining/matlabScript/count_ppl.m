% Count ppl_100_tx
ppl_100_tx_range_00_01   = sum( ppl_100_tx >= range_00 & ppl_100_tx < range_01 ); 
ppl_100_tx_range_01_02   = sum( ppl_100_tx >= range_01 & ppl_100_tx < range_02 ); 
ppl_100_tx_range_02_03   = sum( ppl_100_tx >= range_02 & ppl_100_tx < range_03 ); 
ppl_100_tx_range_03_04   = sum( ppl_100_tx >= range_03 & ppl_100_tx < range_04 ); 
ppl_100_tx_range_04_05   = sum( ppl_100_tx >= range_04 & ppl_100_tx < range_05 ); 
ppl_100_tx_range_05_06   = sum( ppl_100_tx >= range_05 & ppl_100_tx < range_06 ); 
ppl_100_tx_range_06_07   = sum( ppl_100_tx >= range_06 & ppl_100_tx < range_07 ); 
ppl_100_tx_range_07_08   = sum( ppl_100_tx >= range_07 & ppl_100_tx < range_08 ); 
ppl_100_tx_range_08_09   = sum( ppl_100_tx >= range_08 & ppl_100_tx < range_09 ); 
ppl_100_tx_range_09_10   = sum( ppl_100_tx >= range_09 & ppl_100_tx < range_10 ); 


count_ppl_100_tx =[ ppl_100_tx_range_00_01;     
                    ppl_100_tx_range_01_02; 
                    ppl_100_tx_range_02_03; 
                    ppl_100_tx_range_03_04; 
                    ppl_100_tx_range_04_05; 
                    ppl_100_tx_range_05_06; 
                    ppl_100_tx_range_06_07; 
                    ppl_100_tx_range_07_08; 
                    ppl_100_tx_range_08_09; 
                    ppl_100_tx_range_09_10]; 

% Count ppl_95_tx
ppl_95_tx_range_00_01   = sum( ppl_95_tx >= range_00 & ppl_95_tx < range_01 ); 
ppl_95_tx_range_01_02   = sum( ppl_95_tx >= range_01 & ppl_95_tx < range_02 ); 
ppl_95_tx_range_02_03   = sum( ppl_95_tx >= range_02 & ppl_95_tx < range_03 ); 
ppl_95_tx_range_03_04   = sum( ppl_95_tx >= range_03 & ppl_95_tx < range_04 ); 
ppl_95_tx_range_04_05   = sum( ppl_95_tx >= range_04 & ppl_95_tx < range_05 ); 
ppl_95_tx_range_05_06   = sum( ppl_95_tx >= range_05 & ppl_95_tx < range_06 ); 
ppl_95_tx_range_06_07   = sum( ppl_95_tx >= range_06 & ppl_95_tx < range_07 ); 
ppl_95_tx_range_07_08   = sum( ppl_95_tx >= range_07 & ppl_95_tx < range_08 ); 
ppl_95_tx_range_08_09   = sum( ppl_95_tx >= range_08 & ppl_95_tx < range_09 ); 
ppl_95_tx_range_09_10   = sum( ppl_95_tx >= range_09 & ppl_95_tx < range_10 ); 


count_ppl_95_tx = [ ppl_95_tx_range_00_01;     
                    ppl_95_tx_range_01_02; 
                    ppl_95_tx_range_02_03; 
                    ppl_95_tx_range_03_04; 
                    ppl_95_tx_range_04_05; 
                    ppl_95_tx_range_05_06; 
                    ppl_95_tx_range_06_07; 
                    ppl_95_tx_range_07_08; 
                    ppl_95_tx_range_08_09; 
                    ppl_95_tx_range_09_10]; 

                
% Count ppl_90_tx
ppl_90_tx_range_00_01   = sum( ppl_90_tx >= range_00 & ppl_90_tx < range_01 ); 
ppl_90_tx_range_01_02   = sum( ppl_90_tx >= range_01 & ppl_90_tx < range_02 ); 
ppl_90_tx_range_02_03   = sum( ppl_90_tx >= range_02 & ppl_90_tx < range_03 ); 
ppl_90_tx_range_03_04   = sum( ppl_90_tx >= range_03 & ppl_90_tx < range_04 ); 
ppl_90_tx_range_04_05   = sum( ppl_90_tx >= range_04 & ppl_90_tx < range_05 ); 
ppl_90_tx_range_05_06   = sum( ppl_90_tx >= range_05 & ppl_90_tx < range_06 ); 
ppl_90_tx_range_06_07   = sum( ppl_90_tx >= range_06 & ppl_90_tx < range_07 ); 
ppl_90_tx_range_07_08   = sum( ppl_90_tx >= range_07 & ppl_90_tx < range_08 ); 
ppl_90_tx_range_08_09   = sum( ppl_90_tx >= range_08 & ppl_90_tx < range_09 ); 
ppl_90_tx_range_09_10   = sum( ppl_90_tx >= range_09 & ppl_90_tx < range_10 ); 


count_ppl_90_tx = [ ppl_90_tx_range_00_01;     
                    ppl_90_tx_range_01_02; 
                    ppl_90_tx_range_02_03; 
                    ppl_90_tx_range_03_04; 
                    ppl_90_tx_range_04_05; 
                    ppl_90_tx_range_05_06; 
                    ppl_90_tx_range_06_07; 
                    ppl_90_tx_range_07_08; 
                    ppl_90_tx_range_08_09; 
                    ppl_90_tx_range_09_10]; 
                
                
% Count ppl_80_tx
ppl_80_tx_range_00_01   = sum( ppl_80_tx >= range_00 & ppl_80_tx < range_01 ); 
ppl_80_tx_range_01_02   = sum( ppl_80_tx >= range_01 & ppl_80_tx < range_02 ); 
ppl_80_tx_range_02_03   = sum( ppl_80_tx >= range_02 & ppl_80_tx < range_03 ); 
ppl_80_tx_range_03_04   = sum( ppl_80_tx >= range_03 & ppl_80_tx < range_04 ); 
ppl_80_tx_range_04_05   = sum( ppl_80_tx >= range_04 & ppl_80_tx < range_05 ); 
ppl_80_tx_range_05_06   = sum( ppl_80_tx >= range_05 & ppl_80_tx < range_06 ); 
ppl_80_tx_range_06_07   = sum( ppl_80_tx >= range_06 & ppl_80_tx < range_07 ); 
ppl_80_tx_range_07_08   = sum( ppl_80_tx >= range_07 & ppl_80_tx < range_08 ); 
ppl_80_tx_range_08_09   = sum( ppl_80_tx >= range_08 & ppl_80_tx < range_09 ); 
ppl_80_tx_range_09_10   = sum( ppl_80_tx >= range_09 & ppl_80_tx < range_10 ); 


count_ppl_80_tx = [ ppl_80_tx_range_00_01;     
                    ppl_80_tx_range_01_02; 
                    ppl_80_tx_range_02_03; 
                    ppl_80_tx_range_03_04; 
                    ppl_80_tx_range_04_05; 
                    ppl_80_tx_range_05_06; 
                    ppl_80_tx_range_06_07; 
                    ppl_80_tx_range_07_08; 
                    ppl_80_tx_range_08_09; 
                    ppl_80_tx_range_09_10];                 
                
                
% Count ppl_70_tx
ppl_70_tx_range_00_01   = sum( ppl_70_tx >= range_00 & ppl_70_tx < range_01 ); 
ppl_70_tx_range_01_02   = sum( ppl_70_tx >= range_01 & ppl_70_tx < range_02 ); 
ppl_70_tx_range_02_03   = sum( ppl_70_tx >= range_02 & ppl_70_tx < range_03 ); 
ppl_70_tx_range_03_04   = sum( ppl_70_tx >= range_03 & ppl_70_tx < range_04 ); 
ppl_70_tx_range_04_05   = sum( ppl_70_tx >= range_04 & ppl_70_tx < range_05 ); 
ppl_70_tx_range_05_06   = sum( ppl_70_tx >= range_05 & ppl_70_tx < range_06 ); 
ppl_70_tx_range_06_07   = sum( ppl_70_tx >= range_06 & ppl_70_tx < range_07 ); 
ppl_70_tx_range_07_08   = sum( ppl_70_tx >= range_07 & ppl_70_tx < range_08 ); 
ppl_70_tx_range_08_09   = sum( ppl_70_tx >= range_08 & ppl_70_tx < range_09 ); 
ppl_70_tx_range_09_10   = sum( ppl_70_tx >= range_09 & ppl_70_tx < range_10 ); 


count_ppl_70_tx = [ ppl_70_tx_range_00_01;     
                    ppl_70_tx_range_01_02; 
                    ppl_70_tx_range_02_03; 
                    ppl_70_tx_range_03_04; 
                    ppl_70_tx_range_04_05; 
                    ppl_70_tx_range_05_06; 
                    ppl_70_tx_range_06_07; 
                    ppl_70_tx_range_07_08; 
                    ppl_70_tx_range_08_09; 
                    ppl_70_tx_range_09_10];     
                
                
% Count ppl_60_tx
ppl_60_tx_range_00_01   = sum( ppl_60_tx >= range_00 & ppl_60_tx < range_01 ); 
ppl_60_tx_range_01_02   = sum( ppl_60_tx >= range_01 & ppl_60_tx < range_02 ); 
ppl_60_tx_range_02_03   = sum( ppl_60_tx >= range_02 & ppl_60_tx < range_03 ); 
ppl_60_tx_range_03_04   = sum( ppl_60_tx >= range_03 & ppl_60_tx < range_04 ); 
ppl_60_tx_range_04_05   = sum( ppl_60_tx >= range_04 & ppl_60_tx < range_05 ); 
ppl_60_tx_range_05_06   = sum( ppl_60_tx >= range_05 & ppl_60_tx < range_06 ); 
ppl_60_tx_range_06_07   = sum( ppl_60_tx >= range_06 & ppl_60_tx < range_07 ); 
ppl_60_tx_range_07_08   = sum( ppl_60_tx >= range_07 & ppl_60_tx < range_08 ); 
ppl_60_tx_range_08_09   = sum( ppl_60_tx >= range_08 & ppl_60_tx < range_09 ); 
ppl_60_tx_range_09_10   = sum( ppl_60_tx >= range_09 & ppl_60_tx < range_10 ); 


count_ppl_60_tx = [ ppl_60_tx_range_00_01;     
                    ppl_60_tx_range_01_02; 
                    ppl_60_tx_range_02_03; 
                    ppl_60_tx_range_03_04; 
                    ppl_60_tx_range_04_05; 
                    ppl_60_tx_range_05_06; 
                    ppl_60_tx_range_06_07; 
                    ppl_60_tx_range_07_08; 
                    ppl_60_tx_range_08_09; 
                    ppl_60_tx_range_09_10];   
                
% Count ppl_50_tx
ppl_50_tx_range_00_01   = sum( ppl_50_tx >= range_00 & ppl_50_tx < range_01 ); 
ppl_50_tx_range_01_02   = sum( ppl_50_tx >= range_01 & ppl_50_tx < range_02 ); 
ppl_50_tx_range_02_03   = sum( ppl_50_tx >= range_02 & ppl_50_tx < range_03 ); 
ppl_50_tx_range_03_04   = sum( ppl_50_tx >= range_03 & ppl_50_tx < range_04 ); 
ppl_50_tx_range_04_05   = sum( ppl_50_tx >= range_04 & ppl_50_tx < range_05 ); 
ppl_50_tx_range_05_06   = sum( ppl_50_tx >= range_05 & ppl_50_tx < range_06 ); 
ppl_50_tx_range_06_07   = sum( ppl_50_tx >= range_06 & ppl_50_tx < range_07 ); 
ppl_50_tx_range_07_08   = sum( ppl_50_tx >= range_07 & ppl_50_tx < range_08 ); 
ppl_50_tx_range_08_09   = sum( ppl_50_tx >= range_08 & ppl_50_tx < range_09 ); 
ppl_50_tx_range_09_10   = sum( ppl_50_tx >= range_09 & ppl_50_tx < range_10 ); 


count_ppl_50_tx = [ ppl_50_tx_range_00_01;     
                    ppl_50_tx_range_01_02; 
                    ppl_50_tx_range_02_03; 
                    ppl_50_tx_range_03_04; 
                    ppl_50_tx_range_04_05; 
                    ppl_50_tx_range_05_06; 
                    ppl_50_tx_range_06_07; 
                    ppl_50_tx_range_07_08; 
                    ppl_50_tx_range_08_09; 
                    ppl_50_tx_range_09_10];   
                
                
% Count ppl_40_tx
ppl_40_tx_range_00_01   = sum( ppl_40_tx >= range_00 & ppl_40_tx < range_01 ); 
ppl_40_tx_range_01_02   = sum( ppl_40_tx >= range_01 & ppl_40_tx < range_02 ); 
ppl_40_tx_range_02_03   = sum( ppl_40_tx >= range_02 & ppl_40_tx < range_03 ); 
ppl_40_tx_range_03_04   = sum( ppl_40_tx >= range_03 & ppl_40_tx < range_04 ); 
ppl_40_tx_range_04_05   = sum( ppl_40_tx >= range_04 & ppl_40_tx < range_05 ); 
ppl_40_tx_range_05_06   = sum( ppl_40_tx >= range_05 & ppl_40_tx < range_06 ); 
ppl_40_tx_range_06_07   = sum( ppl_40_tx >= range_06 & ppl_40_tx < range_07 ); 
ppl_40_tx_range_07_08   = sum( ppl_40_tx >= range_07 & ppl_40_tx < range_08 ); 
ppl_40_tx_range_08_09   = sum( ppl_40_tx >= range_08 & ppl_40_tx < range_09 ); 
ppl_40_tx_range_09_10   = sum( ppl_40_tx >= range_09 & ppl_40_tx < range_10 ); 

count_ppl_40_tx = [ ppl_40_tx_range_00_01;     
                    ppl_40_tx_range_01_02; 
                    ppl_40_tx_range_02_03; 
                    ppl_40_tx_range_03_04; 
                    ppl_40_tx_range_04_05; 
                    ppl_40_tx_range_05_06; 
                    ppl_40_tx_range_06_07; 
                    ppl_40_tx_range_07_08; 
                    ppl_40_tx_range_08_09; 
                    ppl_40_tx_range_09_10];   
                
% Count ppl_30_tx
ppl_30_tx_range_00_01   = sum( ppl_30_tx >= range_00 & ppl_30_tx < range_01 ); 
ppl_30_tx_range_01_02   = sum( ppl_30_tx >= range_01 & ppl_30_tx < range_02 ); 
ppl_30_tx_range_02_03   = sum( ppl_30_tx >= range_02 & ppl_30_tx < range_03 ); 
ppl_30_tx_range_03_04   = sum( ppl_30_tx >= range_03 & ppl_30_tx < range_04 ); 
ppl_30_tx_range_04_05   = sum( ppl_30_tx >= range_04 & ppl_30_tx < range_05 ); 
ppl_30_tx_range_05_06   = sum( ppl_30_tx >= range_05 & ppl_30_tx < range_06 ); 
ppl_30_tx_range_06_07   = sum( ppl_30_tx >= range_06 & ppl_30_tx < range_07 ); 
ppl_30_tx_range_07_08   = sum( ppl_30_tx >= range_07 & ppl_30_tx < range_08 ); 
ppl_30_tx_range_08_09   = sum( ppl_30_tx >= range_08 & ppl_30_tx < range_09 ); 
ppl_30_tx_range_09_10   = sum( ppl_30_tx >= range_09 & ppl_30_tx < range_10 ); 

count_ppl_30_tx = [ ppl_30_tx_range_00_01;     
                    ppl_30_tx_range_01_02; 
                    ppl_30_tx_range_02_03; 
                    ppl_30_tx_range_03_04; 
                    ppl_30_tx_range_04_05; 
                    ppl_30_tx_range_05_06; 
                    ppl_30_tx_range_06_07; 
                    ppl_30_tx_range_07_08; 
                    ppl_30_tx_range_08_09; 
                    ppl_30_tx_range_09_10];  
                
% Count ppl_20_tx
ppl_20_tx_range_00_01   = sum( ppl_20_tx >= range_00 & ppl_20_tx < range_01 ); 
ppl_20_tx_range_01_02   = sum( ppl_20_tx >= range_01 & ppl_20_tx < range_02 ); 
ppl_20_tx_range_02_03   = sum( ppl_20_tx >= range_02 & ppl_20_tx < range_03 ); 
ppl_20_tx_range_03_04   = sum( ppl_20_tx >= range_03 & ppl_20_tx < range_04 ); 
ppl_20_tx_range_04_05   = sum( ppl_20_tx >= range_04 & ppl_20_tx < range_05 ); 
ppl_20_tx_range_05_06   = sum( ppl_20_tx >= range_05 & ppl_20_tx < range_06 ); 
ppl_20_tx_range_06_07   = sum( ppl_20_tx >= range_06 & ppl_20_tx < range_07 ); 
ppl_20_tx_range_07_08   = sum( ppl_20_tx >= range_07 & ppl_20_tx < range_08 ); 
ppl_20_tx_range_08_09   = sum( ppl_20_tx >= range_08 & ppl_20_tx < range_09 ); 
ppl_20_tx_range_09_10   = sum( ppl_20_tx >= range_09 & ppl_20_tx < range_10 ); 

count_ppl_20_tx = [ ppl_20_tx_range_00_01;     
                    ppl_20_tx_range_01_02; 
                    ppl_20_tx_range_02_03; 
                    ppl_20_tx_range_03_04; 
                    ppl_20_tx_range_04_05; 
                    ppl_20_tx_range_05_06; 
                    ppl_20_tx_range_06_07; 
                    ppl_20_tx_range_07_08; 
                    ppl_20_tx_range_08_09; 
                    ppl_20_tx_range_09_10];                 
                
% Count ppl_10_tx
ppl_10_tx_range_00_01   = sum( ppl_10_tx >= range_00 & ppl_10_tx < range_01 ); 
ppl_10_tx_range_01_02   = sum( ppl_10_tx >= range_01 & ppl_10_tx < range_02 ); 
ppl_10_tx_range_02_03   = sum( ppl_10_tx >= range_02 & ppl_10_tx < range_03 ); 
ppl_10_tx_range_03_04   = sum( ppl_10_tx >= range_03 & ppl_10_tx < range_04 ); 
ppl_10_tx_range_04_05   = sum( ppl_10_tx >= range_04 & ppl_10_tx < range_05 ); 
ppl_10_tx_range_05_06   = sum( ppl_10_tx >= range_05 & ppl_10_tx < range_06 ); 
ppl_10_tx_range_06_07   = sum( ppl_10_tx >= range_06 & ppl_10_tx < range_07 ); 
ppl_10_tx_range_07_08   = sum( ppl_10_tx >= range_07 & ppl_10_tx < range_08 ); 
ppl_10_tx_range_08_09   = sum( ppl_10_tx >= range_08 & ppl_10_tx < range_09 ); 
ppl_10_tx_range_09_10   = sum( ppl_10_tx >= range_09 & ppl_10_tx < range_10 ); 

count_ppl_10_tx = [ ppl_10_tx_range_00_01;     
                    ppl_10_tx_range_01_02; 
                    ppl_10_tx_range_02_03; 
                    ppl_10_tx_range_03_04; 
                    ppl_10_tx_range_04_05; 
                    ppl_10_tx_range_05_06; 
                    ppl_10_tx_range_06_07; 
                    ppl_10_tx_range_07_08; 
                    ppl_10_tx_range_08_09; 
                    ppl_10_tx_range_09_10]; 
                
% Count ppl_0_tx
ppl_0_tx_range_00_01   = sum( ppl_0_tx >= range_00 & ppl_0_tx < range_01 ); 
ppl_0_tx_range_01_02   = sum( ppl_0_tx >= range_01 & ppl_0_tx < range_02 ); 
ppl_0_tx_range_02_03   = sum( ppl_0_tx >= range_02 & ppl_0_tx < range_03 ); 
ppl_0_tx_range_03_04   = sum( ppl_0_tx >= range_03 & ppl_0_tx < range_04 ); 
ppl_0_tx_range_04_05   = sum( ppl_0_tx >= range_04 & ppl_0_tx < range_05 ); 
ppl_0_tx_range_05_06   = sum( ppl_0_tx >= range_05 & ppl_0_tx < range_06 ); 
ppl_0_tx_range_06_07   = sum( ppl_0_tx >= range_06 & ppl_0_tx < range_07 ); 
ppl_0_tx_range_07_08   = sum( ppl_0_tx >= range_07 & ppl_0_tx < range_08 ); 
ppl_0_tx_range_08_09   = sum( ppl_0_tx >= range_08 & ppl_0_tx < range_09 ); 
ppl_0_tx_range_09_10   = sum( ppl_0_tx >= range_09 & ppl_0_tx < range_10 ); 

count_ppl_0_tx  = [ ppl_0_tx_range_00_01;     
                    ppl_0_tx_range_01_02; 
                    ppl_0_tx_range_02_03; 
                    ppl_0_tx_range_03_04; 
                    ppl_0_tx_range_04_05; 
                    ppl_0_tx_range_05_06; 
                    ppl_0_tx_range_06_07; 
                    ppl_0_tx_range_07_08; 
                    ppl_0_tx_range_08_09; 
                    ppl_0_tx_range_09_10];                 
                