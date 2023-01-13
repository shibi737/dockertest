# tomcat dockerfile starting with Ubuntu 20.04
# Add a new comment to trigger build.
FROM ubuntu:21.04

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN apt-get -y update; apt-get -y install curl; apt-get -y install vim nano
RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.5/bin/apache-tomcat-8.5.5.tar.gz 
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.5/* /opt/tomcat/.
RUN apt-get -y install openjdk-8-jdk
RUN apt-get -y install gettext
RUN java -version

WORKDIR /opt/tomcat/webapps

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]











