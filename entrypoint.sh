#!/bin/bash

if [ ! -f /.dockerenv ]; then
  exiterr "This script ONLY runs in a Docker container."
fi

if [ -z "$IODINE_PASSWORD" ]; then
  echo
  echo "Iodine credentials not set by user. Generating random PSK and password..."
  IODINE_PASSWORD="$(LC_CTYPE=C tr -dc 'A-HJ-NPR-Za-km-z2-9' < /dev/urandom | head -c 16)"
fi


PUBLIC_IP=${IODINE_PUBLIC_IP:-''}

# Try to auto discover server IPs
[ -z "$PUBLIC_IP" ] && PUBLIC_IP=$(dig @resolver1.opendns.com -t A -4 myip.opendns.com +short)
[ -z "$PUBLIC_IP" ] && PUBLIC_IP=$(wget -t 3 -T 15 -qO- http://whatismyip.akamai.com)

/sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
/usr/sbin/iodined -f -c -P "$IODINE_PASSWORD" -n "$PUBLIC_IP" -F /var/run/iodine/iodine.pid "$IODINE_LOCAL_IP" "$IODINE_DOMAIN"



cat <<EOF
================================================
Iodine server is now ready for use!
Connect to this iodine server with these details:
Server IP: $PUBLIC_IP
Local IP : $IODINE_LOCAL_IP
Password : $IODINE_PASSWORD
Domain   : $IODINE_DOMAIN
Write these down. You'll need them to connect!
Setup Iodine clients: http://code.kryo.se/iodine/
================================================
EOF
