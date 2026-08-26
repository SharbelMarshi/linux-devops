#!/bin/bash

echo "===== Server Performance Stats ====="
cpu_usage=$(top -bn1 | awk '/Cpu\(s\)/ {print 100 - $8}')
echo "Total CPU Usage: ${cpu_usage}%"

total_mem=$(free -m | awk '/Mem:/ {print $2}')
used_mem=$(free -m | awk '/Mem:/ {print $3}')

mem_percent=$(awk "BEGIN {printf \"%.2f\", ($used_mem/$total_mem)*100}")

echo "Memory Usage: ${used_mem}MB / ${total_mem}MB (${mem_percent}%)"

disk_total=$(df -h / | awk 'NR==2 {print $2}')
disk_used=$(df -h / | awk 'NR==2 {print $3}')
disk_free=$(df -h / | awk 'NR==2 {print $4}')
disk_percent=$(df -h / | awk 'NR==2 {print $5}')

echo "Disk Usage: $disk_used used / $disk_total total ($disk_percent), $disk_free free"

echo
echo "===== Top 5 Processes by CPU ====="
ps -eo user,pid,%cpu,%mem,comm --sort=-%cpu | head -n 6

echo
echo "===== Top 5 Processes by Memory ====="
ps -eo user,pid,%cpu,%mem,comm --sort=-%mem | head -n 6


