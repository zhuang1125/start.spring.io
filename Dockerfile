From adoptopenjdk:11-jdk-hotspot-bionic
RUN apt-get update -y 
RUN apt-get install  git -y
RUN git clone git@github.com:spring-io/start.spring.io.git
RUN ./mvnw clean install
ARG JAR_FILE=start-site/target/*exec.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
