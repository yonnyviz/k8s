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

function deployApp() {
    local PROJECT_ID=${1}
    local APP_NAME=${2}
    local REPLICAS=${3}

    kubectl create deployment ${APP_NAME} --image=gcr.io/${PROJECT_ID}/${APP_NAME}:latest &&
        kubectl scale deployment ${APP_NAME} --replicas=${REPLICAS} &&
        kubectl expose deployment ${APP_NAME} \
            --name=${APP_NAME}-service \
            --type=LoadBalancer \
            --port 80 \
            --target-port 8080
}

function destroyAppService() {
    local PROJECT_ID=${1}
    local APP_NAME=${2}
    local REPLICAS=${3}

    kubectl delete service ${APP_NAME}-service &&
        gcloud container clusters delete ${PROJECT_ID}-gke &&
        gcloud container images delete gcr.io/${PROJECT_ID}/${APP_NAME}:v1 --force-delete-tags --quiet &&
        gcloud container images delete gcr.io/${PROJECT_ID}/${APP_NAME}:v2 --force-delete-tags --quiet

}

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
