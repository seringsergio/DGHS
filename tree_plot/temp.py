from igraph import *
import time
import matplotlib.pyplot as plt



vertices = ["one", "two", "three"]

edges = [(0,2),(2,1),(0,1)]
g = Graph(vertex_attrs={"label": vertices}, edges=edges, directed=True)
plot(g)

time.sleep(1)

edges = [(2,0),(1,2),(1,0)]
g = Graph(vertex_attrs={"label": vertices}, edges=edges, directed=True)
plot(g)
