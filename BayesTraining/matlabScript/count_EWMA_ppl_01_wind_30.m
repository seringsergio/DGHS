
for i = 1:num_divisions_ppl
 
    % interlavo cerrado y luego abierto [...)
    if i ~= num_divisions_ppl
        count_EWMA_ppl_01_100_tx_wind_30(i) = sum( EWMA_ppl_01_100_tx_wind_30 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_01_100_tx_wind_30 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_01_90_tx_wind_30(i) = sum( EWMA_ppl_01_90_tx_wind_30 >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_01_90_tx_wind_30 <  (i)   * range_ppl / num_divisions_ppl );                                 

        count_EWMA_ppl_01_80_tx_wind_30(i) = sum(  EWMA_ppl_01_80_tx_wind_30 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_01_80_tx_wind_30 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_01_70_tx_wind_30(i) = sum(  EWMA_ppl_01_70_tx_wind_30 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_01_70_tx_wind_30 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_01_60_tx_wind_30(i) = sum(  EWMA_ppl_01_60_tx_wind_30 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_01_60_tx_wind_30 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_01_50_tx_wind_30(i) = sum(  EWMA_ppl_01_50_tx_wind_30 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_01_50_tx_wind_30 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_01_40_tx_wind_30(i) = sum(  EWMA_ppl_01_40_tx_wind_30 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_01_40_tx_wind_30 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_01_30_tx_wind_30(i) = sum(  EWMA_ppl_01_30_tx_wind_30 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_01_30_tx_wind_30 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_01_20_tx_wind_30(i) = sum(  EWMA_ppl_01_20_tx_wind_30 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_01_20_tx_wind_30 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_01_10_tx_wind_30(i) = sum(  EWMA_ppl_01_10_tx_wind_30 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_01_10_tx_wind_30 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_01_0_tx_wind_30(i) = sum(   EWMA_ppl_01_0_tx_wind_30 >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_01_0_tx_wind_30 <  (i)    * range_ppl / num_divisions_ppl );                                 
    
    % interlavo cerrado y cerrado [...] por ser el ultimo valor                                   
    elseif i == num_divisions_ppl
        count_EWMA_ppl_01_100_tx_wind_30(i) = sum( EWMA_ppl_01_100_tx_wind_30 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_01_100_tx_wind_30 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_01_90_tx_wind_30(i) = sum( EWMA_ppl_01_90_tx_wind_30 >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_01_90_tx_wind_30 <=  (i)   * range_ppl / num_divisions_ppl );                                 

        count_EWMA_ppl_01_80_tx_wind_30(i) = sum(  EWMA_ppl_01_80_tx_wind_30 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_01_80_tx_wind_30 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_01_70_tx_wind_30(i) = sum(  EWMA_ppl_01_70_tx_wind_30 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_01_70_tx_wind_30 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_01_60_tx_wind_30(i) = sum(  EWMA_ppl_01_60_tx_wind_30 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_01_60_tx_wind_30 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_01_50_tx_wind_30(i) = sum(  EWMA_ppl_01_50_tx_wind_30 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_01_50_tx_wind_30 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_01_40_tx_wind_30(i) = sum(  EWMA_ppl_01_40_tx_wind_30 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_01_40_tx_wind_30 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_01_30_tx_wind_30(i) = sum(  EWMA_ppl_01_30_tx_wind_30 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_01_30_tx_wind_30 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_01_20_tx_wind_30(i) = sum(  EWMA_ppl_01_20_tx_wind_30 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_01_20_tx_wind_30 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_01_10_tx_wind_30(i) = sum(  EWMA_ppl_01_10_tx_wind_30 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_01_10_tx_wind_30 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_01_0_tx_wind_30(i) = sum(   EWMA_ppl_01_0_tx_wind_30 >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_01_0_tx_wind_30 <=  (i)    * range_ppl / num_divisions_ppl );                                 
    
    end    
end
        