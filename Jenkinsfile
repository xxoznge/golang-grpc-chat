pipeline {
  agent {
    kubernetes {
      yaml """
apiVersion: v1
kind: Pod
spec:
  containers:
    - name: jnlp
      image: jenkins/inbound-agent:latest
      args: ['\$(JENKINS_SECRET)', '\$(JENKINS_NAME)']
    - name: kubectl
      image: bitnami/kubectl:latest
      command:
        - cat
      tty: true
"""
      defaultContainer 'kubectl'
    }
  }

  environment {
    AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    AWS_SESSION_TOKEN     = credentials('aws-session-token')
    AWS_ACCOUNT_ID        = '935875533840'
    AWS_REGION            = 'ap-northeast-2'
  }

  stages {
    stage('Checkout') {
      steps {
        container('kubectl') {
          checkout scm
        }
      }
    }

    stage('Kaniko Build & Push') {
      steps {
        container('kubectl') {
          script {
            def kanikoJobs = ['server', 'web', 'ws']
            for (job in kanikoJobs) {
              echo "${job} 빌드 시작"

              sh """
                kubectl delete job kaniko-job-${job} --ignore-not-found -n jenkins
                kubectl apply -f infra/kaniko/kaniko-job-${job}.yaml -n jenkins
                kubectl wait --for=condition=complete --timeout=300s job/kaniko-job-${job} -n jenkins || (
                  echo '[실패] ${job} 실패! 로그 출력' && \
                  kubectl logs job/kaniko-job-${job} -n jenkins && exit 1
                )
              """
            }
          }
        }
      }
    }
  }
}

