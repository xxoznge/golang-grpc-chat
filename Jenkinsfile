pipeline {
  agent any

  stages {
    stage('Show Source') {
      steps {
        sh 'cat Jenkinsfile'
      }
    }

    stage('Hello') {
      steps {
        echo '🔥 파이프라인 내부 실행 중!'
      }
    }
  }
}
