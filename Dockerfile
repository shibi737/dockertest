# Basic nginx dockerfile starting with Ubuntu 21.04
FROM ubuntu:latest
RUN apt-get -y update
RUN apt-get -y install nginx
