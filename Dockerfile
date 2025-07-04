FROM jenkins/inbound-agent:latest

USER root

# docker 설치 (apt 환경 예시)
RUN apt-get update && \
    apt-get install -y docker.io && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    apt-get install -y unzip && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws

USER jenkins