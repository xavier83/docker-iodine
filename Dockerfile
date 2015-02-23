from ubuntu:latest

RUN apt-get update
RUN apt-get install -y iodine iptables iptables-persistent
COPY firerules.txt /etc/iptables/rules.v4
COPY entrypoint.sh /

CMD ["/bin/bash","/entrypoint.sh"]

EXPOSE 53
