FROM phusion/baseimage:latest
MAINTAINER Infanta Xavier <xavier8338@yahoo.com>

RUN apt-get update
RUN apt-get install -y net-tools iptables iodine
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 53

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
