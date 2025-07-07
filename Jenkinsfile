podTemplate(
  label: 'kaniko-pod',
  containers: [
    containerTemplate(
      name: 'kubectl',
      image: 'lachlanevenson/k8s-kubectl:v1.27.1', // ✅ 변경
      command: 'cat',
      ttyEnabled: true
    )
  ]
) {
  node('kaniko-pod') {
    stage('Checkout') {
      container('kubectl') {
        checkout scm
      }
    }

    withEnv([
      "AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}",
      "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}",
      "AWS_SESSION_TOKEN=${env.AWS_SESSION_TOKEN}",
      "AWS_ACCOUNT_ID=935875533840",
      "AWS_REGION=ap-northeast-2"
    ]) {
      stage('Kaniko Build & Push') {
        container('kubectl') {
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
