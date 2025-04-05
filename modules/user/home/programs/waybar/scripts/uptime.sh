#!/bin/sh
uptime_hr=$(uptime --pretty | sed 's/up //')
hostname=$(hostname)
kernel=$(uname -r)

# Output in JSON format
echo "{\"text\": \"\", \"tooltip\": \"Uptime: ${uptime_hr}\nHost: ${hostname}\nKernel: ${kernel}\"}"