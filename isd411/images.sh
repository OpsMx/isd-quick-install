#! /bin/bash

rm -rf imglist.txt
cat >> /tmp/imglist.txt <<EOL
alpine:3.8
osixia/openldap:1.2.4 
ghcr.io/dexidp/dex:v2.35.3
quay.io/argoproj/argocd:v2.5.4
quay.io/opsmxpublic/busybox:1.28
quay.io/opsmxpublic/postgres:9.6.5
quay.io/argoproj/argo-rollouts:v1.3.1
minio/mc:RELEASE.2020-11-25T23-04-07Z
quay.io/opsmxpublic/ubi8-oes-db:v3.0.0
quay.io/opsmxpublic/ubi8-gate:v4.1.2-rc10
minio/minio:RELEASE.2020-12-03T05-49-24Z
quay.io/opsmxpublic/carina-manager:v1.9.4
quay.io/opsmxpublic/ubi8-oes-ui:v4.1.2-rc10
quay.io/opsmxpublic/forwarder-agent:v3.5.9
quay.io/argoproj/kubectl-argo-rollouts:v1.3.1
quay.io/opsmxpublic/ubi8-oes-sapor:v4.1.2-rc10
quay.io/opsmxpublic/rabbitmq:3.11.4-management
quay.io/opsmxpublic/awsgit:v2-openssh-javalibs
ghcr.io/argoproj-labs/argocd-extensions:v0.1.0
quay.io/opsmxpublic/forwarder-controller:v3.5.9
public.ecr.aws/docker/library/redis:7.0.5-alpine
quay.io/opsmxpublic/ubi8-oes-platform:v4.1.2-rc10
quay.io/opsmxpublic/ubi8-oes-autopilot:v4.1.2-rc10
quay.io/opsmxpublic/ubi8-oes-dashboard:v4.1.2-rc10
quay.io/opsmxpublic/ubi8-oes-visibility:v4.1.2-rc10
quay.io/opsmxpublic/create-secret:v20211127T140816
quay.io/opsmxpublic/ubi8-oes-datascience:v4.1.2-rc10
quay.io/opsmxpublic/bitnami-redis:5.0.7-debian-10-r0
quay.io/opsmxpublic/ubi8-oes-audit-client:v4.1.2-rc10
quay.io/opsmxpublic/ubi8-oes-audit-service:v4.1.2-rc10
EOL

input="/tmp/imglist.txt"
while IFS= read -r image
do
  sudo docker pull $image
  if [ $? != 0 ]
    then
  echo "Failed to pull image $image" 
  exit 1
  fi
done < "$input"
