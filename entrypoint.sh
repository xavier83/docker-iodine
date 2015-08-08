#!/bin/bash

PUBLIC_IP=$1
INTERNAL_IP=$2
PUBLIC_DOMAIN=$3
/sbin/iptables-restore < /etc/iptables/rules.v4
/usr/sbin/iodined -f -c -P i0d1n3 -n $PUBLIC_IP -F /var/run/iodine/iodine.pid $INTERNAL_IP $PUBLIC_DOMAIN

