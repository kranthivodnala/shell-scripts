#!/bin/bash

###########################
# Author: Kranthi K Vodnala
# Date: 04/08/2025
# This Script outputs the node health
# Version: v1
###########################

set -x # debug mode
set -e # exit the script when there is an error
set -o pipefail # Script will exit if there is a error in the command before or after pipe
df -h # To check the space 
free -g # To check the memory space 
nproc # To check the CPU's
ps -ef | grep amazon | awk -F" " '{print $2}'
