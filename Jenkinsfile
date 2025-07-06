pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Ping') {
      steps {
        echo '✅ Jenkinsfile 적용됨!'
      }
    }
  }
}
