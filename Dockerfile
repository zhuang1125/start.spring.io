From adoptopenjdk:11-jdk-hotspot-bionic
RUN apt-get update -y 
RUN apt-get install git
RUN git clone git@github.com:spring-io/start.spring.io.git
RUN ./mvnw clean install

