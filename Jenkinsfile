pipeline {
    agent any

    environment {
        IMAGE_NAME = 'priyadharshini06/mywebsite'  // Correct Docker image name
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/Priyadharshinis0612/Devops_project.git', branch: 'main'  // Use your actual repo URL and branch
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:latest")  // Build the Docker image
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
                // Docker login using your credentials from Jenkins
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    docker.image("${IMAGE_NAME}:latest").push()
                }
            }
        }

        stage('Deploy to Localhost') {
            steps {
                // Run the Docker container locally
                sh "docker run -d -p 3000:3000 ${IMAGE_NAME}:latest"  // Ensure the correct port is mapped (3000 in this case)
            }
        }
    }
}
