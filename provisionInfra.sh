# Copyright (c) 2021 Oracle and/or its affiliates.
#!/bin/bash
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# provisionInfra.sh 
#
# Purpose: This script encapsulates the creation logic of an environment


echo 'Sourcing environment variables'
source setEnv.sh
retry_attempts=5

if [ "$#" -ne 1 ]; then
    echo "Missing system to create. Usage: ./provisionInfra.sh SYSTEMNAME"
else
echo "**************************************************************************  WARNING  *********************************************************************************"
echo "*   The following script will provision infrastructure. Type 'yes' and hit enter, if you want to continue. Neglecting something here may drop entire infrastructure  *"
echo "**************************************************************************  WARNING  *********************************************************************************"
read continue_with_process

if [ $continue_with_process == "yes" ]; then

#Terraform execution
echo 'Executing with terrform version:' $(terraform --version)
terraform --version
echo $TERRAFORM_ARTIFACT_WORKSPACE
    if [[ -d $TERRAFORM_ARTIFACT_WORKSPACE ]]; then 
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

        echo "=================== EXECUTING TERRAFORM ======================="
        cd $TERRAFORM_ARTIFACT_WORKSPACE
        for (( k=1; k<=$retry_attempts; k++ ))
        do  
            
            echo "--- Executing terraform init (pass $k of 5)" 
            terraform init            
            if [ $? == 0 ]; then 
                STATE_TERRAFORM_INIT="true"
                break ; 
            fi

            echo "--- Error in terraform init. Retrying terraform init in 20 seconds."
            sleep 20
        done

                for (( k=1; k<=$retry_attempts; k++ ))
        do  
            
            echo "--- Executing terraform validate (pass $k of 5)"        
            terraform validate
       
            if [ $? == 0 ]; then 
                STATE_TERRAFORM_INIT="true"
                break ; 
            fi

            echo "--- Error in terraform validate. Retrying terraform init in 20 seconds."
            sleep 20
        done

                for (( k=1; k<=$retry_attempts; k++ ))
        do  
            
        echo "--- Executing terraform apply (pass $k of 5)" 
            terraform apply --var-file=system.tfvars --auto-approve
            if [ $? == 0 ]; then 
                STATE_TERRAFORM_INIT="true"
                break ; 
            fi

            echo "--- Error in terraform apply. Retrying terraform init in 20 seconds."
            sleep 20
        done

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
    else 
        echo 'System does not exist. Try again'
    fi
    else echo 'Process cancelled. Exiting'
  fi  
fi