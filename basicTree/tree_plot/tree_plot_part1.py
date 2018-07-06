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

import serial
import MySQLdb

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

   if pieces[0] in ['TREE_PLOT']:

       print "pieces[0]=",pieces[0]
       print "pieces[1]=",pieces[1]
       print "pieces[2]=",pieces[2]
       print "pieces[3]=",pieces[3]
       print "pieces[4]=",pieces[4]
       print "pieces[5]=",pieces[5]
       print "pieces[6]=",pieces[6]

       #Here we are going to insert the data into the Database
       try:
         cursor.execute("INSERT INTO msg (id, nodeID, seqno, x, y, parent_plot, est_int) VALUES (NULL,%s,%s,%s,%s,%s,%s)", (pieces[1],pieces[2],pieces[3],pieces[4],pieces[5],pieces[6]))
         dbConn.commit() #commit the insert
         cursor.close()  #close the cursor
       except MySQLdb.IntegrityError:
         print "failed to insert data"
       finally:
         cursor.close()  #close just incase it failed
 except:
  print "Failed to get data from the node"
