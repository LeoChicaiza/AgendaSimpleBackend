# Usa una imagen base de Java
FROM eclipse-temurin:17-jdk

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el archivo JAR del conector MySQL
COPY mysql-connector-j-8.3.0.jar .

# Copiar los archivos fuente
COPY src ./src

# Compilar el código Java
RUN javac -cp ".:mysql-connector-j-8.3.0.jar" -d out src/main/java/mycompany/agendasimplebackend/SimpleServer.java

# Comando por defecto para ejecutar tu servidor
CMD ["java", "-cp", "out:mysql-connector-j-8.3.0.jar", "mycompany.agendasimplebackend.SimpleServer"]

