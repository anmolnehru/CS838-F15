#!/bin/bash


echo "Start: " $(date +%s)  > query71_output

echo "VM-1 INFORMATION BEFORE QUERY" >> query71_output
ssh vm-1 "echo \"VM-1 Start: Network count\" && cat /proc/net/dev  "  >> query71_output
ssh vm-1 "echo \"VM-1 Start: Disk count\" && cat /proc/diskstats  "  >> query71_output


echo "VM-2 INFORMATION BEFORE QUERY"  >> query71_output
ssh vm-2 "echo \"VM-2 Start: Network count\" && cat /proc/net/dev  "  >> query71_output
ssh vm-2 "echo \"VM-2 Start: Disk count\" && cat /proc/diskstats  "  >> query71_output

echo "VM-3 INFORMATION BEFORE QUERY"  >> query71_output
ssh vm-3 "echo \"VM-3 Start: Network count\" && cat /proc/net/dev  " >> query71_output
ssh vm-3 "echo \"VM-3 Start: Disk count\" && cat /proc/diskstats  "  >> query71_output


echo "VM-4 INFORMATION BEFORE QUERY"  >> query71_output
ssh vm-4 "echo \"VM-4 Start: Network count\" && cat /proc/net/dev  "  >> query71_output
ssh vm-4 "echo \"VM-4 Start: Disk count\" && cat /proc/diskstats  "  >> query71_output

(time /home/ubuntu/software/spark-1.5.0-bin-hadoop2.6/bin/beeline -u jdbc:hive2://10.0.1.23:10000/tpcds_text_db_1_50 -n `whoami` -p ignored -f hive-tpcds-tpch-workload/sample-queries-tpcds/query71.sql) 2> hive-tpcds-tpch-workload/assign_2/output/tpcds_query71_spark_check.out

echo "" >> query71_output
echo "" >> query71_output

echo "VM-1 INFORMATION AFTER QUERY"  >> query71_output
ssh vm-1 "echo \"VM-1 Stop: Network count\" && cat /proc/net/dev  "  >> query71_output
ssh vm-1 "echo \"VM-1 Stop: Disk count\" && cat /proc/diskstats  "  >> query71_output

echo "VM-2 INFORMATION AFTER QUERY"  >> query71_output
ssh vm-2 "echo \"VM-2 Stop: Network count\" && cat /proc/net/dev  "  >> query71_output
ssh vm-2 "echo \"VM-2 Stop: Disk count\" && cat /proc/diskstats  "  >> query71_output

echo "VM-3 INFORMATION AFTER QUERY"  >> query71_output
ssh vm-3 "echo \"VM-3 Stop: Network count\" && cat /proc/net/dev  "  >> query71_output
ssh vm-3 "echo \"VM-3 Stop: Disk count\" && cat /proc/diskstats  "  >> query71_output

echo "VM-4 INFORMATION AFTER QUERY"  >> query71_output
ssh vm-4 "echo \"VM-4 Stop: Network count\" && cat /proc/net/dev  "  >> query71_output
ssh vm-4 "echo \"VM-4 Stop: Disk count\" && cat /proc/diskstats  "  >> query71_output



echo "End: " $(date +%s)  >> query71_output
