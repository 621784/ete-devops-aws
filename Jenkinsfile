pipeline {
    agent any
 
    environment {
        AWS_REGION = "ap-south-1"
        ACCOUNT_ID = "768490032674"
 
        BACKEND_REPO = "foundation-backend-ecr"
        FRONTEND_REPO = "foundation-frontend-ecr"
    }
 
    tools {
        nodejs "Node22"
    }
 
    stages {
 
        stage("Checkout Code") {
            steps {
                git branch: 'main',
                    credentialsId: 'github-creds',
                    url: 'https://github.com/621784/ete-devops-aws.git'
            }
        }
 
        stage("Install Backend Dependencies") {
            steps {
                dir("backend") {
                    sh "npm install"
                }
            }
        }
 
        stage("Install Frontend Dependencies") {
            steps {
                dir("frontend") {
                    sh "npm install"
                }
            }
        }
 
        stage("Build Frontend") {
            steps {
                dir("frontend") {
                    sh "npm run build"
                }
            }
        }
 
        stage("Docker Login to ECR") {
            steps {
                sh """
                aws ecr get-login-password --region ${AWS_REGION} \
                | docker login --username AWS --password-stdin ${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com
                """
            }
        }
 
        stage("Build Docker Images") {
            steps {
                sh """
                docker build -t backend-image ./backend
                docker build -t frontend-image ./frontend
                """
            }
        }
 
        stage("Tag Docker Images") {
            steps {
                sh """
                docker tag backend-image:latest ${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${BACKEND_REPO}:latest
                docker tag frontend-image:latest ${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${FRONTEND_REPO}:latest
                """
            }
        }
 
        stage("Push Images to ECR") {
            steps {
                sh """
                docker push ${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${BACKEND_REPO}:latest
                docker push ${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${FRONTEND_REPO}:latest
                """
            }
        }
    }
 
    post {
        success {
            echo "CI Pipeline Completed Successfully!"
        }
        failure {
            echo "CI Pipeline Failed!"
        }
    }
}