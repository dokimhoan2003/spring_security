# # Stage 1: Build stage
# FROM ubuntu:latest AS build
#
# # Cập nhật package list và cài đặt OpenJDK 21
# RUN apt-get update && apt-get install -y openjdk-21-jdk maven
#
# # Copy toàn bộ mã nguồn dự án vào container
# COPY . /app
#
# # Đặt thư mục làm việc là /app
# WORKDIR /app
#
# # Chạy lệnh Maven để build ứng dụng (bootJar)
# RUN ./mvnw clean package -DskipTests
#
# # Stage 2: Run stage
# FROM openjdk:21-jdk-slim
#
# # Mở port 8000 (có thể thay đổi tùy vào config ứng dụng của bạn)
# EXPOSE 8000
#
# # Copy file JAR từ stage build vào container
# COPY --from=build /app/target/*.jar app.jar
#
# # Chạy ứng dụng Spring Boot
# ENTRYPOINT ["java", "-jar", "/app.jar"]

FROM openjdk:21-jdk-slim
VOLUME /tmp
COPY target/spring-security-1.jar spring-security-1.jar
ENTRYPOINT ["java","-jar","/spring-security-1.jar"]


