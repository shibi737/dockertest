# testing github action
FROM centos
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum -y update
WORKDIR /opt/tomcat
RUN yum -y install curl; yum -y install vim nano
RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.5/bin/apache-tomcat-8.5.5.tar.gz 
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.5/* /opt/tomcat/.
RUN yum install -y \
       java-1.8.0-openjdk \
       java-1.8.0-openjdk-devel
RUN yum -y install gettext
RUN java -version

WORKDIR /opt/tomcat/webapps

ADD tomcat-users.xml /opt/tomcat/conf/

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
