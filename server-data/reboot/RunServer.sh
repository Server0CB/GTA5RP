#!/bin/bash

#config
FXSERVERDATA=/home/gta5/server-data
FXSERVER=/home/gta5

#script
echo `date '+%d-%B-%Y_%H:%M:%S'`" - launching server..."
sleep 2
cd $FXSERVERDATA
bash $FXSERVER/run.sh +exec server.cfg
