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
redis01_ssh_public_key                          = "/absolute/path/to/api/key/your_ssh_public_key.pub"
redis01_ssh_private_key                         = "/absolute/path/to/api/key/your_ssh_private_key"
redis01_compute_nsg_name                        = "MY_NSG"
redis01_linux_compute_instance_compartment_name = "MY_ARTIFACT_COMPARTMENT"
redis01_linux_compute_network_compartment_name  = "MY_NETWORK_COMPARTMENT"
redis01_private_network_subnet_name             = "MY_PRIVATE_SUBNET"
redis01_vcn_display_name                        = "MY_VCN"

redis01_redis_master_name          = "MY_REDIS_MASTER_NAME"
redis01_redis_master_shape         = "VM.Standard2.1"
redis01_redis_master_ad            = "aBCD:RE-REGION-1-AD-1"
redis01_redis_master_fd            = "FAULT-DOMAIN-1"
redis01_redis_master_is_flex_shape = false
redis01_redis_master_ocpus         = ""
redis01_redis_master_memory_in_gb  = ""

redis01_redis_replica_name          = "MY_REDIS_REPLICA_NAME"
redis01_redis_replica_count         = "3"
redis01_redis_replica_shape         = "VM.Standard2.1"
redis01_redis_replica_ad_list       = ["aBCD:RE-REGION-1-AD-1", "aBCD:RE-REGION-1-AD-2", "aBCD:RE-REGION-1-AD-3"]
redis01_redis_replica_fd_list       = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3"]
redis01_redis_replica_is_flex_shape = false
redis01_redis_replica_memory_in_gb  = ""
redis01_redis_replica_ocpus         = ""

redis01_redis_version = "6.2.5"

redis01_instance_backup_policy_level = "bronze"

redis01_master_disk_size_in_gb     = "50"
redis01_master_disk_vpus_per_gb    = "10"
redis01_master_backup_policy_level = "bronze"

redis01_replica_disk_size_in_gb     = "50"
redis01_replica_disk_vpus_per_gb    = "10"
redis01_replica_backup_policy_level = "bronze"
######################################## ARTIFACT SPECIFIC VARIABLES ######################################
