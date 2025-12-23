pipeline {
    agent any

    stages {

        stage("Clone Repository") {
            steps {
                echo "Cloning repository..."
                git branch: 'main',
                    url: 'https://github.com/sanjayyy04/react-jenkins-automate-aws.git'
            }
        }

        stage("Build Image") {
            steps {
                echo "Building Docker image..."
                sh '''
                    docker rmi -f react-jenkins-automate-aws || true
                    docker build -t react-jenkins-automate-aws .
                '''
            }
        }

        stage("Deploy") {
            steps {
                echo "Deploying application..."
                sh '''
                    docker stop react-jenkins-automate-aws-container || true
                    docker rm react-jenkins-automate-aws-container || true
                    docker run -d \
                      -p 5173:5173 \
                      --restart unless-stopped \
                      --name react-jenkins-automate-aws-container \
                      react-jenkins-automate-aws
                '''
            }
        }
    }
}
