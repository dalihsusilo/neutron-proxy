FROM ubuntu/squid:latest as builder
RUN apt update && apt upgrade -y && apt install apache2-utils -y
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* 
RUN touch /etc/squid/squid_passwd
ARG USER=user
ARG PASSWORD=password
RUN htpasswd -c -b /etc/squid/squid_passwd ${USER} ${PASSWORD}
COPY ./squid.conf /etc/squid/squid.conf
