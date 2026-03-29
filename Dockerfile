FROM eclipse-temurin:17
WORKDIR /app
COPY target/devops-java-app-1.0.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]
