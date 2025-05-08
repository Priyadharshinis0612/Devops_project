pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = 'docker_credentials'  // Add Docker registry credentials (if needed)
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'github_credentials', url: 'https://github.com/Priyadharshinis0612/Devops_project.git', branch: 'main'
            }
        }

        stage('Test Docker') {
            steps {
                script {
                    // For Windows:
                    bat 'docker --version'

                    // For Linux/Mac:
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

        stage('Push Docker Image to Docker Hub') {
            when {
                branch 'main'  // Push only from main branch (optional)
            }
            steps {
                script {
                    // Docker login to Docker Hub (or any other registry)
                    withCredentials([usernamePassword(credentialsId: 'docker_credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        bat """
                            docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}
                            docker push priyadharshini06/clean-blog:3
                        """
                    }
                }
            }
        }

        // Continue with other stages like Deploy, Test, etc.
    }
}
