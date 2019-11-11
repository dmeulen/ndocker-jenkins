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
          git url: 'git@github.com:dmeulen/ndocker-jenkins.git', credentialsId: '62c172ed-19c0-4cfd-b6da-0f567c4ee1b5'
        }
      }
      stage ('Building Image') {
        steps {
          sh 'make build'
        }
      }
      stage('Deploy Image') {
        steps {
          withDockerRegistry([ credentialsId: 'theanimaldock-dockerhub', url: '' ]) {
            sh 'env'
          	sh 'make -e VERSION=$GIT_COMMIT tag'
          	sh 'make -e VERSION=$GIT_COMMIT push'
          }
        }
      }
    }
}
