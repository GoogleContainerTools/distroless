FROM openjdk:17-jdk-slim AS build-env
COPY . /app/examples
WORKDIR /app
RUN javac examples/*.java
RUN jar cfe main.jar examples.HelloJava examples/*.class 

FROM gcr.io/distroless/java17-debian12
COPY --from=build-env /app /app
WORKDIR /app
CMD ["main.jar"]
