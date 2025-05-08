pipeline {
    agent any

    environment {
        IMAGE_NAME = 'priyadharshini06/clean-blog'
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'github_credentials', url: 'https://github.com/Priyadharshinis0612/Devops_project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:${BUILD_NUMBER}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'dockerhub_credentials', url: '']) {
                    script {
                        docker.image("${IMAGE_NAME}:${BUILD_NUMBER}").push()
                        docker.image("${IMAGE_NAME}:${BUILD_NUMBER}").push('latest')
                    }
                }
            }
        }

        stage('Deploy to Dev Environment') {
            steps {
                sh '''
                docker stop cleanblog-dev || true
                docker rm cleanblog-dev || true
                docker run -d --name cleanblog-dev -p 8081:80 priyadharshini06/clean-blog:${BUILD_NUMBER}
                '''
            }
        }

        stage('Deploy to QA Environment') {
            steps {
                input "Deploy to QA?"
                sh '''
                docker stop cleanblog-qa || true
                docker rm cleanblog-qa || true
                docker run -d --name cleanblog-qa -p 8082:80 priyadharshini06/clean-blog:${BUILD_NUMBER}
                '''
            }
        }

        stage('Deploy to Production') {
            steps {
                input "Deploy to Production?"
                sh '''
                docker stop cleanblog-prod || true
                docker rm cleanblog-prod || true
                docker run -d --name cleanblog-prod -p 8080:80 priyadharshini06/clean-blog:${BUILD_NUMBER}
                '''
            }
        }
    }

    post {
        always {
            echo "Cleaning up unused Docker images..."
            sh 'docker image prune -f'
        }
    }
}
