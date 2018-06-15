# this program will try to close a image viewer window every ten secounds
# python tree-plot_part1.py  & python tree-plot_part2.py 7


import serial
import MySQLdb
import sys
from igraph import *
import time
from multiprocessing import Process,Pipe
from tree_plot_part3 import f



print "usage: python tree-plot_part2.py <Number of nodes> "
print "Number of nodes = ", sys.argv[1]

id_new = 0
id_old = 0

#connet to the database
dbConn = MySQLdb.connect("localhost","root","1234","sink") or die ("Could not connect to database")

# open a cursor to the database
cursor = dbConn.cursor()

# Vertices of the graph
vertices = [ (i+1) for i in range( int(sys.argv[1]) )] # (nodeID)
#print "vertices = ", vertices

#Edges of the graph
edges = [ (0,0) for i in range( int(sys.argv[1]) )] #(node,parent) ...we have to subtract 1...in other words, node - 1 and parent - 1
#print "edges = ", edges

# X and Y position of the graph = layout
layout = [ (0,0) for i in range( int(sys.argv[1]) )] # (x,y)
#print "layout = ", layout

g = Graph(vertex_attrs={"label": vertices}, edges=edges, directed=True)

while True:
     #open a cursor to the database
    cursor = dbConn.cursor()
    try:
       #Fetch nodeID
       cursor.execute("SELECT id FROM msg ORDER BY id DESC LIMIT 1;")
       dbConn.commit() #commit the insert
       ## Print the fetched line
       out = cursor.fetchall()
       id_new = int(out[0][0])
       #print "id_new = ", id_new

       if id_new != id_old:

           id_old = id_new;

           #Fetch nodeID
           cursor.execute("SELECT nodeID FROM msg ORDER BY id DESC LIMIT 1;")
           dbConn.commit() #commit the insert
           # Print the fetched line
           out = cursor.fetchall()
           nodeID = int(out[0][0])
           print "nodeID = ", nodeID

           #Fetch data
           cursor.execute("SELECT parent FROM msg ORDER BY id DESC LIMIT 1;")
           dbConn.commit() #commit the insert
           # Print the fetched line
           out = cursor.fetchall()
           parent = int(out[0][0])
           print "parent = ", parent

           #Fetch data
           cursor.execute("SELECT x FROM msg ORDER BY id DESC LIMIT 1;")
           dbConn.commit() #commit the insert
           # Print the fetched line
           out = cursor.fetchall()
           x = int(out[0][0])
           print "x = ", x

           #Fetch data
           cursor.execute("SELECT y FROM msg ORDER BY id DESC LIMIT 1;")
           dbConn.commit() #commit the insert
           # Print the fetched line
           out = cursor.fetchall()
           y = int(out[0][0])
           print "y = ", y



           #Build the edges and layout (X and Y position)
           edges [nodeID - 1] =  (nodeID - 1 , parent - 1)
           layout[nodeID - 1] =  (x,y)

           print(edges)
           print(layout)

           # Build Graph
           g = Graph(vertex_attrs={"label": vertices}, edges=edges, directed=True)
           #print g
           #import tree_plot_part3

           #send the graph via a PIPE
           parent_conn,child_conn = Pipe()
           p = Process(target=f, args=(child_conn,))
           p.start()
           parent_conn.send(g)
           parent_conn.close()

           # Plot graph
           #g.es["color"] = "black"
           #g.vs['color'] = "white"
           #plot(g, layout=layout)

           #Close figure
           #os.system("kill -9 $(pidof eog)")

           #Close cursor from mysql
           cursor.close()  #close the cursor
           time.sleep(0.05) #50miliseconds


    except MySQLdb.IntegrityError:
       print "failed to fetch data"
    finally:
       cursor.close()  #close just incase it failed


    # Vertices of the graph  - Suppose that there are 100 nodes
    #vertices = [ (i+1) for i in range( 100 )] # (nodeID)
    #print "vertices = ", vertices

    #Edges of the graph - Suppose that there are 100 nodes
    #edges = [ (0,0) for i in range( 100 )] #(node,parent) ...we have to subtract 1...in other words, node - 1 and parent - 1
    #print "edges = ", edges

    #g = Graph(vertex_attrs={"label": vertices}, edges=edges, directed=True)

    #Funtion to send the graph object: g

    #def f(child_conn):
      ##msg = "Hello Este es"
      #child_conn.send(g)
      #child_conn.close()


#import os
#import time

## creating a forever loop
#while 1 :
#    os.system("kill -9 $(pidof eog)")
#    time.sleep(1)
