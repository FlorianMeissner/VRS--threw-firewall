#!/bin/bash

### FILE INFO
# Name:         sshTunnelReceiver.sh
# Description:  Open a SSH tunnel to a known host for reverse SSH.
# Author:       Florian Meissner <florianmeissner@gmx.de>
# Date:         2016/11/24
### FILE INFO END

serverAddr='192.168.222.102'
serverUser='florian'
serverPort='22'
reversePort='13889'

ssh -R $reversePort:localhost:$serverPort $serverUser@$serverAddr
