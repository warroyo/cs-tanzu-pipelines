#!/bin/bash
echo "attaching ${CLUSTER_NAME} to TMC"

export TMC_API_TOKEN=$1
export WAVEFRONT_TOKEN=$2



 
cat << EOF > TO.json
{
    "full_name": {
        "provisionerName": "${PROVISIONER}",
        "managementClusterName": "${MGMT_CLUSTER}",
        "clusterName": "${CLUSTER_NAME}",
        "name": "tanzu-observability-saas"
    },
    "spec": {
        "configurations": {
            "url": "https://vmware.wavefront.com"
        },
        "secrets": {
            "token": "${WAVEFRONT_TOKEN}"
        }
    }
}

EOF
tmc cluster integration create -f TO.json
rm TO.json