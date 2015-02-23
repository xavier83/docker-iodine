#!/bin/bash

echo "Hello World"
/sbin/iptables-restore < /etc/iptables/rules.v4
/usr/sbin/iodined -f -c -P i0d1n3 -n $PUBLIC_IP -F /var/run/iodine/iodine.pid 192.168.108.13 $PUBLIC_DOMAINNAME

