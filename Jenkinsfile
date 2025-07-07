pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        echo "📦 소스 코드 체크아웃"
        checkout scm
      }
    }

    stage('Ping') {
      steps {
        echo "✅ Jenkins pipeline 실행됨! 현재 작업 디렉토리 목록:"
        sh 'ls -al'
      }
    }
  }
}
