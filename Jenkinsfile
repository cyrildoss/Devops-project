pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                git 'https://github.com/cyrildoss/Devops-project.git'
            }
        }
          stage('test by trivy') {
            steps {
                sh 'trivy repo https://github.com/cyrildoss/Devops-project.git'
            }
        }

   stage('test by sonar') {
            steps {
                sh 'mvn sonar:sonar -Dsonar.host.url=http://172.190.138.146:9000/ -Dsonar.login=squ_48ec27936da5901d9a2df395f602264f92e24b74'
            }
        }
        
        
          stage('build') {
            steps {
               sh 'mvn clean'
              sh 'mvn package'

            }
        }
        
        
          stage('build image') {
            steps {
                sh 'docker build -t newimage .'
            }
        }
        
          stage('testing by Trivy') {
            steps {
                sh 'trivy image newimage'
            }
        }
     stage('deploy') {
            steps {
                sh 'docker rm -f newapplication'
                sh 'docker run -d --name newapplication -p 8089:8080 newimage'
            }
        }

    }
}
