from igraph import *
import matplotlib.pyplot as plt
import sys
import serial
import MySQLdb
from time import sleep

print "usage: python tree-plot.py <Number of nodes> "
print "Number of nodes = ", sys.argv[1]


#vertices = ["1", "2", "3"]
vertices = [ (i+1) for i in range( int(sys.argv[1]) )] # (nodeID)
print "vertices = ", vertices

#edges = [(0,0),(0,0),(0,0)]
#edges[0] = (0,1)
#edges[1] = (1,2)
#edges[2] = (2,0)
edges = [ (0,0) for i in range( int(sys.argv[1]) )] #(node,parent) ...we have to subtract 1...in other words, node - 1 and parent - 1
print "edges = ", edges


#layout = [(10,10), (20,20), (10,30)]
layout = [ (0,0) for i in range( int(sys.argv[1]) )] # (x,y)
print "layout = ", layout

#connet to the database
dbConn = MySQLdb.connect("localhost","root","1234","sink") or die ("Could not connect to database")

#this will have to be changed to the serial port you are using
device = '/dev/ttyUSB0'

try:
  print "Trying...",device
  skyMote = serial.Serial(device, 115200)
except:
  print "Failed to connect on",device
while True:
 #open a cursor to the database
 cursor = dbConn.cursor()
 try:
   data = skyMote.readline()  #read the data from the nde
   pieces = data.split("/")  #split the data by the tab

   if pieces[0] in ['MSG']:
       print "pieces[0]=",pieces[0]
       print "pieces[1]=",pieces[1]
       print "pieces[2]=",pieces[2]
       print "pieces[3]=",pieces[3]
       print "pieces[4]=",pieces[4]
       print "pieces[5]=",pieces[5]
       print "pieces[6]=",pieces[6]
       print "pieces[7]=",pieces[7]
       #Plot tree
       #print "nodeID = ", int(pieces[1]) - 1
       #print "parent = ", int(pieces[5]) - 1
       edges [int(pieces[1]) - 1] =  (int(pieces[1]) - 1 , int(pieces[5]) - 1)
       layout[int(pieces[1]) - 1] =  (int(pieces[3])     , int(pieces[4])    )
       print(edges)
       print(layout)

       g = Graph(vertex_attrs={"label": vertices}, edges=edges, directed=True)

       g.es["color"] = "black"
       g.vs['color'] = "white"

       plot(g, layout=layout)


       #Here we are going to insert the data into the Database
       try:
         cursor.execute("INSERT INTO msg (id, nodeID, seqno, x, y, parent, tempC, VDD) VALUES (NULL,%s,%s,%s,%s,%s,%s,%s)", (pieces[1],pieces[2],pieces[3],pieces[4],pieces[5],pieces[6],pieces[7]))
         dbConn.commit() #commit the insert
         cursor.close()  #close the cursor
       except MySQLdb.IntegrityError:
         print "failed to insert data"
       finally:
         cursor.close()  #close just incase it failed
 except:
  print "Failed to get data from the node"

     #edges[int(pieces[1])-1] = (int(pieces[1])-1,int(pieces[5])-1)
     #print(int(pieces[1])-1)
#g = Graph(vertex_attrs={"label": vertices}, edges=edges, directed=True)


#g.es["color"] = "black"
#g.vs['color'] = "white"

#plot(g, layout=layout)
