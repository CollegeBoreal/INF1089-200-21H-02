#!/bin/bash

export JOURNAL=`journalctl`
echo $JOURNAL

export VAR=`top`
echo $VAR 

export DEB= `uptime`
echo $DEB
