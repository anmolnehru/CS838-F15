#!/bin/bash

echo "Start: " $(date +%s)  > $1_query$2.log

echo "VM-1 INFORMATION BEFORE QUERY" >> $1_query$2.log
ssh vm-1 "echo \"VM-1 Start: Network count\" && cat /proc/net/dev  "  >> $1_query$2.log
ssh vm-1 "echo \"VM-1 Start: Disk count\" && cat /proc/diskstats  "  >> $1_query$2.log

echo "VM-2 INFORMATION BEFORE QUERY"  >> $1_query$2.log
ssh vm-2 "echo \"VM-2 Start: Network count\" && cat /proc/net/dev  "  >> $1_query$2.log
ssh vm-2 "echo \"VM-2 Start: Disk count\" && cat /proc/diskstats  "  >> $1_query$2.log

echo "VM-3 INFORMATION BEFORE QUERY"  >> $1_query$2.log
ssh vm-3 "echo \"VM-3 Start: Network count\" && cat /proc/net/dev  " >> $1_query$2.log
ssh vm-3 "echo \"VM-3 Start: Disk count\" && cat /proc/diskstats  "  >> $1_query$2.log

echo "VM-4 INFORMATION BEFORE QUERY"  >> $1_query$2.log
ssh vm-4 "echo \"VM-4 Start: Network count\" && cat /proc/net/dev  "  >> $1_query$2.log
ssh vm-4 "echo \"VM-4 Start: Disk count\" && cat /proc/diskstats  "  >> $1_query$2.log

(time /home/ubuntu/software/spark-1.5.0-bin-hadoop2.6/bin/beeline -u jdbc:hive2://10.0.1.23:10000/tpcds_text_db_1_50 -n `whoami` -p ignored -f /home/ubuntu/workload/hive-tpcds-tpch-workload/sample-queries-tpcds/query$2.sql) 2> $1_query$2.out

echo "VM-1 INFORMATION AFTER QUERY"  >> $1_query$2.log
ssh vm-1 "echo \"VM-1 Stop: Network count\" && cat /proc/net/dev  "  >> $1_query$2.log
ssh vm-1 "echo \"VM-1 Stop: Disk count\" && cat /proc/diskstats  "  >> $1_query$2.log

echo "VM-2 INFORMATION AFTER QUERY"  >> $1_query$2.log
ssh vm-2 "echo \"VM-2 Stop: Network count\" && cat /proc/net/dev  "  >> $1_query$2.log
ssh vm-2 "echo \"VM-2 Stop: Disk count\" && cat /proc/diskstats  "  >> $1_query$2.log

echo "VM-3 INFORMATION AFTER QUERY"  >> $1_query$2.log
ssh vm-3 "echo \"VM-3 Stop: Network count\" && cat /proc/net/dev  "  >> $1_query$2.log
ssh vm-3 "echo \"VM-3 Stop: Disk count\" && cat /proc/diskstats  "  >> $1_query$2.log

echo "VM-4 INFORMATION AFTER QUERY"  >> $1_query$2.log
ssh vm-4 "echo \"VM-4 Stop: Network count\" && cat /proc/net/dev  "  >> $1_query$2.log
ssh vm-4 "echo \"VM-4 Stop: Disk count\" && cat /proc/diskstats  "  >> $1_query$2.log

echo "End: " $(date +%s)  >> $1_query$2.log

