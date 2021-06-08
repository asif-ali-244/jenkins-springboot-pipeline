pipeline {
	agent any
	environment {
		registry = "141163151146/spring-boot"
		registryCredential = 'docker-hub'
		dockerImage =''
	}
	tools {
		maven 'Maven'
	}
	stages {
		stage('Maven Build') {
			when {
				branch "*/development"
			}
			steps {
				echo "building ${BUILD_NUMBER}"
				sh 'chmod +x mvnw'
				sh './mvnw package'
			}
		}
		stage('Docker Build') {
			steps {
				script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
			}
		}
		stage('Deploying image') {
			steps {
				script {
					docker.withRegistry( '', registryCredential ){
						dockerImage.push()
					}
				}
			}
		}
		stage('Deploying to server') {
			steps {
				sh "docker run -p 8088:8080 $dockerImage"

				// script {
				// 	//withDockerContainer(args: "bash -c '-p 8088:8080'", image: "$dockerImage"){}
				// }
			}
		}
		stage('Cleaning up') { 
            steps { 
                sh "docker rmi $registry:$BUILD_NUMBER" 
            }
        } 
	}
}