%% Compute latency

%Encontrar seqno correspondientes en el sink y en el leaf
min_seqno = max ( [ min(seqno_leaf_citt_int_0_7dBm) min(seqno_sink_citt_int_0_7dBm) ] ); 
max_seqno = min ( [ max(seqno_leaf_citt_int_0_7dBm) max(seqno_sink_citt_int_0_7dBm) ] ); 


%recorrer los seqno que tienen en comun el sink y el leaf
j = 0; 
for i = min_seqno:1:max_seqno

    pos_seqno_leaf_citt_int_0_7dBm = find(seqno_leaf_citt_int_0_7dBm == i);
    pos_seqno_sink_citt_int_0_7dBm = find(seqno_sink_citt_int_0_7dBm == i);

    % Algun paquete se perdio? Evaluo que el paquete salio del leaf y llego
    % al sink. 
    if ~isempty(pos_seqno_leaf_citt_int_0_7dBm) && ~isempty(pos_seqno_sink_citt_int_0_7dBm) && length(pos_seqno_leaf_citt_int_0_7dBm) == 1 && length(pos_seqno_sink_citt_int_0_7dBm) == 1
        
    date_leaf_citt_int_0_7dBm_temp = datetime(date_leaf_citt_int_0_7dBm(pos_seqno_leaf_citt_int_0_7dBm)   ,'Format','yyyy-MM-dd HH:mm:ss.SSSSSS');% pasarlo al formato de matlab
    date_sink_citt_int_0_7dBm_temp = datetime(date_sink_citt_int_0_7dBm(pos_seqno_sink_citt_int_0_7dBm),'Format','yyyy-MM-dd HH:mm:ss.SSSSSS');% pasarlo al formato de matlab

    latency_citt_int_0_temp = seconds (  [date_sink_citt_int_0_7dBm_temp - date_leaf_citt_int_0_7dBm_temp]  ) * 10^6 ;% latencia en microsegundos (us)

    j = j + 1; 
    latency_citt_int_0_vec(j) = latency_citt_int_0_temp; 
    end

end

% Quitar los outliers
% a = a(~Isoutlier(a));
% latency_citt_int_0_vec = latency_citt_int_0_vec(~Isoutlier(latency_citt_int_0_vec));

% Volverlo todo positivo
% latency_citt_int_0_vec = abs(latency_citt_int_0_vec);

%latencia media y desviacion estandar
latency_citt_int_0_vec_mean = median(latency_citt_int_0_vec);
latency_citt_int_0_vec_std  = std(latency_citt_int_0_vec);

%% Compute PRR (Packet Reception Rate)

num_missing = 0;
total_seqno = 0;
for i = min_seqno:1:max_seqno
    total_seqno = total_seqno + 1;
    if isempty(find(seqno_sink_citt_int_0_7dBm == i))
        i % Cuales fueron los seqno que se perdieron? Rta: i
        num_missing = num_missing + 1;
    end    
end 

PRR_citt_int_0 = (total_seqno - num_missing) / total_seqno * 100;