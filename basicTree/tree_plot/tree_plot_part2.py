# README
# The tree plot is composed of 3 files:
# tree_plot_part1.py: Take data from serial and put it into mysql
# tree_plot_part2.py: Reads from mysql, builds the graph g, sends the graph via a pipe. Takes as input the number of nodes.
# tree_plot_part3.py: It is a function that receives the graph via a pipe. Then, plot the graph.
#
# Execute/run:
# 1. In a terminal run < python tree_plot_part1.py >
# 2. Next, run < python tree_plot_part2.py 7 > Where 7 is the number_of_nodes
# You are done, you do not have to run tree_plot_part3 because it is a function that is called from tree_plot_part2


import MySQLdb
import sys
from igraph import *
import time
from multiprocessing import Process,Pipe
from tree_plot_part3 import f

print "usage: python tree-plot_part2.py <Number of nodes> "
print "Number of nodes = ", sys.argv[1]

# The id column in the database
id_new = 0
id_old = 0



#connet to the database
dbConn = MySQLdb.connect("localhost","root","1234","sink") or die ("Could not connect to database")

# open a cursor to the database
cursor = dbConn.cursor()

# Vertices of the graph
vertices = [ (i+1) for i in range( int(sys.argv[1]) )] # (nodeID)

#Edges of the graph
edges = [ (i,i) for i in range( int(sys.argv[1]) )] #(node,parent) ...we have to subtract 1...in other words, node - 1 and parent - 1

# X and Y position of the graph = layout
layout = [ (0,0) for i in range( int(sys.argv[1]) )] # (x,y)

while True:
    #open a cursor to the database
    cursor = dbConn.cursor()
    try:
       #Fetch data: id
       cursor.execute("SELECT id FROM tree_plot ORDER BY id DESC LIMIT 1;")
       dbConn.commit() #commit the insert
       out = cursor.fetchall()
       id_new = int(out[0][0])

       if id_new != id_old:

           id_old = id_new;

           #Fetch data: nodeID
           cursor.execute("SELECT nodeID FROM tree_plot ORDER BY id DESC LIMIT 1;")
           dbConn.commit() #commit the insert
           out = cursor.fetchall()
           nodeID = int(out[0][0])
           print "nodeID = ", nodeID

           #Fetch data: parent
           cursor.execute("SELECT parent_plot FROM tree_plot ORDER BY id DESC LIMIT 1;")
           dbConn.commit() #commit the insert
           out = cursor.fetchall()
           parent_new = int(out[0][0])
           print "parent_new = ", parent_new

           #Fetch data: x
           cursor.execute("SELECT x FROM tree_plot ORDER BY id DESC LIMIT 1;")
           dbConn.commit() #commit the insert
           out = cursor.fetchall()
           x = int(out[0][0])
           print "x = ", x

           #Fetch data: y
           cursor.execute("SELECT y FROM tree_plot ORDER BY id DESC LIMIT 1;")
           dbConn.commit() #commit the insert
           out = cursor.fetchall()
           y = int(out[0][0])
           print "y = ", y

           (nodeID_old, parent_old) = edges [nodeID - 1]

           print "parent_new = ", (parent_new - 1)
           print "parent_old = ", parent_old

           # IF the node changes its parent
           if ( (parent_new - 1) != parent_old ) :

               #Build the edges and layout (X and Y position)
               edges [nodeID - 1] =  (nodeID - 1 , parent_new - 1)
               layout[nodeID - 1] =  (x,y)

               print(edges)
               print(layout)

               # Build Graph
               g = Graph(vertex_attrs={"label": vertices}, edges=edges, directed=True)

               #send the graph via a PIPE. We also send the layout (X and Y positions)
               parent_conn,child_conn = Pipe()
               p = Process(target=f, args=(child_conn,))
               p.start()
               parent_conn.send([g,layout])
               parent_conn.close()

           #Close cursor from mysql
           cursor.close()  #close the cursor

           #Wait 50miliseconds for the next evaluation
           time.sleep(0.05) #50miliseconds

    except MySQLdb.IntegrityError:
       print "failed to fetch data"
    finally:
       cursor.close()  #close just incase it failed
