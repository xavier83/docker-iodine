from ubuntu:latest

RUN apt-get update
RUN apt-get install -y iodine iptables iptables-persistent
COPY firerules.txt /etc/iptables/rules.v4
COPY entrypoint.sh /
COPY config /

CMD /bin/bash /entrypoint.sh EXTERNAL_IP INTERNAL_IP DOMAIN_NAME

EXPOSE 53
