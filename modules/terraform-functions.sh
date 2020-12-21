#!/bin/bash

# Author: Yonny Vizcaya
# Version: 1.0.0
# Description: Terraform functionality.

PROJECT_ID=$(gcloud config get-value project)

function buildTerraform() {
    terraform init -input=false &&
        terraform plan -out=tfplan -input=false -var 'PROJECT_ID='${1}'' &&
        terraform apply -input=false tfplan
}

function terraformDestroy() {
    terraform destroy -auto-approve \
        -input=false \
        -var 'PROJECT_ID='${1}''
}

function terraformUpdate() {
    echo "Not Implemented"
}
