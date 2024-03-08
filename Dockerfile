# This is a standard Dockerfile for building a app.
# It is a multi-stage build: the first stage compiles the Go source into a binary, and
#   the second stage copies only the binary into an alpine base.

# -- Stage 1 -- #
# Compile the app.
FROM b4tman/squid:latest as builder
WORKDIR /root/
COPY ./squid.conf /etc/squid/squid.conf
EXPOSE 3128/tcp