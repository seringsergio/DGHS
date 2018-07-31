
for i = 1:num_divisions_ppl
 
    % interlavo cerrado y luego abierto [...)
    if i ~= num_divisions_ppl
        count_EWMA_ppl_08_100_tx(i) = sum( EWMA_ppl_08_100_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_08_100_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_08_90_tx(i) = sum( EWMA_ppl_08_90_tx >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_08_90_tx <  (i)   * range_ppl / num_divisions_ppl );                                 

        count_EWMA_ppl_08_80_tx(i) = sum(  EWMA_ppl_08_80_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_08_80_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_08_70_tx(i) = sum(  EWMA_ppl_08_70_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_08_70_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_08_60_tx(i) = sum(  EWMA_ppl_08_60_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_08_60_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_08_50_tx(i) = sum(  EWMA_ppl_08_50_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_08_50_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_08_40_tx(i) = sum(  EWMA_ppl_08_40_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_08_40_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_08_30_tx(i) = sum(  EWMA_ppl_08_30_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_08_30_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_08_20_tx(i) = sum(  EWMA_ppl_08_20_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_08_20_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_08_10_tx(i) = sum(  EWMA_ppl_08_10_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_08_10_tx <  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_08_0_tx(i) = sum(   EWMA_ppl_08_0_tx >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_08_0_tx <  (i)    * range_ppl / num_divisions_ppl );                                 
    
    % interlavo cerrado y cerrado [...] por ser el ultimo valor                                   
    elseif i == num_divisions_ppl
        count_EWMA_ppl_08_100_tx(i) = sum( EWMA_ppl_08_100_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_08_100_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_08_90_tx(i) = sum( EWMA_ppl_08_90_tx >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_08_90_tx <=  (i)   * range_ppl / num_divisions_ppl );                                 

        count_EWMA_ppl_08_80_tx(i) = sum(  EWMA_ppl_08_80_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_08_80_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_08_70_tx(i) = sum(  EWMA_ppl_08_70_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_08_70_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_08_60_tx(i) = sum(  EWMA_ppl_08_60_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_08_60_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_08_50_tx(i) = sum(  EWMA_ppl_08_50_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_08_50_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_08_40_tx(i) = sum(  EWMA_ppl_08_40_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_08_40_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_08_30_tx(i) = sum(  EWMA_ppl_08_30_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_08_30_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_08_20_tx(i) = sum(  EWMA_ppl_08_20_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_08_20_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_08_10_tx(i) = sum(  EWMA_ppl_08_10_tx >= (i-1) * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_08_10_tx <=  (i)   * range_ppl / num_divisions_ppl );

        count_EWMA_ppl_08_0_tx(i) = sum(   EWMA_ppl_08_0_tx >= (i-1)  * range_ppl / num_divisions_ppl ...
                                         & EWMA_ppl_08_0_tx <=  (i)    * range_ppl / num_divisions_ppl );                                 
    
    end    
end
        