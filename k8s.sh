#!/bin/bash

# Author: Yonny Vizcaya
# Version: 1.0.0
# Description: Wrapper Scripts Automation Tool.

#
# imports
#
source $(pwd)"/modules/terraform-functions.sh"
source $(pwd)"/modules/gcp-functions.sh"

#
# Paths definitions
#
TERRAFORM_MODULE_PATH=$(pwd)"/terraform"

function create() {

    if [[ ! -z ${DOCKERFILE_PATH} ]]; then
        buildAndPushImage ${DOCKERFILE_PATH} ${PROJECT_ID} ${APP_NAME}
    fi

    activateServiceAccount ${KEY_FILE_PATH} &&
        cd ${TERRAFORM_MODULE_PATH} &&
        provisionInfrastructure ${PROJECT_ID}
    
    deployApp ${PROJECT_ID} ${APP_NAME} 1
}

function destroy() {
    cd ${TERRAFORM_MODULE_PATH} &&
        terraformDestroy ${PROJECT_ID}
}

function argParser() {
    shift
    while getopts "f:d:n:" opt; do
        case ${opt} in
        f)
            KEY_FILE_PATH=${OPTARG}
            ;;
        d)
            DOCKERFILE_PATH=${OPTARG}
            ;;
        n)
            APP_NAME=${OPTARG}
            ;;
        \?)
            echo "Dev help test"
            exit 1
            ;;
        esac
    done
    shift $((OPTIND - 1))
}

argParser $@

if [[ $# -gt 0 ]]; then
    if [[ $1 == "create" ]]; then
        create
    fi
    if [[ $1 == "destroy" ]]; then
        destroy
    fi
    if [[ $1 == "output" ]]; then
        echo "Not Implemented"
    fi
else
    echo "
        k8s create [ -f: key-file-path ] [ -d: dockerfile-folder-path ] [ -n: app-name ]
    "
fi
