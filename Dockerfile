FROM tomcat:latest
COPY target/IndianTownsAPI.war /usr/local/tomcat/webapps/IndianTownsAPI.war
EXPOSE 8080
CMD ["catalina.sh","run"]