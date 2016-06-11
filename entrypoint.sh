#!/bin/bash

. ./config
/sbin/iptables-restore < /etc/iptables/rules.v4
/usr/sbin/iodined -f -c -P $PASSWORD -n $PUBLIC_IP -F /var/run/iodine/iodine.pid $INTERNAL_IP $PUBLIC_DOMAIN

