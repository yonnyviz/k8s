#!/bin/bash

# Author: Yonny Vizcaya
# Version: 1.0.0
# Description: Wrapper Scripts Automation Tool.

#
# imports
#
source $(pwd)"/modules/terraform-functions.sh"

#
# Paths definitions
#
terraform_module_path=$(pwd)"/terraform"


if [[ $# -gt 0 ]]; then
    if [[ $1 == "create" ]]; then
        echo "Creating"
        cd ${terraform_module_path} && terraformBuild $@
    fi
    if [[ $1 == "destroy" ]]; then
        echo "Destroying"
    fi
    if [[ $1 == "output" ]]; then
        echo "Outputing"
    fi
else
    echo "
        k8s create [ -c: credential-file ] [ -p: project-id ]
    "
fi
