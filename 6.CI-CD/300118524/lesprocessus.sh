#!/bin/bash

export DATE=`date `
echo $DATE 

export BOOT=`systemd-analyze`
echo $BOOT 


#export UNITS=`systemctl list-units --type=service`
#echo $UNITS 
#export DEB=`uptime`
#echo $DEB 
