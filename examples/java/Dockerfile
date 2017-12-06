FROM openjdk:8-jdk-slim AS build-env
ADD . /app/examples
WORKDIR /app
RUN javac examples/*.java
RUN jar cfe main.jar examples.HelloJava examples/*.class 

FROM gcr.io/distroless/java
COPY --from=build-env /app /app
WORKDIR /app
CMD ["main.jar"]
