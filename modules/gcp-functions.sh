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

    echo "gcloud container clusters get-credentials ${TF_VAR_k8s_name} --region ${TF_VAR_region}"

}

function terraformUpdate() {
    echo "Not Implemented"
}
