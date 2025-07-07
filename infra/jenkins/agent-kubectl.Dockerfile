FROM jenkins/inbound-agent:latest

USER root

# 기본 도구 설치
RUN apt-get update && apt-get install -y curl unzip ca-certificates bash

# kubectl 설치 (고정 버전 사용)
ENV KUBECTL_VERSION=v1.30.1

RUN curl -LO https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/arm64/kubectl && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    rm kubectl

# awscli 설치
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && ./aws/install && \
    rm -rf awscliv2.zip aws

USER jenkins




