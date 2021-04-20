#!/bin/bash

export changedYaml=$(git diff --name-only HEAD^ HEAD)
echo $changedYaml

if [[ "${changedYaml}" != *"clusters"* ]]; then
echo "no relevant changes"
exit 1
fi
