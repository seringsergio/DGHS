
for i = 1:num_divisions_ppl
 
    % interlavo cerrado y luego abierto [...)
    if i ~= num_divisions_ppl
        count_EWMA_ppl_05_100_tx(i) = sum( EWMA_ppl_05_100_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_100_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_90_tx(i) = sum( EWMA_ppl_05_90_tx >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_90_tx <  (i)   * range_ppl / num_divisions_ppl );                                 

        count_EWMA_ppl_05_80_tx(i) = sum(  EWMA_ppl_05_80_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_80_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_70_tx(i) = sum(  EWMA_ppl_05_70_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_70_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_60_tx(i) = sum(  EWMA_ppl_05_60_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_60_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_50_tx(i) = sum(  EWMA_ppl_05_50_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_50_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_40_tx(i) = sum(  EWMA_ppl_05_40_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_40_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_30_tx(i) = sum(  EWMA_ppl_05_30_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_30_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_20_tx(i) = sum(  EWMA_ppl_05_20_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_20_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_10_tx(i) = sum(  EWMA_ppl_05_10_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_10_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_0_tx(i) = sum(   EWMA_ppl_05_0_tx >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_0_tx <  (i)    * range_ppl / num_divisions_ppl );                                 
    
    % interlavo cerrado y cerrado [...] por ser el ultimo valor                                   
    elseif i == num_divisions_ppl
        count_EWMA_ppl_05_100_tx(i) = sum( EWMA_ppl_05_100_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_100_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_90_tx(i) = sum( EWMA_ppl_05_90_tx >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_90_tx <=  (i)   * range_ppl / num_divisions_ppl );                                 

        count_EWMA_ppl_05_80_tx(i) = sum(  EWMA_ppl_05_80_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_80_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_70_tx(i) = sum(  EWMA_ppl_05_70_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_70_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_60_tx(i) = sum(  EWMA_ppl_05_60_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_60_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_50_tx(i) = sum(  EWMA_ppl_05_50_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_50_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_40_tx(i) = sum(  EWMA_ppl_05_40_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_40_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_30_tx(i) = sum(  EWMA_ppl_05_30_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_30_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_20_tx(i) = sum(  EWMA_ppl_05_20_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_20_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_10_tx(i) = sum(  EWMA_ppl_05_10_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_10_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_05_0_tx(i) = sum(   EWMA_ppl_05_0_tx >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_05_0_tx <=  (i)    * range_ppl / num_divisions_ppl );                                 
    
    end    
end
        