
FROM maven:3.8.5-openjdk-17 as build
COPY . .
run mvn clean package -DskipTests

from openjdk:17.0.1-jdk-slim
copy --from=build /target/tienda/tienda-1.jar tienda.jar
expose 80
entrypoint ["java","-jar","tienda.jar"]


