FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean install -DskipTests

FROM openjdk:17-jdk-alpine
COPY --from=build /app/target/presentacion-0.0.1-SNAPSHOT.jar /app/presentacion-0.0.1-SNAPSHOT.jar
EXPOSE 8080
CMD ["java", "-jar", "presentacion.jar"]