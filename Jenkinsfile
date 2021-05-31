pipeline {
  
  environment {
    registry = "192.168.2.10:5000/myfirstproject"
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
            sh 'docker push  ejajbandi/192.168.2.10:5000/myfirstproject'
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
