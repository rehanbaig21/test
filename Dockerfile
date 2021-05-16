FROM tomcat:8.0
LABEL maintainer=”RehanBaig”
COPY sampleapp/sample.war /usr/local/tomcat/webapps/