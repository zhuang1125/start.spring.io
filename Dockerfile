From adoptopenjdk:11-jdk-hotspot-bionic
RUN apt-get update -y 
RUN apt-get install  git -y
RUN git clone https://github.com/zhuang1125/start.spring.io.git
RUN curl -H "Accept: application/json" https://spring.io/project_metadata/spring-boot -o /start.spring.io/start-site/src/main/resources/springboot-metadata.json
RUN cd /start.spring.io && ./mvnw spring-javaformat:apply  &&  ./mvnw -Pverification clean install
RUN find /start.spring.io -name *.jar
ARG JAR_FILE=/start.spring.io/start-site/target/*exec.jar
RUN cp ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
