FROM maven:3.8-eclipse-temurin-17 as builder

ARG CACHE_M2=""

WORKDIR /build

COPY . /build

RUN mkdir .deployment && mvn package -DskipTests -Prelease $CACHE_M2 && mv target/firstCi-*.jar .deployment/app.jar

# Runtime Stage
FROM eclipse-temurin:latest

WORKDIR /app

COPY --from=builder /build/.deployment/app.jar /app/

ENTRYPOINT ["java", "-jar", "app.jar"]