#!/bin/bash

export DATE=`date '+%d/%m/%Y %H:%M:%S'`
echo $DATE 

export BOOT=`systemd-analyze`
echo $BOOT 


#export UNITS=`systemctl list-units --type=service`
#echo $UNITS 
#export DEB= `uptime`
#echo $DEB 
