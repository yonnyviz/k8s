#!/bin/bash

# Author: Yonny Vizcaya
# Version: 1.0.0
# Description: Terraform functionality.

function terraformBuild() {
    shift
    while getopts ":c:p:" opt; do
        case ${opt} in
        c)
            local TF_VAR_credentials_file_path=${OPTARG}
            ;;
        p)
            local TF_VAR_project_id=${OPTARG}
            ;;
        \?)
            echo "Dev help test"
            exit 1
            ;;
        esac
    done
    shift $((OPTIND - 1))

    echo "terraform init -input=false && terraform plan -out=tfplan -input=false -var 'credentials_file_path=${TF_VAR_credentials_file_path}' -var 'project_id=${TF_VAR_project_id}'"
}

function terraformDestroy() {
    echo "Not Implemented"
}

function terraformUpdate() {
    echo "Not Implemented"
}
