#!/bin/bash

### FILE INFO
# Name:         sshTunnelServer.sh
# Description:  Open a telnet connection through a reverse SSH connection and pipe incomming
#               traffic to a seperate TCP socket.
# Author:       Florian Meissner <florianmeissner@gmx.de>
# Date:         2016/11/24
### FILE INFO END

receiverAddr='localhost'
receiverUser='pi'
reversePort='13889'
sbsPort='30003'
tcpServer="./tcpServer.py"

ssh $receiverUser@$receiverAddr -p $reversePort telnet localhost $sbsPort | $tcpServer
