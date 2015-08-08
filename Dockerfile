from ubuntu:latest

ENV PUBLIC_IP
ENV INTERNAL_IP
ENV PUBLIC_DOMAIN
RUN apt-get update
RUN apt-get install -y iodine iptables iptables-persistent
COPY firerules.txt /etc/iptables/rules.v4
COPY entrypoint.sh /

CMD ["/bin/bash","/entrypoint.sh",{PUBLIC_IP},{INTERNAL_IP},{PUBLIC_DOMAIN}]

EXPOSE 53
