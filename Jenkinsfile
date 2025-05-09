pipeline {
    agent any

    environment {
        IMAGE_NAME = 'priyadharshini06/mywebsite'  // Correct Docker image name
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/yourusername/yourrepo.git'  // Replace with your actual repo URL
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:latest")
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
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
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
                sh "docker run -d -p 3000:3000 ${IMAGE_NAME}:latest"  // Ensure the correct port is mapped (3000 in this case)
            }
        }
    }
}
