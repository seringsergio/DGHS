#!/usr/bin/python
import serial
import MySQLdb

#establish connection to MySQL. You'll have to change this for your database.
#dbConn = MySQLdb.connect("localhost","database_username","password","database_name") or die ("could not connect to database")
dbConn = MySQLdb.connect("localhost","root","1234","sink") or die ("Could not connect to database")
#open a cursor to the database
#cursor = dbConn.cursor()

#device = '/dev/tty.usbmodem1411' #this will have to be changed to the serial port you are using
device = '/dev/ttyUSB6' #this will have to be changed to the serial port you are using
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

   if pieces[0] in ['DET_INT']:
       print "pieces[0]=",pieces[0]
       print "pieces[1]=",pieces[1]
       print ""
       #Here we are going to insert the data into the Database
       try:
          # I have to insert minimum 2 data plus id. So, it is necesary to have 1 redundant data: det_int_redundant
          cursor.execute("INSERT INTO det_int_20_EWMA_07 (id, det_int, det_int_redundant) VALUES (NULL,%s,%s)", (pieces[1],pieces[1]))
          dbConn.commit() #commit the insert
          cursor.close()  #close the cursor
       except MySQLdb.IntegrityError:
          print "failed to insert data"
       finally:
          cursor.close()  #close just incase it failed
 except:
    print "Failed to get data from the node"
