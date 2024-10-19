pipeline{

    agent any

    stages{

        stage('Build Jar'){
            steps{
                bat "mvn clean package -DskipTests"
            }
        }

        stage('Build Image'){
            steps{
                bat "docker build -t=ronaldian/selenium:latest ."
            }
        }

        stage('Push Image'){
            environment{
                DOCKER_HUB = credentials('dockerhub-creds')
            }
            steps{
                // not working in windows (command use to prevent warning)
                // bat 'echo %DOCKER_HUB_PSW% | docker login -u %DOCKER_HUB_USR% --password-stdin'
                bat 'docker login -u %DOCKER_HUB_USR% -p %DOCKER_HUB_PSW%'
                bat 'docker push ronaldian/selenium:latest'
                bat "docker tag ronaldian/selenium:latest ronaldian/selenium:${env.BUILD_NUMBER}"
                bat "docker push ronaldian/selenium:${env.BUILD_NUMBER}"
            }
        }
    }

    post {
        always {
            bat "docker logout"
        }
    }
}