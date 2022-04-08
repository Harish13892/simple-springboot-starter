# syntax=docker/dockerfile:1

FROM openjdk:17-alpine as base
RUN apk update && apk add --no-cache make
WORKDIR /service
COPY build.gradle settings.gradle gradlew gradlew.bat /service/
COPY gradle /service/gradle
RUN ./gradlew build 2>/dev/null || true
COPY . .

FROM base as gradletest
RUN make tests

FROM base as gradlebuild
RUN make build

FROM eclipse-temurin:17-jre-alpine
COPY --from=gradlebuild /service/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app.jar"]
