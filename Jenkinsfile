pipeline {
   agent any
   tools {
       nodejs "Node18"
   }
   stages {
       stage('Clone Repository') {
           steps {
               echo "Cloning repository..."
               git branch: 'main',
                   url: 'https://github.com/621784/ete-devops-aws.git'
           }
       }
       stage('Install Backend') {
           steps {
               echo "Installing backend dependencies"
               dir('backend') {
                   sh 'npm install'
               }
           }
       }
       stage('Install Frontend') {
           steps {
               echo "Installing frontend dependencies"
               dir('frontend') {
                   sh 'npm install'
               }
           }
       }
       stage('Build Frontend') {
           steps {
               echo "Building frontend"
               dir('frontend') {
                   sh 'npm run build'
               }
           }
       }
       stage('Run Backend Tests') {
           steps {
               echo "Running backend test"
           }
       }
   }
}