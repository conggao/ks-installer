#!/bin/bash

# Copyright 2018 The KubeSphere Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# docker login -u guest -p guest dockerhub.qingcloud.com

ks_images=(kubesphere/ks-console:v2.1.0  \
           kubesphere/kubectl:v1.0.0  \
           kubesphere/ks-account:v2.1.0  \
           kubesphere/ks-devops:flyway-v2.1.0  \
           kubesphere/ks-apigateway:v2.1.0  \
           kubesphere/ks-apiserver:v2.1.0  \
           kubesphere/ks-controller-manager:v2.1.0  \
           kubesphere/docs.kubesphere.io:advanced-2.0.0  \
           kubesphere/cloud-controller-manager:v1.4.0  \
           kubesphere/ks-installer:v2.1.0  \
         
           quay.azk8s.cn/kubernetes-ingress-controller/nginx-ingress-controller:0.24.1  \
           mirrorgooglecontainers/defaultbackend-amd64:1.4 \
           gcr.azk8s.cn/google_containers/metrics-server-amd64:v0.3.1 \
         
           kubesphere/notification:v2.1.0  \
           kubesphere/notification:flyway_v2.1.0  \
           kubesphere/alerting-dbinit:v2.1.0  \
           kubesphere/alerting:v2.1.0  \
           kubesphere/alert_adapter:v2.1.0  \
         
           openpitrix/release-app:v0.4.2  \
           openpitrix/openpitrix:flyway-v0.4.5  \
           openpitrix/openpitrix:v0.4.5  \
           openpitrix/runtime-provider-kubernetes:v0.1.2  \
         
           kubesphere/jenkins-uc:v2.1.0  \
           jenkins/jenkins:2.176.2  \
           jenkins/jnlp-slave:3.27-1  \
           kubesphere/builder-base:v2.1.0  \
           kubesphere/builder-nodejs:v2.1.0  \
           kubesphere/builder-maven:v2.1.0  \
           kubesphere/builder-go:v2.1.0  \
           sonarqube:7.4-community  \
         
           kubesphere/s2ioperator:v2.1.0  \
           kubesphere/s2irun:v2.1.0  \
           kubesphere/java-11-centos7:v2.1.0  \
           kubesphere/java-8-centos7:v2.1.0  \
           kubesphere/nodejs-8-centos7:v2.1.0  \
           kubesphere/nodejs-6-centos7:v2.1.0  \
           kubesphere/nodejs-4-centos7:v2.1.0  \
           kubesphere/python-36-centos7:v2.1.0  \
           kubesphere/python-35-centos7:v2.1.0  \
           kubesphere/python-34-centos7:v2.1.0  \
           kubesphere/python-27-centos7:v2.1.0  \
           kubesphere/tomcat85-java8-centos7:v2.1.0  \
           kubesphere/tomcat85-java8-runtime:v2.1.0  \
           kubesphere/tomcat85-java11-runtime:v2.1.0  \
           kubesphere/tomcat85-java11-centos7:v2.1.0  \
           kubesphere/java-8-runtime:v2.1.0  \
           kubesphere/java-11-runtime:v2.1.0  \
           kubesphere/s2i-binary:v2.1.0  \
         
           kubesphere/configmap-reload:v0.0.1  \
           kubesphere/prometheus:v2.5.0  \
           kubesphere/prometheus-config-reloader:v0.27.1  \
           kubesphere/prometheus-operator:v0.27.1  \
           kubesphere/kube-rbac-proxy:v0.4.1  \
           kubesphere/kube-state-metrics:v1.5.2  \
           kubesphere/node-exporter:ks-v0.16.0  \
           kubesphere/addon-resizer:1.8.4  \
           mirrorgooglecontainers/addon-resizer:1.8.3  \
           grafana/grafana:5.2.4  \
         
           kubesphere/docker-elasticsearch-curator:5.5.4  \
           kubesphere/elasticsearch-oss:6.7.0-1  \
           kubesphere/fluent-bit:v1.3.2-reload  \
           docker.elastic.co/kibana/kibana-oss:6.7.0  \
           dduportal/bats:0.4.0  \
           kubesphere/fluentbit-operator:v2.1.0  \
           kubesphere/fluent-bit:v1.3.2-reload  \
           kubesphere/configmap-reload:v0.0.1  \
           kubesphere/log-sidecar-injector:1.0  \
         
           istio/kubectl:1.3.3  \
           istio/proxyv2:1.3.3  \
           istio/citadel:1.3.3  \
           istio/pilot:1.3.3  \
           istio/mixer:1.3.3  \
           istio/galley:1.3.3  \
           istio/proxy_init:1.3.3  \
           istio/sidecar_injector:1.3.3  \
           jaegertracing/jaeger-operator:1.13.1  \
           jaegertracing/jaeger-agent:1.13  \
           jaegertracing/jaeger-collector:1.13  \
           jaegertracing/jaeger-query:1.13  \
         
           redis:5.0.5-alpine  \
           busybox:1.28.4  \
           mysql:8.0.11  \
           nginx:1.14-alpine  \
           postgres:9.6.8  \
           osixia/openldap:1.3.0  \
           alpine:3.9  \
           haproxy:2.0.4  \
           joosthofman/wget:1.0  \
           minio/minio:RELEASE.2019-08-07T01-59-21Z  \
           minio/minio:RELEASE.2017-12-28T01-21-00Z  \
           minio/mc:RELEASE.2019-08-07T23-14-43Z  \
           minio/mc:RELEASE.2018-07-13T00-53-22Z  \
         
           kubesphere/examples-bookinfo-productpage-v1:1.13.0  \
           kubesphere/examples-bookinfo-reviews-v1:1.13.0  \
           kubesphere/examples-bookinfo-reviews-v2:1.13.0  \
           kubesphere/examples-bookinfo-reviews-v3:1.13.0  \
           kubesphere/examples-bookinfo-details-v1:1.13.0  \
           kubesphere/examples-bookinfo-ratings-v1:1.13.0  \
           kubesphere/netshoot:v1.0  \
           nginxdemos/hello:plain-text  \
           mysql:8.0.11  \
           wordpress:4.8-apache  \
           mirrorgooglecontainers/hpa-example:latest  \
           java:openjdk-8-jre-alpine  \
           fluent/fluentd:v1.4.2-2.0  \
           perl:latest  \

  )
  
registryurl="$1"
reposUrl=("dockerhub.qingcloud.com" "quay.azk8s.cn" "gcr.azk8s.cn" "docker.elastic.co")

for image in ${ks_images[@]}; do
  ## download_images
  # docker pull $image
  ## retag images
    url=${image%%/*}
    ImageName=${image#*/}
    echo $image
    if echo "${reposUrl[@]}" | grep -w "$url" &>/dev/null; then
          imageurl=$registryurl"/"${image#*/}
    elif [ $url == $registryurl ]; then
        if [[ $ImageName != */* ]]; then
            imageurl=$registryurl"/library/"$ImageName
        else
            imageurl=$image
        fi
    elif [ "$(echo $url | grep ':')" != "" ]; then
          imageurl=$registryurl"/library/"$image                  
    else
          imageurl=$registryurl"/"$image 
    fi  
    ## push image
    echo $imageurl
    docker tag $image $imageurl
    docker push $imageurl
    # docker rmi $i
done
