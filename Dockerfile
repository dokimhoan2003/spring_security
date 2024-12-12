
FROM maven:3-eclipse-temurin-17 AS build
COPY . .
RUN mvn clean package -DskipTests


FROM eclipse-temurin:17-alpine
COPY --from=build /target/*.jar spring-security-1.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","spring-security-1.jar"]














COPY target/spring-security-1.jar spring-security-1.jar
ENTRYPOINT ["java","-jar","/spring-security-1.jar"]


