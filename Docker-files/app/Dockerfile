FROM maven:3.9.9-eclipse-temurin-21-jammy AS BUILD_IMAGE
RUN git clone git@github.com:davidlimacardoso/devops-vprofile-project.git
RUN cd vprofile-project \
    && git checkout cotainers \
    && mvn install


FROM tomcat:10-jdk21
LABEL Project="vprofile"
LABEL Key="David Cardoso"
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=BUILD_IMAGE target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD [ "catalina.sh", "run" ]