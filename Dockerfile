FROM openjdk:8u332-jdk-bullseye AS compile
WORKDIR /work
COPY . .
RUN ./mvnw package

FROM openjdk:8u332-jre-bullseye
WORKDIR /deploy
COPY --from=compile /work/target/*.jar app.jar
EXPOSE 8080
CMD [ "java", "-jar", "./app.jar" ]