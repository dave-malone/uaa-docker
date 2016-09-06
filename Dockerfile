FROM tomcat:7-jre8-alpine
MAINTAINER David Malone <dmalone@pivotal.io>

ADD cloudfoundry-identity-uaa-3.7.0.war $CATALINA_HOME/webapps/uaa.war

ENV SPRING_PROFILES_ACTIVE default,hsqldb
ENV UAA_URL http://localhost:8080/uaa
ENV LOGIN_URL http://localhost:8080/uaa
