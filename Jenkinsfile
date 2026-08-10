pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "chandrakalaj/my-app"
    
    }
    stages {

        stage("Clone Repository") {
            steps {
                git 'https://github.com/chandra2503/dev.git'
            }
        }

        stage("Build Docker Image") {
            steps {
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage("Docker Login") {
    steps {
        withCredentials([usernamePassword(credentialsId: 'docker-hub',usernameVariable: 'DOCKER_USERNAME',passwordVariable: 'DOCKER_PASSWORD')]) {
            sh "echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
           }
        }
    }
        stage("Push Docker Image") {
            steps {
                sh "docker push ${DOCKER_IMAGE}"
            }
        }

        stage("Deploy Application") {
            steps {
                sh "microk8s kubectl apply -f deploymentfile.yaml"
            }
        }

        stage("Deploy Service") {
            steps {
                sh "microk8s kubectl apply -f servicefile.yaml"
            }
        }
    }
}
