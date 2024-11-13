
#FROM payneteasy/jdk-8
FROM phenompeople/openjdk17:latest

WORKDIR /home


#RUN apt-get install ca-certificates

#RUN apt-get update
#RUN apt-get install -y curl
#RUN update-ca-certificates -f

#RUN /bin/sh -c "echo 'changeit' | keytool -list -v -keystore /etc/ssl/certs/java/cacerts"


#COPY mvnw .
COPY . .

COPY m /opt/maven

COPY src src
COPY pom.xml .


EXPOSE 80

RUN pwd
RUN ls

RUN ls /home

RUN ls /opt
#RUN ls /usr/bin
#RUN ls /usr
#RUN ls /usr/lib

RUN chmod a+rwx /home
RUN chmod a+rwx /home/build_docker.sh 
#RUN /opt/maven/bin/mvn package 
#/home/build_docker.sh
WORKDIR .
CMD ["/opt/maven/bin/mvn","package"]