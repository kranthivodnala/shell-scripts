#!bin/bash

web=www.google.com

if ping $web # Check if the web is reachable using ping command
then
    echo "$web is reachable"
else
    echo "$web is not reachable"
fi