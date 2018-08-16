#!/usr/bin/python
import serial
import MySQLdb

#establish connection to MySQL. You'll have to change this for your database.
#dbConn = MySQLdb.connect("localhost","database_username","password","database_name") or die ("could not connect to database")
dbConn = MySQLdb.connect("localhost","root","1234","sink") or die ("Could not connect to database")
#open a cursor to the database
#cursor = dbConn.cursor()

#device = '/dev/tty.usbmodem1411' #this will have to be changed to the serial port you are using
device = '/dev/ttyUSB1' #this will have to be changed to the serial port you are using
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
        pieces = data.split(" ")  #split the data by the tab
        if pieces[0] in ['DET_INT']:
            print "pieces[0]=",pieces[0]
            print "pieces[1]=",pieces[1]
            print ""
            #Here we are going to insert the data into the Database
            try:
                # I have to insert minimum 2 data plus id. So, it is necesary to have 1 redundant data: det_int_redundant
                cursor.execute("INSERT INTO det_int_0_wind_15 (id, det_int, det_int_redundant) VALUES (NULL,%s,%s)", (pieces[1],pieces[1]))
                dbConn.commit() #commit the insert
                cursor.close()  #close the cursor
            except MySQLdb.IntegrityError:
                print "failed to insert data"
            finally:
                cursor.close()  #close just incase it failed

        #Valores que llegan de Powertrace
        # 0.  str: No envio ninguna string. Entonces esta vacia. No se ve nada
        # 1.  clock_time
        # 2.  P
        # 3.  linkaddr_node_addr
        # 4.  seqno
        # 5.  all_cpu
        # 6.  all_lpm
        # 7.  all_transmit
        # 8.  all_listen
        # 9.  all_idle_transmit
        # 10. all_idle_listen
        # 11. cpu
        # 12. lpm
        # 13. transmit
        # 14. listen
        # 15. idle_transmit
        # 16. idle_listen

        elif pieces[2] in ['P']:
            print "str=",pieces[0]
            print "clock_time=",pieces[1]
            print "P=",pieces[2]
            print "linkaddr_node_addr=",pieces[3]
            print "seqno=",pieces[4]
            print "all_cpu=",pieces[5]
            print "all_lpm=",pieces[6]
            print "all_transmit=",pieces[7]
            print "all_listen=",pieces[8]
            print "all_idle_transmit=",pieces[9]
            print "all_idle_listen=",pieces[10]
            print "cpu=",pieces[11]
            print "lpm=",pieces[12]
            print "transmit=",pieces[13]
            print "listen=",pieces[14]
            print "idle_transmit=",pieces[15]
            print "idle_listen=",pieces[16]
            print ""
            #Here we are going to insert the data into the Database
            try:

                # create table powertrace_wind_15 (
                # id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
                # clock_time INT(11) NOT NULL,
                # linkaddr_node_addr DECIMAL(5,2) NOT NULL,
                # seqno INT(11) NOT NULL,
                # all_cpu INT(11) NOT NULL,
                # all_lpm INT(11) NOT NULL,
                # all_transmit INT(11) NOT NULL,
                # all_listen INT(11) NOT NULL,
                # all_idle_transmit INT(11) NOT NULL,
                # all_idle_listen INT(11) NOT NULL,
                # cpu INT(11) NOT NULL,
                # lpm INT(11) NOT NULL,
                # transmit INT(11) NOT NULL,
                # listen INT(11) NOT NULL,
                # idle_transmit INT(11) NOT NULL,
                # idle_listen INT(11) NOT NULL,
                # date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
                # );

                # I have to insert minimum 2 data plus id. So, it is necesary to have 1 redundant data: det_int_redundant
                cursor.execute("INSERT INTO powertrace_wind_15_int_0 (id, clock_time, linkaddr_node_addr,                \
                                seqno, all_cpu, all_lpm, all_transmit, all_listen, all_idle_transmit, all_idle_listen,  \
                                cpu, lpm, transmit, listen, idle_transmit, idle_listen)                                 \
                VALUES (NULL,%s,%s,%s,%s,                                                                               \
                             %s,%s,%s,%s,                                                                               \
                             %s,%s,%s,%s,                                                                               \
                             %s,%s,%s     )",                                                                           \
                             (pieces[1],pieces[3],pieces[4],pieces[5],pieces[6],pieces[7],pieces[8],pieces[9],          \
                              pieces[10],pieces[11],pieces[12],pieces[13],pieces[14],pieces[15],pieces[16]  ))
                dbConn.commit() #commit the insert
                cursor.close()  #close the cursor
            except MySQLdb.IntegrityError:
                print "failed to insert data"
            finally:
                cursor.close()  #close just incase it failed
    except:
        print "Failed to get data from the node"
