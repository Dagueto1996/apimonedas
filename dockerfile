# Etapa 1: compila
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests -pl presentacion

# Etapa 2: runtime
FROM openjdk:17-jdk-alpine
WORKDIR /app
# Ajusta aquí la ruta correcta al JAR dentro del módulo 'presentacion'
COPY --from=build /app/presentacion/target/presentacion-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
CMD ["java","-jar","app.jar"]
