#!/bin/bash

export JOURNAL=`systemd-analyze`
echo $JOURNAL 
#systemctl list-units --type=service

export VAR=`top`
echo $VAR 

export DEB= `uptime`
echo $DEB 
