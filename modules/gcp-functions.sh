#!/bin/bash

# Author: Yonny Vizcaya
# Version: 1.0.0
# Description: Google Cloud functionality.

ACTIVE_ACCOUNT=$(gcloud auth list --filter=status:ACTIVE --format="value(account)")
PROJECT_ID=$(gcloud config get-value project)

function activateServiceAccount() {
    gcloud auth activate-service-account \
        --key-file=${1}
}

function configureKubectl() {

function buildAndPushImage() {
    local DOCKERFILE_PATH=${1}
    local PROJECT_ID=${2}
    local APP_NAME=${3}

    docker build -t gcr.io/${PROJECT_ID}/${APP_NAME} ${DOCKERFILE_PATH} &&
        docker push gcr.io/${PROJECT_ID}/${APP_NAME}
}

function terraformUpdate() {
    echo "Not Implemented"
}
