FROM ubuntu:18.04

ENV KUBERNETES_VERSION="v1.13.4"
ENV HELM_VERSION="v2.13.0"

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
 apt-transport-https \
 wget \
 curl \
 jq \
 git \
 vim \
 && rm -rf /var/lib/apt/lists/*

ADD https://storage.googleapis.com/kubernetes-release/release/${KUBERNETES_VERSION}/bin/linux/amd64/kubectl /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl \
 && kubectl version --client

RUN wget https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && sha256sum helm-${HELM_VERSION}-linux-amd64.tar.gz \
 | grep $(curl -s https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz.sha256) \
 && tar xzvf helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin/helm \
 && chmod +x /usr/local/bin/helm \
 && rm -rf linux-amd64 helm-${HELM_VERSION}-linux-amd64.tar.gz helm-${HELM_VERSION}-linux-amd64.tar.gz.sha256

WORKDIR /root

CMD bash