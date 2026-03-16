pipeline {
    agent any

    stages {
        stage('Build Java App') {
            steps {
                sh 'mvn clean package'
            }
        }
    }
}
