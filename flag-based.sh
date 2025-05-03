#!/bin/bash

# ---------------------------------------------------------
# TASK 2 - FLAG-BASED SYSTEM MONITOR SCRIPT
# Author: Shiva
# Description: Display CPU, Memory, Disk stats using flags
# Flags:
#   -c : Show CPU usage
#   -m : Show Memory usage
#   -d : Show Disk usage
#   -a : Show All (CPU + Memory + Disk)
# ---------------------------------------------------------

show_cpu() {
  echo -e "\n🧠 CPU Usage:"
  uptime | awk -F'load average:' '{ print "Load Average:" $2 }'
  cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}' | cut -d'.' -f1)
  cpu_usage=$((100 - cpu_idle))
  echo "CPU Usage: ${cpu_usage}%"
}

show_memory() {
  echo -e "\n💾 Memory Usage:"
  free -m | awk 'NR==2{printf "Used: %s MB / Total: %s MB (%.2f%%)\n", $3, $2, $3*100/$2 }'
}

show_disk() {
  echo -e "\n💽 Disk Usage:"
  df -h / | awk 'NR==2{printf "Used: %s / Total: %s (%s used)\n", $3, $2, $5}'
}

# Main logic to parse flags
while getopts ":cmda" opt; do
  case $opt in
    c)
      show_cpu
      ;;
    m)
      show_memory
      ;;
    d)
      show_disk
      ;;
    a)
      show_cpu
      show_memory
      show_disk
      ;;
    \?)
      echo "❌ Invalid option: -$OPTARG"
      echo "Usage: $0 [-c] [-m] [-d] [-a]"
      exit 1
      ;;
  esac
done

# If no flag passed
if [ $OPTIND -eq 1 ]; then
  echo "⚠️  No option provided. Usage: $0 [-c] [-m] [-d] [-a]"
fi

