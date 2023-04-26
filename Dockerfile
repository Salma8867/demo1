FROM ubuntu:20.04
MAINTAINER salma
LABEL "Customimage"="demo1"

RUN mkdir /opt/demo1project

WORKDIR /opt/demo1project
RUN apt-get update && apt-get -y install default-jre &&  apt-get -y install maven
RUN java --version && mvn --version
RUN apt-get install -y git
RUN git clone https://github.com/Salma8867/demo1.git
WORKDIR /opt/demo1project/demo1
RUN mvn clean install
EXPOSE 9090
CMD java -jar target/demo1-0.0.1-SNAPSHOT.jar
