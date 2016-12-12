#!/usr/bin/env python

### FILE INFO
# Name:         sshTunnelServer.py
# Description:  Open a telnet connection through a reverse SSH connection and forward incomming
#               traffic an a seperate TCP socket.
# Author:       Florian Meissner <florianmeissner@gmx.de>
# Date:         2016/11/24
### FILE INFO END


import sys
import socket

bindAddr= ""
sbsPort = 30003

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((bindAddr, sbsPort))
s.listen(1)
#print "Bound to %s:%s." % (bindAddr, sbsPort)
#s.setblocking(0)

try:
    while True:
        comm, addr = s.accept()
        #print "Connection from %s accepted." % addr[0]
        while True:
            line = sys.stdin.readline()
            if not line:
                break
            #print line
            try:
                comm.send(line)
            except socket.error:
                comm.close()
                break
            #print "Message send"

except KeyboardInterrupt:
    pass

finally:
        s.close()
