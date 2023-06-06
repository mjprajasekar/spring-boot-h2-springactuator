FROM maven:3.8.4-openjdk-11 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package

FROM maven:3.8.4-openjdk-11
WORKDIR /application

RUN mkdir /application
WORKDIR /application
COPY target/*.jar /application/app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/application/app.jar"]
