#!/bin/bash

export TMC_API_TOKEN=$1
tmc login --no-configure --name cs-gitops

echo "creating cluster"



RESULT=$(tmc cluster create -f $CLUSTER_YAML 2>&1)
CREATE_ERROR=$?

if [ CREATE_ERROR -eq 1 ] && [[ "${RESULT}" == *"AlreadyExists"* ]]; then

tmc cluster update -f $CLUSTER_YAML

else if [ CREATE_ERROR -eq 1 ]
echo $RESULT
exit 1

else

echo $RESULT
exit 0
fi