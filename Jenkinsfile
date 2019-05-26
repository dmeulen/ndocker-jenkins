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
      def tag = sh(returnStdout: true, script: "git tag --contains | head -1").trim()
      if (tag) {
        stage('Deploy Image') {
          sh 'make push'
        }
      }
    }
}
