pipeline {
  environment {
    registry = "theanimaldock/dblocker-jenkins"
    registryCredential = 'theanimaldock-dockerhub'
    dockerImage = ''
  }
  agent any
    stages {
      stage ('Cloning Git Repo') {
        steps {
          git url: 'git@github.com:dmeulen/ndocker-jenkins.git', credentialsId: 'git'
        }
      }
      stage ('Building Image') {
        steps {
          script {
            dockerImage = docker.build + ":$BUILD_NUMBER"
          }
        }
      }
    }
}
