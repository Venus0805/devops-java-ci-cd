pipeline {
    agent any

    stages {

        stage('Build Java App') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t venus0805/devops-java-app:latest .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push venus0805/devops-java-app:latest'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
}
