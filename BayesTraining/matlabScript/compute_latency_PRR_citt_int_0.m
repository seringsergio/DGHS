%% Compute latency

%Encontrar seqno correspondientes en el sink y en el leaf
min_seqno = max ( [ min(seqno_leaf_citt_int_0) min(seqno_sink_citt_int_0) ] ); 
max_seqno = min ( [ max(seqno_leaf_citt_int_0) max(seqno_sink_citt_int_0) ] ); 


%recorrer los seqno que tienen en comun el sink y el leaf
j = 0; 
for i = min_seqno:1:max_seqno

    pos_seqno_leaf_citt_int_0 = find(seqno_leaf_citt_int_0 == i);
    pos_seqno_sink_citt_int_0 = find(seqno_sink_citt_int_0 == i);

    % Algun paquete se perdio? Evaluo que el paquete salio del leaf y llego
    % al sink. 
    if ~isempty(pos_seqno_leaf_citt_int_0) && ~isempty(pos_seqno_sink_citt_int_0) && length(pos_seqno_leaf_citt_int_0) == 1 && length(pos_seqno_sink_citt_int_0) == 1
        
    date_leaf_citt_int_0_temp = datetime(date_leaf_citt_int_0(pos_seqno_leaf_citt_int_0)   ,'Format','yyyy-MM-dd HH:mm:ss.SSSSSS');% pasarlo al formato de matlab
    date_sink_citt_int_0_temp = datetime(date_sink_citt_int_0(pos_seqno_sink_citt_int_0),'Format','yyyy-MM-dd HH:mm:ss.SSSSSS');% pasarlo al formato de matlab

    latency_citt_int_0_temp = seconds (  [date_sink_citt_int_0_temp - date_leaf_citt_int_0_temp]  ) * 10^6 ;% latencia en microsegundos (us)

    j = j + 1; 
    latency_citt_int_0_vec(j) = latency_citt_int_0_temp; 
    end

end

% Quitar los outliers
% a = a(~Isoutlier(a));
latency_citt_int_0_vec = latency_citt_int_0_vec(~Isoutlier(latency_citt_int_0_vec));

%latencia media y desviacion estandar
latency_citt_int_0_vec_mean = mean(latency_citt_int_0_vec);
latency_citt_int_0_vec_std  = std(latency_citt_int_0_vec);

%% Compute PRR (Packet Reception Rate)

num_missing = 0;
total_seqno = 0;
for i = min_seqno:1:max_seqno
    total_seqno = total_seqno + 1;
    if isempty(find(seqno_sink_citt_int_0 == i))
        i % Cuales fueron los seqno que se perdieron? Rta: i
        num_missing = num_missing + 1;
    end    
end 

PRR_citt_int_0 = (total_seqno - num_missing) / total_seqno * 100;