1. Compile parserLogListener_stats-libp.cpp y parserLogListener_stats-ghs.cpp

g++ -o parserLogListener_stats-libp parserLogListener_stats-libp.cpp
g++ -o parserLogListener_stats-ghs parserLogListener_stats-ghs.cpp

2. Ejecutar parserLogListener_stats-libp para sacar las estadisticas

./parserLogListener_stats-libp > stats-libp.dat
./parserLogListener_stats-ghs > stats-ghs.dat

3. compilar divideFileByID_ghs.cpp y divideFileByID_libp

g++ -o divideFileByID_ghs divideFileByID_ghs.cpp
g++ -o divideFileByID_libp divideFileByID_libp.cpp

4. ejecutar divideFileByID_ghs y divideFileByID_libp con el numero de nodos como argumento
./divideFileByID_ghs 40
./divideFileByID_libp 40
