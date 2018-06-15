from multiprocessing import Process,Pipe
import os
from igraph import *


def f(child_conn):
    #msg = "hello"
    os.system("kill -9 $(pidof eog)")
    g = child_conn.recv()
    print g   # prints "Hello
    plot(g)
