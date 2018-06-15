from multiprocessing import Process,Pipe
import os
from igraph import *


def f(child_conn):
    #msg = "hello"
    os.system("kill -9 $(pidof eog)")
    recv = child_conn.recv()
    g = recv[0]
    layout = recv[1]
    print g   # the graph g

    g.es["color"] = "black"
    g.vs['color'] = "white"
    plot(g, layout = layout )
