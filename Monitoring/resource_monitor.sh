#!/bin/bash

# Reading the user's inputs
cpu_usage_threshold=$1
log_file=$2

# Creating a file with the name provided
touch $log_file

# Writing the date to the file created
date >> $log_file

# Finding the CPU & the Memory used by the system
cpuUsage=$(top -bn1 | awk '/Cpu/ { print $2}')
memUsage=$(free -m | awk '/Mem/ { print $3}')

# Writing the numbers to the files
echo CPU Usage: $cpuUsage % >> $log_file
echo Memory Usage: $memUsage MB >> $log_file

# Finding the higher-than-threshold CPU user
PIDs=$(top -bn1 -o %CPU | awk -v cpu_usage_threshold="$cpu_usage_threshold" 'NR>7 && $9>cpu_usage_threshold { print $1 }' )

# Store the PIDs in the log file 
echo Killed Process PID"("s")" using more than $cpu_usage_threshold % CPU: $PIDs >> $log_file

# Kill them
kill $PIDs
