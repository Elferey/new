pipeline {
    agent any
    
    stages {
        stage ('Clone repo') {
            steps {
                git 'https://github.com/Elferey/new.git'
            }
        }
        stage ('Build image') {
            steps {
                sh 'docker build -t $image_name .'
            }
        }
        stage ('Push image in nexus') {
            steps {
                sh 'docker tag $image_name 10.129.0.4:8123/$image_name:$tag'
                sh 'docker push 10.129.0.4:8123/$image_name:$tag'
            }
        }
        stage ('Remove last image') {
            steps {
                sh 'docker rmi 10.129.0.4:8123/$image_name:$tag'
            }
        }
    }
}
