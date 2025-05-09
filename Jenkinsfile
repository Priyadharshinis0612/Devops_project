pipeline {
    agent any

    environment {
        IMAGE_NAME = 'priyadharshini06/mywebsite'  // Docker image name
    }

    stages {
        stage('Clone Repository') {
            steps {
                cleanWs()  // Clean workspace before starting
                script {
                    git url: 'https://github.com/Priyadharshinis0612/Devops_project.git', branch: 'main'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                dir("${env.WORKSPACE}") {
                    script {
                        sh 'ls -la' // Optional: lists files to ensure Dockerfile is there
                        sh "docker build -t ${IMAGE_NAME}:latest ."
                    }
                }
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                // Add test scripts if needed
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Docker_cred', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.image("${IMAGE_NAME}:latest").push()
                }
            }
        }

        stage('Deploy to Localhost') {
            steps {
                sh "docker run -d -p 3000:3000 ${IMAGE_NAME}:latest"  // Change port if needed
            }
        }
    }
}
