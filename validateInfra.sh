# Copyright (c) 2021 Oracle and/or its affiliates.
#!/bin/bash
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# validateInfra.sh 
#
# Purpose: This script encapsulates the creation logic of an environment


echo 'Sourcing environment variables'
source setEnv.sh

if [ "$#" -ne 2 ]; then
    echo "Missing system to create. Usage: ./validateInfra.sh SYSTEMNAME CALCULATE_PLAN? [y/n]"
else
#Terraform execution
echo 'Executing with terrform version:' $(terraform --version)
#terraform --version
echo $TERRAFORM_ARTIFACT_WORKSPACE
    if [[ -d $TERRAFORM_ARTIFACT_WORKSPACE ]]; then 

        echo "=================== EXECUTING TERRAFORM ======================="
        cd $TERRAFORM_ARTIFACT_WORKSPACE

        echo "--- Validating Infrastructure" 
        terraform init  
        terraform validate   
        if [[ $2 = "y" || $2 = "yes" ]]; then
            echo "--- Calculating plan"     
            terraform plan --var-file=system.tfvars   
        fi 
        echo "--- Deleting temporal lingering files"
        tf_lock=.terraform.lock.hcl
        tf_dir=.terraform
        lpg_config_dir=lpg_routes_config
        if [[ -f $tf_lock ]]; then
            rm $tf_lock
        fi  
        if [[ -d $tf_dir ]]; then
            rm -rf $tf_dir
        fi  
        if [[ -d $lpg_config_dir ]]; then
            rm -rf $tf_dir
        fi   
    fi

fi