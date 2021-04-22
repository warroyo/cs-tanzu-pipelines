#!/bin/bash
export TMC_API_TOKEN=$1
tmc login --no-configure --name cs-gitops
KUBECTL_PATH=/usr/bin/kubectl
tmc cluster auth admin-kubeconfig get ${CLUSTER_NAME} -p ${PROVISIONER} -m ${MGMT_CLUSTER} > /tmp/${CLUSTER_NAME}-config.yml
cat ~/.kube/config

export KUBECONFIG="/tmp/${CLUSTER_NAME}-config.yml"