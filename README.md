# Spring Boot simple hello world web app 
## Build the project
To build the project run the command `mvnw spring-boot:run` on windows machine or `./mvnw spring-boot:run` on linux machine. To test the app run `localhost:8080/hello` on your browser after building.

## Build docker image
To build a docker image of the project run `sudo docker build .` this will build a docker image.

## Run the docker container
To run the docker container use `sudo docker run -p 8088:8080 <image-name/id>` this will run the docker container on port 8088. 
  