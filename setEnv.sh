# Copyright (c) 2021 Oracle and/or its affiliates.
#!/bin/bash
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# setEnv.sh 
#
# Purpose: This script wrapper executes logic for getting output from terraform, then filling both ansible_hosts and playbook.yaml for corresponding role.

export TERRAFORM_WORKSPACE='/home/opc/REPOS/OCIFE'
export PROJECT='terraform-oci-cloudbricks-examples'
export SYSTEM=$1
export TERRAFORM_ARTIFACT_WORKSPACE=$TERRAFORM_WORKSPACE/$PROJECT/$SYSTEM