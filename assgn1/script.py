#!/usr/bin/python

import sys

f1 = open(sys.argv[1], "r")
lines = f1.readlines()

x=lines[24];
#print x
a = x.split(" ")
#if a[12].isdigit():
#	print a[12]
#if a[16].isdigit():
#	print a[16]
#print "junk"

before_reads_dev0 = a[12]
before_writes_dev0=a[16]


x=lines[25];

#print x
a = x.split(" ")
#if a[12].isdigit():
#       print a[12]
#if a[16].isdigit():
#       print a[16]
#print "junk"
before_reads_dev1 = a[12]
before_writes_dev1=a[16]


f1.close()


####################################

#VDA1

f2 = open(sys.argv[2], "r")

lines = f2.readlines()

x=lines[24];
a = x.split(" ")
after_reads_dev0 = a[12]
after_writes_dev0=a[16]


x=lines[25];
a = x.split(" ")
after_reads_dev1 = a[12]
after_writes_dev1=a[16]

f2.close()

delta_reads_dev0 = int(after_reads_dev0) - int(before_reads_dev0)
delta_writes_dev0 = int(after_writes_dev0)- int(before_writes_dev0)


delta_reads_dev1 = int(after_reads_dev1) - int(before_reads_dev1)

delta_writes_dev1 = int(after_writes_dev1)- int(before_writes_dev1)


print delta_reads_dev0,',',delta_writes_dev0,',',delta_reads_dev1,',',delta_writes_dev1

#print "delta writes=" %delta_writes
