
for i = 1:num_divisions_ppl
 
    % interlavo cerrado y luego abierto [...)
    if i ~= num_divisions_ppl
        count_EWMA_ppl_03_100_tx(i) = sum( EWMA_ppl_03_100_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_03_100_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_03_90_tx(i) = sum( EWMA_ppl_03_90_tx >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_03_90_tx <  (i)   * range_ppl / num_divisions_ppl );                                 

        count_EWMA_ppl_03_80_tx(i) = sum(  EWMA_ppl_03_80_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_03_80_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_03_70_tx(i) = sum(  EWMA_ppl_03_70_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_03_70_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_03_60_tx(i) = sum(  EWMA_ppl_03_60_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_03_60_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_03_50_tx(i) = sum(  EWMA_ppl_03_50_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_03_50_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_03_40_tx(i) = sum(  EWMA_ppl_03_40_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_03_40_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_03_30_tx(i) = sum(  EWMA_ppl_03_30_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_03_30_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_03_20_tx(i) = sum(  EWMA_ppl_03_20_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_03_20_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_03_10_tx(i) = sum(  EWMA_ppl_03_10_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_03_10_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_03_0_tx(i) = sum(   EWMA_ppl_03_0_tx >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_03_0_tx <  (i)    * range_ppl / num_divisions_ppl );                                 
    
    % interlavo cerrado y cerrado [...] por ser el ultimo valor                                   
    elseif i == num_divisions_ppl
        count_EWMA_ppl_03_100_tx(i) = sum( EWMA_ppl_03_100_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_03_100_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_03_90_tx(i) = sum( EWMA_ppl_03_90_tx >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_03_90_tx <=  (i)   * range_ppl / num_divisions_ppl );                                 

        count_EWMA_ppl_03_80_tx(i) = sum(  EWMA_ppl_03_80_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_03_80_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_03_70_tx(i) = sum(  EWMA_ppl_03_70_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_03_70_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_03_60_tx(i) = sum(  EWMA_ppl_03_60_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_03_60_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_03_50_tx(i) = sum(  EWMA_ppl_03_50_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_03_50_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_03_40_tx(i) = sum(  EWMA_ppl_03_40_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_03_40_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_03_30_tx(i) = sum(  EWMA_ppl_03_30_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_03_30_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_03_20_tx(i) = sum(  EWMA_ppl_03_20_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_03_20_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_03_10_tx(i) = sum(  EWMA_ppl_03_10_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_03_10_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_03_0_tx(i) = sum(   EWMA_ppl_03_0_tx >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_03_0_tx <=  (i)    * range_ppl / num_divisions_ppl );                                 
    
    end    
end
        