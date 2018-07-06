# README
# The tree plot is composed of 3 files:
# tree_plot_part1.py: Take data from serial and put it into mysql
# tree_plot_part2.py: Reads from mysql, builds the graph g, sends the graph via a pipe. Takes as input the number of nodes.
# tree_plot_part3.py: It is a function that receives the graph via a pipe. Then, plot the graph.
#
# Execute/run:
# 1. In a terminal run < python tree_plot_part1.py >
# 2. Next, in another terminal run < python tree_plot_part2.py 7 > Where 7 is the number_of_nodes
# You are done, you do not have to run tree_plot_part3 because it is a function that is called from tree_plot_part2

from multiprocessing import Process,Pipe
import os
from igraph import *


def f(child_conn):
    #Close the window. The program is called eog (Image viewer)
    os.system("kill -9 $(pidof eog)")

    #Receive the data via the Pipe
    recv = child_conn.recv()

    #Get the two objects
    g = recv[0]
    layout = recv[1]

    #Print the graph
    print g
    g.es["color"] = "black"
    g.vs['color'] = "white"
    plot(g, layout = layout )
