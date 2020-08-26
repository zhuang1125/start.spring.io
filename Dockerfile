From adoptopenjdk:11-jdk-hotspot-bionic
RUN apt-get update -y 
RUN apt-get install  git -y
RUN git clone https://github.com/zhuang1125/start.spring.io.git
RUN cd start.spring.io
RUN pwd
RUN dir
RUN ./mvnw clean install
ARG JAR_FILE=start-site/target/*exec.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
