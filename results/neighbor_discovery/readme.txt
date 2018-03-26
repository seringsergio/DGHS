
Abstract: Show a plot in gnuplot with the results of the neighbor discovery phase


1. DEPENDENCIES: You have to install gawk AND gnuplot-qt

sudo apt-get install gawk
sudo apt-get install gnuplot-qt


2. parserLogListener_edges.cpp


IN: loglistener.txt (lines with the TAG: READ_NEIGHBOR_LIST)
OUT: edges.dat

g++ -o parserLogListener_edges parserLogListener_edges.cpp
./parserLogListener_edges > edges.dat

3. readSimulation_points.class

IN: simulation.csc
OUT: points.dat

javac readSimulation_points.java
java readSimulation_points > points.dat

4. Run the code gnuGraph_neighbor_discovery.txt in Gnuplot

IN: edges.dat, points.dat
OUT: Neighbor Discovery Graph (Plot in GNUplot)

//run
gnuplot

5. Resume - Conclusion

./parserLogListener_edges > edges.dat &&  java readSimulation_points > points.dat && gnuplot

//Then copy , paste the code in gnuGraph_neighbor_discovery.txt
