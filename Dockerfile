
FROM openjdk:21-jdk-slim
VOLUME /tmp
COPY target/spring-security-1.jar spring-security-1.jar
ENTRYPOINT ["java","-jar","/spring-security-1.jar"]


