#!/bin/bash
CPU="\nTotal CPU Usage:"
RAM="\nTotal Memory:"
STORAGE="\nTotal Disk Usage:"
TOPCPU="\n\nTop 5 processes by CPU usage"
TOPRAM="\n\nTop 5 processes by memory usage"

echo -e $CPU 
top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8 "%"}'

echo -e $RAM
free -m | awk 'NR==2 {printf "Used: %dMB (%.2f%%) | Free: %dMB (%.2f%%)\n", $3, $3*100/$2, $4, $4*100/$2}'

echo -e $STORAGE
df -h / | awk 'NR==2 {printf "Used: %s (%s) | Free: %s (%s)\n", $3, $5, $4, 100-$5"%"}'

echo -e $TOPCPU
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

echo -e $TOPRAM
ps -eo pid,comm,%mem --sort=-%mem | head -n 6


