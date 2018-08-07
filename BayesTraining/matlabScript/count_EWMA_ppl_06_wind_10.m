
for i = 1:num_divisions_ppl
 
    % interlavo cerrado y luego abierto [...)
    if i ~= num_divisions_ppl
        count_EWMA_ppl_06_100_tx_wind_10(i) = sum( EWMA_ppl_06_100_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_06_100_tx_wind_10 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_06_90_tx_wind_10(i) = sum( EWMA_ppl_06_90_tx_wind_10 >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_06_90_tx_wind_10 <  (i)   * range_ppl / num_divisions_ppl );                                 

        count_EWMA_ppl_06_80_tx_wind_10(i) = sum(  EWMA_ppl_06_80_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_06_80_tx_wind_10 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_06_70_tx_wind_10(i) = sum(  EWMA_ppl_06_70_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_06_70_tx_wind_10 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_06_60_tx_wind_10(i) = sum(  EWMA_ppl_06_60_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_06_60_tx_wind_10 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_06_50_tx_wind_10(i) = sum(  EWMA_ppl_06_50_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_06_50_tx_wind_10 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_06_40_tx_wind_10(i) = sum(  EWMA_ppl_06_40_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_06_40_tx_wind_10 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_06_30_tx_wind_10(i) = sum(  EWMA_ppl_06_30_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_06_30_tx_wind_10 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_06_20_tx_wind_10(i) = sum(  EWMA_ppl_06_20_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_06_20_tx_wind_10 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_06_10_tx_wind_10(i) = sum(  EWMA_ppl_06_10_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_06_10_tx_wind_10 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_06_0_tx_wind_10(i) = sum(   EWMA_ppl_06_0_tx_wind_10 >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_06_0_tx_wind_10 <  (i)    * range_ppl / num_divisions_ppl );                                 
    
    % interlavo cerrado y cerrado [...] por ser el ultimo valor                                   
    elseif i == num_divisions_ppl
        count_EWMA_ppl_06_100_tx_wind_10(i) = sum( EWMA_ppl_06_100_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_06_100_tx_wind_10 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_06_90_tx_wind_10(i) = sum( EWMA_ppl_06_90_tx_wind_10 >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_06_90_tx_wind_10 <=  (i)   * range_ppl / num_divisions_ppl );                                 

        count_EWMA_ppl_06_80_tx_wind_10(i) = sum(  EWMA_ppl_06_80_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_06_80_tx_wind_10 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_06_70_tx_wind_10(i) = sum(  EWMA_ppl_06_70_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_06_70_tx_wind_10 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_06_60_tx_wind_10(i) = sum(  EWMA_ppl_06_60_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_06_60_tx_wind_10 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_06_50_tx_wind_10(i) = sum(  EWMA_ppl_06_50_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_06_50_tx_wind_10 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_06_40_tx_wind_10(i) = sum(  EWMA_ppl_06_40_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_06_40_tx_wind_10 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_06_30_tx_wind_10(i) = sum(  EWMA_ppl_06_30_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_06_30_tx_wind_10 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_06_20_tx_wind_10(i) = sum(  EWMA_ppl_06_20_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_06_20_tx_wind_10 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_06_10_tx_wind_10(i) = sum(  EWMA_ppl_06_10_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_06_10_tx_wind_10 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_06_0_tx_wind_10(i) = sum(   EWMA_ppl_06_0_tx_wind_10 >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_06_0_tx_wind_10 <=  (i)    * range_ppl / num_divisions_ppl );                                 
    
    end    
end
        