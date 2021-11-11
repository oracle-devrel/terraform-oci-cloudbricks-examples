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
postgre01_ssh_public_key                          = "/absolute/path/to/api/key/your_ssh_public_key.pub"
postgre01_ssh_private_key                         = "/absolute/path/to/api/key/your_ssh_private_key"
postgre01_compute_nsg_name                        = "MY_NSG"
postgre01_linux_compute_instance_compartment_name = "MY_ARTIFACT_COMPARTMENT"
postgre01_linux_compute_network_compartment_name  = "MY_NETWORK_COMPARTMENT"
postgre01_private_network_subnet_name             = "MY_PRIVATE_SUBNET"
postgre01_vcn_display_name                        = "MY_VCN"

postgre01_postgresql_replicat_username = "replicator"
postgre01_postgresql_password          = "MY_DATABASE_PASSWORD"
postgre01_postgresql_version           = "14"
postgre01_database_size_in_gb          = "50"
postgre01_database_vpus_per_gb         = "10"
postgre01_database_backup_policy_level = "gold"
postgre01_instance_backup_policy_level = "bronze"

postgre01_postgresql_master_name          = "MY_MASTER_INSTANCE_NAME"
postgre01_postgresql_master_ad            = "aBCD:RE-REGION-1-AD-1"
postgre01_postgresql_master_fd            = "FAULT-DOMAIN-1"
postgre01_postgresql_master_shape         = "VM.Standard2.2"

postgre01_postgresql_hotstandby_is_flex_shape = false
postgre01_postgresql_hotstandby_shape         = "VM.Standard2.1"

postgre01_postgresql_deploy_hotstandby1 = true
postgre01_postgresql_standyby1_name     = "MY_HOTSTANDBY1_INSTANCE_NAME"
postgre01_postgresql_hotstandby1_ad     = "aBCD:RE-REGION-1-AD-2"
postgre01_postgresql_hotstandby1_fd     = "FAULT-DOMAIN-1"

postgre01_postgresql_deploy_hotstandby2 = true
postgre01_postgresql_standyby2_name     = "MY_HOTSTANDBY2_INSTANCE_NAME"
postgre01_postgresql_hotstandby2_ad     = "aBCD:RE-REGION-1-AD-3"
postgre01_postgresql_hotstandby2_fd     = "FAULT-DOMAIN-1"
######################################## ARTIFACT SPECIFIC VARIABLES ######################################
