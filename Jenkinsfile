pipeline {
  
  environment {
    registry = "ejajbandi/jenkins_project"
    registryCredential = 'DOCKER_HUB_PASSWORD' 
    dockerImage = ""
  }

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git url:'https://github.com/ejajbandi/jenkins_first_pineline_project.git'
      }
    }

    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    
    stage('Docker Login') {
      steps{
        script {
            withCredentials([string(credentialsId: 'DOCKER_HUB_PASSWORD', variable: 'PASSWORD')]) {
                sh 'docker login -u ejajbandi -p $PASSWORD'
           }
        } 
      }
    }
    stage('Push Image to Docker Hub') {
      steps{
        script {
            sh 'docker push ejajbandi/jenkins_project:$BUILD_NUMBER'
        }
      }
    }

    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "myweb.yaml", kubeconfigId: "mykubeconfig")
        }
      }
    }

  }

}
