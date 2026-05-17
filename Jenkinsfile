pipeline {
    agent any

    stages {

        stage('Build Java App') {
            agent {
                docker {
                    image 'maven:3.9.9-eclipse-temurin-17'
                }
            }
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
	stage('Deploy Kubernetes') {
           steps {
               sh '''
                  export KUBECONFIG=/var/jenkins_home/.kube/config
                  kubectl rollout restart deployment devops-java-app
                  '''
    }
}
    }
}
