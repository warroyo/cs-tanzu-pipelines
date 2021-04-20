#!/bin/bash

export TMC_API_TOKEN=$1
tmc login --no-configure --name cs-gitops


RESULT=$(tmc cluster create -f $CLUSTER_YAML 2>&1)
CREATE_ERROR=$?

if [ $CREATE_ERROR -eq 1 ] && [[ "${RESULT}" == *"AlreadyExists"* ]]; then
echo "cluster exists updating..."
tmc cluster update -f $CLUSTER_YAML

elif [ $CREATE_ERROR -eq 1 ]; then
echo "there was an error"
echo $RESULT
exit 1

else
echo "creating cluster.."
echo $RESULT
exit 0
fi