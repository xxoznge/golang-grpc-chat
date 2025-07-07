pipeline {
  agent any

  stages {
    stage('Precheck') {
      steps {
        echo "📂 현재 작업 디렉토리:"
        sh 'pwd'
        sh 'ls -al'
      }
    }

    stage('Checkout') {
      steps {
        echo "📦 소스 코드 체크아웃"
        checkout scm
      }
    }

    stage('Post-checkout') {
      steps {
        sh 'pwd'
        sh 'ls -al'
      }
    }
  }
}
