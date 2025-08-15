FROM quay.io/centos/centos:stream9

# Install Java and tools
RUN dnf -y install java-11-openjdk wget tar && dnf clean all

# Set Tomcat version
ENV TOMCAT_VERSION=9.0.93

# Download Tomcat 9 from Apache archive (since older versions move there)
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz \
    && tar -xvzf apache-tomcat-$TOMCAT_VERSION.tar.gz \
    && mv apache-tomcat-$TOMCAT_VERSION /opt/tomcat \
    && rm apache-tomcat-$TOMCAT_VERSION.tar.gz

# Deploy your WAR file
COPY student.war /opt/tomcat/webapps/

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]

