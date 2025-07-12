# Etapa 1
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
# -pl presentacion construye sólo ese módulo,
# -am levanta también los módulos necesarios (incluye el padre)
RUN mvn clean package -DskipTests -pl presentacion -am

# Etapa 2
FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY --from=build /app/presentacion/target/presentacion-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
CMD ["java","-jar","app.jar"]
 