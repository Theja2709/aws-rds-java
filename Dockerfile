#FROM tomcat:9.0
#COPY target/LoginWebApp.war /usr/local/tomcat/webapps/LoginWebApp.war
# Base image
FROM maven:3.9.5-eclipse-temurin-17 AS builder

# Set working directory
WORKDIR /app

# Copy application code and pom.xml
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package

# Use Tomcat as the runtime base image
FROM tomcat:9.0

# Copy the WAR file from the builder stage to the Tomcat webapps directory
COPY --from=builder /app/target/LoginWebApp.war /usr/local/tomcat/webapps/LoginWebApp.war

# Expose port 8080
EXPOSE 8080

# Set the default command to start Tomcat
CMD ["catalina.sh", "run"]
