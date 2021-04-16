#!/bin/bash

export DATE=`date`
echo $DATE >> 300111441/date_execution.txt

export TOP=`top`
echo $TOP >> 300111441/date_execution.txt
