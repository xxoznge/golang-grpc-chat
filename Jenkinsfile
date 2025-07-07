pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        echo "소스 코드 체크아웃"
        checkout scm
      }
    }

    stage('확인') {
      steps {
        script {
          echo "현재 디렉토리에서 출력 테스트 중..."
          def out = sh(script: 'pwd && ls -al', returnStdout: true).trim()
          echo "작업 디렉토리:\n${out}"
        }
      }
    }
  }
}
