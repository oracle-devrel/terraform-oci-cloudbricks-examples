# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# system.tfvars
#
# Purpose: The following script defines the system particular variables to provision environment

######################################## COMMON VARIABLES ######################################
region           = "re-region-1"
tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaabcedfghijklmonoprstuvwxyz"
user_ocid        = "ocid1.tenancy.oc1..aaaaaaaabcedfghijklmonoprstuvwxyz"
fingerprint      = "fo:oo:ba:ar:ba:ar"
private_key_path = "/absolute/path/to/api/key/your_api_key.pem"
######################################## COMMON VARIABLES ######################################
######################################## ARTIFACT SPECIFIC VARIABLES ######################################
ssh_public_key                          = "/absolute/path/to/api/key/your_ssh_public_key.pub"
ssh_private_key                         = "/absolute/path/to/api/key/your_ssh_private_key"
compute_nsg_name                        = "MY_NSG"
linux_compute_instance_compartment_name = "MY_ARTIFACT_COMPARTMENT"
linux_compute_network_compartment_name  = "MY_NETWORK_COMPARTMENT"
private_network_subnet_name             = "MY_PRIVATE_SUBNET"
vcn_display_name                        = "MY_VCN"

postgresql_replicat_username = "replicator"
postgresql_password          = "MY_DATABASE_PASSWORD"
postgresql_version           = "14"
database_size_in_gb          = "50"
database_vpus_per_gb         = "10"
database_backup_policy_level = "gold"
instance_backup_policy_level = "bronze"

postgresql_master_name          = "MY_MASTER_INSTANCE_NAME"
postgresql_master_ad            = "aBCD:RE-REGION-1-AD-1"
postgresql_master_fd            = "FAULT-DOMAIN-1"
postgresql_master_shape         = "VM.Standard2.2"

postgresql_hotstandby_is_flex_shape = false
postgresql_hotstandby_shape         = "VM.Standard2.1"

postgresql_deploy_hotstandby1 = true
postgresql_standyby1_name     = "MY_HOTSTANDBY1_INSTANCE_NAME"
postgresql_hotstandby1_ad     = "aBCD:RE-REGION-1-AD-2"
postgresql_hotstandby1_fd     = "FAULT-DOMAIN-1"

postgresql_deploy_hotstandby2 = true
postgresql_standyby2_name     = "MY_HOTSTANDBY2_INSTANCE_NAME"
postgresql_hotstandby2_ad     = "aBCD:RE-REGION-1-AD-3"
postgresql_hotstandby2_fd     = "FAULT-DOMAIN-1"
######################################## ARTIFACT SPECIFIC VARIABLES ######################################
