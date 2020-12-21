#!/bin/bash

# Author: Yonny Vizcaya
# Version: 1.0.0
# Description: Terraform functionality.

PROJECT_ID=$(gcloud config get-value project)

function provisionInfrastructure() {
    local PROJECT_ID=${1}

    terraform init -input=false &&
        terraform plan -out=tfplan -input=false -var 'PROJECT_ID='${PROJECT_ID}'' &&
        terraform apply -input=false tfplan
}

function terraformDestroy() {
    local PROJECT_ID=${1}

    terraform destroy -auto-approve \
        -input=false \
        -var 'PROJECT_ID='${PROJECT_ID}''
}

function terraformUpdate() {
    echo "Not Implemented"
}
