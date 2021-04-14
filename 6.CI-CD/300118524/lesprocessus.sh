#!/bin/bash

export JOURNAL=`systemctl list-units --type=service`
echo $JOURNAL 

export VAR=`top`
echo $VAR 

export DEB= `uptime`
echo $DEB 
