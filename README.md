# Resource-Monitoring
This service, monitors the CPU and memory used by a file given the name, and kills the process if the usage overloads the threshold given (./resource_monitor.sh &lt;cpu_usage_threshold> &lt;log_file>). The service starts after each boot and runs every 30 seconds. 
