
echo "VM-1 INFORMATION BEFORE QUERY"
ssh vm-1 "echo \"VM-1 Start: Network count\" && cat /proc/net/dev  "
ssh vm-1 "echo \"VM-1 Start: Disk count\" && cat /proc/diskstats  "


echo "VM-2 INFORMATION BEFORE QUERY"
ssh vm-2 "echo \"VM-2 Start: Network count\" && cat /proc/net/dev  "
ssh vm-2 "echo \"VM-2 Start: Disk count\" && cat /proc/diskstats  "

echo "VM-3 INFORMATION BEFORE QUERY"
ssh vm-3 "echo \"VM-3 Start: Network count\" && cat /proc/net/dev  "
ssh vm-3 "echo \"VM-3 Start: Disk count\" && cat /proc/diskstats  "


echo "VM-4 INFORMATION BEFORE QUERY"
ssh vm-4 "echo \"VM-4 Start: Network count\" && cat /proc/net/dev  "
ssh vm-4 "echo \"VM-4 Start: Disk count\" && cat /proc/diskstats  "





echo "VM-1 INFORMATION AFTER QUERY"
ssh vm-1 "echo \"VM-1 Stop: Network count\" && cat /proc/net/dev  "
ssh vm-1 "echo \"VM-1 Stop: Disk count\" && cat /proc/diskstats  "

echo "VM-2 INFORMATION AFTER QUERY"
ssh vm-2 "echo \"VM-2 Stop: Network count\" && cat /proc/net/dev  "
ssh vm-2 "echo \"VM-2 Stop: Disk count\" && cat /proc/diskstats  "

echo "VM-3 INFORMATION AFTER QUERY"
ssh vm-3 "echo \"VM-3 Stop: Network count\" && cat /proc/net/dev  "
ssh vm-3 "echo \"VM-3 Stop: Disk count\" && cat /proc/diskstats  "

echo "VM-4 INFORMATION AFTER QUERY"
ssh vm-4 "echo \"VM-4 Stop: Network count\" && cat /proc/net/dev  "
ssh vm-4 "echo \"VM-4 Stop: Disk count\" && cat /proc/diskstats  "




