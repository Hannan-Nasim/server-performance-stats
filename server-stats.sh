#!/bin/bash
echo "Server Performance Stats:"
echo "Total CPU usage:" 
top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}'
