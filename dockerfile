FROM openjdk:8-jdk-alpine
ADD target/asif-jenkins-pipeline.jar asif-jenkins-pipeline.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","asif-jenkins-pipeline.jar"]