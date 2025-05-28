#!/bin/bash
echo "Server Performance Stats:"
echo "Total CPU usage:" 
top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}'
echo "Total number of current logged in users:"
who -q | grep "# users" | grep -o '[0-9]\+'
