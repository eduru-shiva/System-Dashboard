#!/bin/bash

# -----------------------------------------------
# SYSTEM MONITOR DASHBOARD - TASK 1
# Author:  shiva
# Date:  03-may-2025
# Description: This script displays a simple system monitoring dashboard
# showing CPU usage, memory usage, disk usage, and top 5 processes.
# -----------------------------------------------

echo "+----------------------------------------------------------+"
echo "|             SYSTEM MONITOR DASHBOARD                     |"
echo "+----------------------------------------------------------+"

# 🧠 CPU USAGE
echo -e "\n🧠 CPU Usage:"
# Load average over 1, 5, and 15 minutes
uptime | awk -F'load average:' '{ print "Load Average:" $2 }'
# Current CPU usage using top command (get % idle and subtract from 100)
cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d'.' -f1)
cpu_usage=$((100 - cpu_idle))
echo "CPU Usage: ${cpu_usage}%"

# 💾 MEMORY USAGE
echo -e "\n💾 Memory Usage:"
# Total and used memory in MB
free -m | awk 'NR==2{printf "%s MB / %s MB (%.0f%%)\n", $3,$2,$3*100/$2 }'

# 💾 SWAP USAGE
echo "💾 Swap Usage:"
swap_used=$(free -m | awk 'NR==3 {print $3}')
if [ "$swap_used" -eq 0 ]; then
  echo "No Swap Used"
else
  free -m | awk 'NR==3{printf "%s MB / %s MB (%.0f%%)\n", $3,$2,$3*100/$2 }'
fi

# 💽 DISK USAGE
echo -e "\n💽 Disk Usage:"
# Show root partition usage
df -h / | awk 'NR==2 {print $5 " used"}'

# 🔧 PROCESS INFO
echo -e "\nActive Processes: $(ps aux --no-heading | wc -l)"

# Top 5 processes by CPU usage
echo "Top 5 Processes (by CPU usage):"
ps -eo user,pid,pcpu,pmem,comm --sort=-pcpu | head -n 6

# Top 5 processes by Memory usage
echo -e "\nTop 5 Processes (by Memory usage):"
ps -eo user,pid,pcpu,pmem,comm --sort=-pmem | head -n 6

