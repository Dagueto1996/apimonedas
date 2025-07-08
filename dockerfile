# Etapa 1: compila todo
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Etapa 2: runtime
FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY --from=build /app/presentacion/target/presentacion-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
CMD ["java","-jar","app.jar"]
