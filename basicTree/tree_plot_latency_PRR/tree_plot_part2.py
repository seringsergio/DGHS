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


##The first 10 nodes represent the different interference where a node can be. We plot 10 nodes with 10 colors,
# representing a degree of interference

import MySQLdb
import sys
from igraph import *
import time
from multiprocessing import Process,Pipe
from tree_plot_part3 import f
from colour import Color

num_colors = 10
# Define a vector of colors from green to red with 10 positions
green = Color("green")
colors_green_red = list(green.range_to(Color("red"),num_colors))

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
vertices = [ (i+1) for i in range( int(sys.argv[1]) + num_colors )] # (nodeID)

#Edges of the graph
edges               = [ (i,i) for i in range( int(sys.argv[1]) + num_colors )] #(node,parent) ...we have to subtract 1...in other words, node - 1 and parent - 1
edges_without_loops = [ (i,i) for i in range( int(sys.argv[1]) + num_colors )] #(node,parent) ...we have to subtract 1...in other words, node - 1 and parent - 1

# X and Y position of the graph = layout
layout = [ (i*num_colors,0) for i in range( int(sys.argv[1]) + num_colors )] # (x,y)

# Distance from the center of the node. To fix the position of the labels (text)
# -0.5 is de distance from the node. - is upwards, + is downwards
LabelDist = [ (-0.5) for i in range( int(sys.argv[1]) + num_colors )]

# Text of each node
node_text = [ (i*10) for i in range( int(sys.argv[1]) + num_colors )]

#estimated_interference
est_int = [ (0) for i in range( int(sys.argv[1]) + num_colors )]

# Color of the nodes according to the interference. We assign colors.
node_color = [ (str(colors_green_red[i%num_colors])) for i in range( int(sys.argv[1]) + num_colors )]

while True:
    #open a cursor to the database
    cursor = dbConn.cursor()
    try:
       #Fetch data: id
       cursor.execute("SELECT id FROM tree_plot ORDER BY id DESC LIMIT 1;")
       dbConn.commit() #commit the insert
       out = cursor.fetchall()
       id_new = int(out[0][0])

       #Avoid plotting the same message
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

           #Fetch data: est_int
           cursor.execute("SELECT est_int FROM tree_plot ORDER BY id DESC LIMIT 1;")
           dbConn.commit() #commit the insert
           out = cursor.fetchall()
           est_int_new = float(out[0][0])
           print "est_int_new = ", est_int_new

           #Parent_old
           (nodeID_old, parent_old) = edges [(nodeID - 1) + num_colors]

           print "parent_new = ", (parent_new - 1 + num_colors)
           print "parent_old = ", parent_old
           print ""

           #estimated_interference_old
           est_int_old = est_int[(nodeID - 1) + num_colors]

           #Build the layout (X and Y position)
           layout[(nodeID - 1) + num_colors]      =  (x,y)

           # IF the node changes its parent or The difference between the est_int_new and est_int_old is larger than 0.5%
           if ( ( (parent_new - 1 + num_colors) != parent_old )  or ( abs(est_int_new - est_int_old) >= 0.5 )  ) :

               #Build the edges
               edges [(nodeID - 1) + num_colors]      =  ((nodeID - 1) + num_colors , parent_new - 1 + num_colors)

               #Estimated_interference, text_of_the_node
               est_int[(nodeID - 1) + num_colors]     =  est_int_new
               node_text[(nodeID - 1) + num_colors]   =  str(vertices[(nodeID - 1)]) + "\n\n" + str(est_int_new)

               # Node color according to the interference
               if( (est_int_new >= 0) and (est_int_new < 10)  ) :
                    node_color[(nodeID - 1) + num_colors]    =  str(colors_green_red[0])
               elif( (est_int_new >= 10) and (est_int_new < 20)  ) : #else if
                    node_color[(nodeID - 1) + num_colors]    =  str(colors_green_red[1])
               elif( (est_int_new >= 20) and (est_int_new < 30)  ) : #else if
                    node_color[(nodeID - 1) + num_colors]    =  str(colors_green_red[2])
               elif( (est_int_new >= 30) and (est_int_new < 40)  ) : #else if
                    node_color[(nodeID - 1) + num_colors]    =  str(colors_green_red[3])
               elif( (est_int_new >= 40) and (est_int_new < 50)  ) : #else if
                    node_color[(nodeID - 1) + num_colors]    =  str(colors_green_red[4])
               elif( (est_int_new >= 50) and (est_int_new < 60)  ) : #else if
                    node_color[(nodeID - 1) + num_colors]    =  str(colors_green_red[5])
               elif( (est_int_new >= 60) and (est_int_new < 70)  ) : #else if
                    node_color[(nodeID - 1) + num_colors]    =  str(colors_green_red[6])
               elif( (est_int_new >= 70) and (est_int_new < 80)  ) : #else if
                    node_color[(nodeID - 1) + num_colors]    =  str(colors_green_red[7])
               elif( (est_int_new >= 80) and (est_int_new < 90)  ) : #else if
                    node_color[(nodeID - 1) + num_colors]    =  str(colors_green_red[8])
               elif( (est_int_new >= 90) and (est_int_new <= 100) ) : #else if
                    node_color[(nodeID - 1) + num_colors]    =  str(colors_green_red[9])


               ####################BUILD edges_without_loops #########################
               #Initialize edges_without_loops
               edges_without_loops = [ (i,i) for i in range( int(sys.argv[1]) + num_colors )] #(node,parent) ...we have to subtract 1...in other words, node - 1 and parent - 1
               #Backward for: Starts from 12, Ends in 0
               for i in range( int(sys.argv[1]) + num_colors - 1, -1, -1): # range(start, stop, step)
                   edges_without_loops[i] = edges[i] # Guardo edges en el vector donde no van a haber loops
                   (nodeID_temp, parent_temp) = edges[i]
                   if(nodeID_temp == parent_temp):
                       del edges_without_loops[i]

               print"edges =",edges
               print"layout =",layout
               print"edges_without_loops =",edges_without_loops
               ########################################################################

               # Build the igraph
               g = Graph(vertex_attrs={"label": node_text, "label_dist": LabelDist } , \
                         edges=edges_without_loops, directed=True )
               #Color of the node according to the interference
               g.vs["color"] = node_color

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
       cursor.close()  #close just incase it failed.
