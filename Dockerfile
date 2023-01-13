FROM centos
RUN yum -y update
RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.5/bin/apache-tomcat-8.5.5.tar.gz 
RUN tar -zxf apache*.tar.gz
RUN mv apache-tomcat-8.5.5/* /opt/tomcat/.
RUN yum install -y \
       java-1.8.0-openjdk \
       java-1.8.0-openjdk-devel
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
