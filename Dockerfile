From adoptopenjdk:11-jdk-hotspot-bionic
RUN apt-get update -y 
RUN apt-get install  git -y
RUN git clone https://github.com/zhuang1125/start.spring.io.git
RUN cd /start.spring.io && ./mvnw spring-javaformat:apply  && ./mvnw clean install
ARG JAR_FILE=/start.spring.io/start-site/target/*exec.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
