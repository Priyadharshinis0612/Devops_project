pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'github_credentials', url: 'https://github.com/Priyadharshinis0612/Devops_project.git', branch: 'main'
            }
        }

        stage('Test Docker') {
            steps {
                script {
                    // Comment out the one that does not apply
                    // Use this for Windows:
                    bat 'docker --version'

                    // Use this for Linux/Mac agents:
                    // sh 'docker --version'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat 'docker build -t priyadharshini06/clean-blog:3 .'
                }
            }
        }

        // Continue with the rest of your stages...
    }
}
