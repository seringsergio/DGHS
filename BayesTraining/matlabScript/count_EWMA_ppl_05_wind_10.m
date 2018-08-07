
for i = 1:num_divisions_ppl
 
    % interlavo cerrado y luego abierto [...)
    if i ~= num_divisions_ppl
        count_EWMA_ppl_05_100_tx_wind_10(i) = sum( EWMA_ppl_05_100_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_100_tx_wind_10 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_90_tx_wind_10(i) = sum( EWMA_ppl_05_90_tx_wind_10 >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_90_tx_wind_10 <  (i)   * range_ppl / num_divisions_ppl );                                 

        count_EWMA_ppl_05_80_tx_wind_10(i) = sum(  EWMA_ppl_05_80_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_80_tx_wind_10 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_70_tx_wind_10(i) = sum(  EWMA_ppl_05_70_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_70_tx_wind_10 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_60_tx_wind_10(i) = sum(  EWMA_ppl_05_60_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_60_tx_wind_10 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_50_tx_wind_10(i) = sum(  EWMA_ppl_05_50_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_50_tx_wind_10 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_40_tx_wind_10(i) = sum(  EWMA_ppl_05_40_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_40_tx_wind_10 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_30_tx_wind_10(i) = sum(  EWMA_ppl_05_30_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_30_tx_wind_10 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_20_tx_wind_10(i) = sum(  EWMA_ppl_05_20_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_20_tx_wind_10 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_10_tx_wind_10(i) = sum(  EWMA_ppl_05_10_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_10_tx_wind_10 <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_0_tx_wind_10(i) = sum(   EWMA_ppl_05_0_tx_wind_10 >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_0_tx_wind_10 <  (i)    * range_ppl / num_divisions_ppl );                                 
    
    % interlavo cerrado y cerrado [...] por ser el ultimo valor                                   
    elseif i == num_divisions_ppl
        count_EWMA_ppl_05_100_tx_wind_10(i) = sum( EWMA_ppl_05_100_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_100_tx_wind_10 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_90_tx_wind_10(i) = sum( EWMA_ppl_05_90_tx_wind_10 >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_90_tx_wind_10 <=  (i)   * range_ppl / num_divisions_ppl );                                 

        count_EWMA_ppl_05_80_tx_wind_10(i) = sum(  EWMA_ppl_05_80_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_80_tx_wind_10 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_70_tx_wind_10(i) = sum(  EWMA_ppl_05_70_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_70_tx_wind_10 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_60_tx_wind_10(i) = sum(  EWMA_ppl_05_60_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_60_tx_wind_10 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_50_tx_wind_10(i) = sum(  EWMA_ppl_05_50_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_50_tx_wind_10 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_40_tx_wind_10(i) = sum(  EWMA_ppl_05_40_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_40_tx_wind_10 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_30_tx_wind_10(i) = sum(  EWMA_ppl_05_30_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_30_tx_wind_10 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_20_tx_wind_10(i) = sum(  EWMA_ppl_05_20_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_20_tx_wind_10 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_10_tx_wind_10(i) = sum(  EWMA_ppl_05_10_tx_wind_10 >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_10_tx_wind_10 <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_0_tx_wind_10(i) = sum(   EWMA_ppl_05_0_tx_wind_10 >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_0_tx_wind_10 <=  (i)    * range_ppl / num_divisions_ppl );                                 
    
    end    
end
        