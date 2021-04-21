#!/bin/bash

KUBECTL_PATH=/usr/bin/kubectl
mkdir -p ~/.kube
tmc cluster auth admin-kubeconfig get ${CLUSTER_NAME} -p ${PROVISIONER} -m ${MGMT_CLUSTER} > ~/.kube/config

${KUBECTL_PATH} config use-context ${CLUSTER_NAME}
