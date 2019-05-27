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
          sh 'make build'
        }
      }
      stage('Deploy Image') {
        when {
          buildingTag()
        }
        steps {
          sh 'make -e VERSION=$TAG_NAME tag'
          sh 'make -e VERSION=$TAG_NAME push'
        }
      }
    }
}
