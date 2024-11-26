FROM tomcat:9.0
COPY target/LoginWebApp.war /usr/local/tomcat/webapps/LoginWebApp.war
