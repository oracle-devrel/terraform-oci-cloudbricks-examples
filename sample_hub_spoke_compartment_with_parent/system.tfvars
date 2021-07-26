/* system.tfvars
Author: DALQUINT - denny.alquinta@oracle.com
Purpose: The following script defines the system particular variables to provision environment
Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved. 
*/

######################################## PROVIDER SPECIFIC VARIABLES ######################################
tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaaoqdygmiidrabhv3y4hkr3rb3z6dpmgotvq2scffra6jt7rubresa"
region           = "us-ashburn-1"
user_ocid        = "ocid1.user.oc1..aaaaaaaafl42rhkw624h4os6n2ulcfxjjn2ylqsanhgtcph7j7owirzj6gya"
fingerprint      = "9a:9e:13:cf:94:6e:2c:b9:54:d2:60:0d:e4:14:8b:5e"
private_key_path = "/Users/dralquinta/OneDrive/DevOps/My_Keys/oci_api_key.pem"
######################################## PROVIDER SPECIFIC VARIABLES ######################################

######################################## mainbizcomp SPECIFIC VARIABLES ######################################
mainbizcomp_is_root_parent          = true
mainbizcomp_root_compartment_ocid   = "ocid1.tenancy.oc1..aaaaaaaaoqdygmiidrabhv3y4hkr3rb3z6dpmgotvq2scffra6jt7rubresa"
mainbizcomp_compartment_name        = "TF_mybizcomp"
mainbizcomp_compartment_description = "Terraform created Main Business Compartment"
mainbizcomp_enable_delete           = true
######################################## mainbizcomp SPECIFIC VARIABLES ######################################


######################################## hub01comp SPECIFIC VARIABLES ######################################
hub01comp_compartment_name        = "TF_hub01comp"
hub01comp_compartment_description = "Terraform created HUB Compartment"
hub01comp_enable_delete           = true
######################################## hub01comp SPECIFIC VARIABLES ######################################
######################################## hub01comp Artifact SPECIFIC VARIABLES ######################################
artifact_hub01comp_compartment_name        = "TF_ARTIFACT_hub01comp"
artifact_hub01comp_compartment_description = "Terraform created HUB Artifact Compartment"
artifact_hub01comp_enable_delete           = true
######################################## hub01comp Artifact SPECIFIC VARIABLES ######################################
######################################## hub01comp Network SPECIFIC VARIABLES ######################################
network_hub01comp_compartment_name        = "TF_NETWORK_hub01comp"
network_hub01comp_compartment_description = "Terraform created HUB Network Compartment"
network_hub01comp_enable_delete           = true
######################################## hub01comp Network SPECIFIC VARIABLES ######################################

######################################## spoke01comp SPECIFIC VARIABLES ######################################
spoke01comp_compartment_name        = "TF_spoke01comp"
spoke01comp_compartment_description = "Terraform created spoke01comp Compartment"
spoke01comp_enable_delete           = true
######################################## spoke01comp SPECIFIC VARIABLES ######################################
######################################## spoke01comp Artifact SPECIFIC VARIABLES ######################################
artifact_spoke01comp_compartment_name        = "TF_ARTIFACT_spoke01comp"
artifact_spoke01comp_compartment_description = "Terraform created spoke01comp Artifact Compartment"
artifact_spoke01comp_enable_delete           = true
######################################## spoke01comp Artifact SPECIFIC VARIABLES ######################################
######################################## spoke01comp Network SPECIFIC VARIABLES ######################################
network_spoke01comp_compartment_name        = "TF_NETWORK_spoke01comp"
network_spoke01comp_compartment_description = "Terraform created spoke01comp Network Compartment"
network_spoke01comp_enable_delete           = true
######################################## spoke01comp Network SPECIFIC VARIABLES ######################################

######################################## spoke02comp SPECIFIC VARIABLES ######################################
spoke02comp_compartment_name        = "TF_spoke02comp"
spoke02comp_compartment_description = "Terraform created spoke02comp Compartment"
spoke02comp_enable_delete           = true
######################################## spoke02comp SPECIFIC VARIABLES ######################################
######################################## spoke02comp Artifact SPECIFIC VARIABLES ######################################
artifact_spoke02comp_compartment_name        = "TF_ARTIFACT_spoke02comp"
artifact_spoke02comp_compartment_description = "Terraform created spoke02comp Artifact Compartment"
artifact_spoke02comp_enable_delete           = true
######################################## spoke02comp Artifact SPECIFIC VARIABLES ######################################
######################################## spoke02comp Network SPECIFIC VARIABLES ######################################
network_spoke02comp_compartment_name        = "TF_NETWORK_spoke02comp"
network_spoke02comp_compartment_description = "Terraform created spoke02comp Network Compartment"
network_spoke02comp_enable_delete           = true
######################################## spoke02comp Network SPECIFIC VARIABLES ######################################