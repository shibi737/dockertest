# Basic nginx dockerfile starting with Ubuntu 21.04
FROM ubuntu:21.04
RUN apt-get -y update
RUN apt-get -y install nginx