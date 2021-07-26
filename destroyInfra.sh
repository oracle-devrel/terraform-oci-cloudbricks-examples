# Copyright (c) 2021 Oracle and/or its affiliates.
#!/bin/bash
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# destroyInfra.sh 
#
# Purpose: This script encapsulates the creation logic of an environment


echo 'Sourcing environment variables'
source setEnv.sh

if [ "$#" -ne 1 ]; then
    echo "Missing system to create. Usage: ./provisionInfra.sh SYSTEMNAME"
else
echo "*******************************************************************************************  WARNING  *************************************************************************************************************************"
echo "*   The following is a customer production infrastructure. Type 'yes' and hit enter, if you want to continue with the destruction of the environment. Neglecting something here may drop entire customer infrastructure       *"
echo "*******************************************************************************************  WARNING  *************************************************************************************************************************"
read continue_with_process

if [ $continue_with_process == "yes" ]; then

#Terraform execution
echo 'Executing with terrform version:' $(terraform --version)
#terraform --version
echo $TERRAFORM_ARTIFACT_WORKSPACE
    if [[ -d $TERRAFORM_ARTIFACT_WORKSPACE ]]; then 

        echo "=================== EXECUTING TERRAFORM ======================="
        cd $TERRAFORM_ARTIFACT_WORKSPACE
        echo "--- Deleting temporal lingering files"
        tf_lock=.terraform.lock.hcl
        tf_dir=.terraform
        if [[ -f $tf_lock ]]; then
            rm $tf_lock
        fi  
        if [[ -d $tf_dir ]]; then
            rm -rf $tf_dir
        fi  
        for (( k=1; k<=5; k++ ))
        do  
            
            echo "--- Executing terraform init (pass $k of 5)" 
            terraform init            
            if [ $? == 0 ]; then 
                STATE_TERRAFORM_INIT="true"
                break ; 
            fi

            echo "--- Error in terraform init. Retrying terraform init in 10 seconds."
            sleep 10
        done

                for (( k=1; k<=5; k++ ))
        do  
            
            echo "--- Executing terraform validate (pass $k of 5)"        
            terraform validate
       
            if [ $? == 0 ]; then 
                STATE_TERRAFORM_INIT="true"
                break ; 
            fi

            echo "--- Error in terraform validate. Retrying terraform init in 10 seconds."
            sleep 10
        done

                for (( k=1; k<=5; k++ ))
        do  
            
        echo "--- Executing terraform destroy (pass $k of 5)" 
            terraform destroy --var-file=system.tfvars --auto-approve
            if [ $? == 0 ]; then 
                STATE_TERRAFORM_INIT="true"
                break ; 
            fi

            echo "--- Error in terraform destroy. Retrying terraform init in 10 seconds."
            sleep 10
        done

        
    else 
        echo 'System does not exist. Try again'
    fi
    else echo 'Process cancelled. Exiting'
  fi  
fi