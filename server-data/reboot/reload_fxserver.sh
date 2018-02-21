#!/bin/bash
echo "***********************************************************"
echo `date '+%d-%B-%Y_%H:%M:%S'` " - Starting procedure..."
sleep 2
echo `date '+%d-%B-%Y_%H:%M:%S'` " - Stopping server..."
pkill screen
sleep 10
echo `date '+%d-%B-%Y_%H:%M:%S'`" - Restart mysql service..."
sudo service mysql restart
sleep 10
echo `date '+%d-%B-%Y_%H:%M:%S'` " - Emptying cache..."
rm -R /home/gta5/server-data/cache
sleep 5
echo `date '+%d-%B-%Y_%H:%M:%S'` " - Starting server..."
screen -L ServerLog/`date '+%Y-%m-%d_%H:%M:%S'` -d -m bash /home/gta5/reboot//RunServer.sh
sleep 15
echo `date '+%d-%B-%Y_%H:%M:%S'` " - End procedure"
