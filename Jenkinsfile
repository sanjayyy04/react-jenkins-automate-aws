pipeline{
    agent any

    stages{
        stage("Clone Repository"){
            steps{
                echo "Clone Repository..."
                git branch: 'main', 
                url: 'https://github.com/sanjayyy04/react-jenkins-automate-aws.git'
            }
        }
        stage("Build image"){
            steps{
                echo " Docker Executing..."
                sh '''
                    docker rmi react-jenkins-automate-aws || true
                    docker build -t react-jenkins-automate-aws .
                    docker stop react-jenkins-automate-aws || true
                    docker rm react-jenkins-automate-aws || true
                    docker run -d -p 80:5173 --name react-jenkins-automate-aws-container react-jenkins-automate-aws
                '''
            }
        }
        stage("Deploy"){
            steps{
                echo "Deploy the application..."                
            }
        }
    }
}