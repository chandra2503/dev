pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/chandra2503/dev.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t chandra2503/myapp:latest .'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub',
                        usernameVariable: 'DOCKER_USERNAME',
                        passwordVariable: 'DOCKER_PASSWORD'
                    )
                ]) {
                    sh '''
                        echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
                    '''
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push chandra2503/myapp:latest'
            }
        }

        stage('Deploy Application') {
            steps {
                sh 'microk8s kubectl apply -f deploymentfile.yaml'
            }
        }

        stage('Deploy Service') {
            steps {
                sh 'microk8s kubectl apply -f servicefile.yaml'
            }
        }
    }
}
