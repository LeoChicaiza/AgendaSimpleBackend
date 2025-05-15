# Etapa de construcción
FROM maven:3.9.6-eclipse-temurin-17 AS build

# Copiar el código fuente
WORKDIR /app
COPY pom.xml .
COPY src ./src

# Construir el fat jar (uber-jar)
RUN mvn clean package

# Etapa de ejecución
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copiar el jar generado
COPY --from=build /app/target/AgendaSimpleBackend-1.0-jar-with-dependencies.jar app.jar

# Exponer el puerto (Railway detectará esto)
EXPOSE 8080

# Comando para ejecutar la app
CMD ["java", "-jar", "app.jar"]


