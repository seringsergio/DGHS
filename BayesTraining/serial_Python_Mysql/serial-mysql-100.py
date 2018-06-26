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

   if pieces[0] in ['CSMA']:
       print "pieces[0]=",pieces[0]
       print "pieces[1]=",pieces[1]
       print "pieces[2]=",pieces[2]
       print "pieces[3]=",pieces[3]
       print "pieces[4]=",pieces[4]
       print "pieces[5]=",pieces[5]
       print "pieces[6]=",pieces[6]
       print "pieces[7]=",pieces[7]
       print "pieces[8]=",pieces[8]
       print "pieces[9]=",pieces[9]
       print "pieces[10]=",pieces[10]
       print "pieces[11]=",pieces[11]
       print "pieces[12]=",pieces[12]
       print "pieces[13]=",pieces[13]
       print "pieces[14]=",pieces[14]
       print "pieces[15]=",pieces[15]
       print "pieces[16]=",pieces[16]
       print "pieces[17]=",pieces[17]
       print "pieces[18]=",pieces[18]
       print "pieces[19]=",pieces[19]
       print "pieces[20]=",pieces[20]
       print "pieces[21]=",pieces[21]
       print ""
       #Here we are going to insert the data into the Database
       try:
          cursor.execute("INSERT INTO int_100_tx (id,num_packets,btp,EWMA_btp_09,EWMA_btp_08,\
                          EWMA_btp_07,EWMA_btp_06,EWMA_btp_05,EWMA_btp_04,                  \
                          EWMA_btp_03,EWMA_btp_02,EWMA_btp_01,ppl,                          \
                          EWMA_ppl_09,EWMA_ppl_08,EWMA_ppl_07,EWMA_ppl_06,EWMA_ppl_05,      \
                          EWMA_ppl_04,EWMA_ppl_03,EWMA_ppl_02,EWMA_ppl_01)                  \
                          VALUES (NULL,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,                 \
                          %s,%s,%s,%s,%s,                                                   \
                          %s,%s,%s,%s)",                                                    \
                          (pieces[1],pieces[2],pieces[3],pieces[4],pieces[5],pieces[6],     \
                          pieces[7],pieces[8],pieces[9],pieces[10],pieces[11],pieces[12],   \
                          pieces[13],pieces[14],pieces[15],pieces[16],pieces[17],           \
                          pieces[18],pieces[19],pieces[20],pieces[21]))
          dbConn.commit() #commit the insert
          cursor.close()  #close the cursor
       except MySQLdb.IntegrityError:
          print "failed to insert data"
       finally:
          cursor.close()  #close just incase it failed
 except:
    print "Failed to get data from the node"
