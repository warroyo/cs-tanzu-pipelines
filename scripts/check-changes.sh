#!/bin/bash

export changedYaml=$(git diff --name-only HEAD^ HEAD)
echo "$changedYaml has changes"


