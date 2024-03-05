 # Stage 1
FROM maven:3.9.6 AS builder
WORKDIR /app
COPY pom.xml .
COPY ./src ./src
RUN mvn package -DskipTests

# Stage 2
FROM openjdk:11-jre-slim
COPY --from=builder /app/target/*.jar ./app.jar
CMD ["java", "-jar", "app.jar"]
