#!/bin/sh
arr=(216.58.196.174 216.58.222.174 172.217.166.50 172.217.166.15)

min=30

for c in 0 1 2 3
do
   a=$(traceroute "${arr[$c]}" | less | wc -l)
   ((a=a-1))
   echo "Hops for address ${arr[$c]} are ${a}"
   if [ $a -lt $min ]
   then
       min=$a
       addrs=${arr[$c]}
   else
   	continue
   fi
done   

echo "Min Hops: ${min} for address ${addrs}"
echo "Opening Firefox"

firefox "${addrs}"
