# This is a standard Dockerfile for building a app.
# It is a multi-stage build: the first stage compiles the Go source into a binary, and
#   the second stage copies only the binary into an alpine base.

# -- Stage 1 -- #
# Compile the app.
FROM b4tman/squid:latest as builder
USER root
RUN apk add apache2-utils
RUN touch /etc/squid/passwords
RUN chown squid:squid /etc/squid/passwords
# Bisa diganti disini ya username dan passwordnya.
ARG USER=user
ARG PASSWORD=password
RUN htpasswd -c -B -b /etc/squid/passwords ${USER} ${PASSWORD}
COPY ./squid.conf /etc/squid/squid.conf
USER squid