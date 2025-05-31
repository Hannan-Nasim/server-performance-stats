#!/bin/bash
echo "Server Performance Stats:"
echo "-------------------------"
echo ""
echo "Total CPU usage:" 
echo "----------------"
top -bn1 | awk -F',' '/Cpu\(s\)/ {for(i=1; i<=NF; i++) {if ($i ~ /id/) {split($i, a, " "); idle = a[1]; usage = 100 - idle; printf("%.1f\n", usage)}}}'
echo ""
echo "Total memory usage:" 
echo "----------------"
free -h | awk 'NR==2 { total=$2; used=$3; avail=$7; perc=used/total*100; printf("Total: %s, Used: %s, Available: %s, Usage: %.2f%%\n", total, used, avail, perc) }'
echo ""
echo "Total disk usage:" 
echo "----------------"
df -h / | tail -1 | awk '{print "Total: "$2", Used: "$3", Free: "$4", Usage: "$5}'
echo ""
echo "OS Version:"
echo "-----------"
awk -F= '/^VERSION=/ { gsub(/"/, "", $2); print $2 }' /etc/os-release
echo ""
echo "Total number of current logged in users:"
echo "----------------------------------------"
who -q | grep "# users" | grep -o '[0-9]\+'
