from igraph import *
#import time
#import sys
#import cairo
#import subprocess


vertices = ["one", "two", "three"]

edges = [(0,2),(2,1),(0,1)]
g = Graph(vertex_attrs={"label": vertices}, edges=edges, directed=True)



plot(g)
#Myploy = plot(g, target = "as1.pdf")

#Myploy = plot(g).mark_dirty()

#time.sleep(1)

#Myploy.redraw()
#Myploy.show()

#Myploy.mark_dirty()
#Myploy.remove(g)
#Myploy.redraw()
#Myploy.save()

#Myploy.mark_dirty()
#Myploy.show()
#Myploy.kill()

#del Myploy



edges = [(2,0),(1,2),(1,0)]
g = Graph(vertex_attrs={"label": vertices}, edges=edges, directed=True)

plot(g)

#Myploy = plot(g, target = "as2.pdf")

#Myploy.add(g)
#Myploy.show()
#Myploy.redraw()


#Myploy = plot(g)
