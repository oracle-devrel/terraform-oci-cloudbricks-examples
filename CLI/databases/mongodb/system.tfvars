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
mongodb01_ssh_public_key                          = "/absolute/path/to/api/key/your_ssh_public_key.pub"
mongodb01_ssh_private_key                         = "/absolute/path/to/api/key/your_ssh_private_key"
mongodb01_compute_nsg_name                        = "MY_NSG"
mongodb01_linux_compute_instance_compartment_name = "MY_ARTIFACT_COMPARTMENT"
mongodb01_linux_compute_network_compartment_name  = "MY_NETWORK_COMPARTMENT"
mongodb01_private_network_subnet_name             = "MY_PRIVATE_SUBNET"
mongodb01_vcn_display_name                        = "MY_VCN"

mongodb01_config_server_name          = "MY_CONFIG_SERVER_NAME"
mongodb01_config_server_shape         = "VM.Standard2.1"
mongodb01_config_server_count         = 3
mongodb01_config_server_ad_list       = ["aBCD:RE-REGION-1-AD-1", "aBCD:RE-REGION-1-AD-2", "aBCD:RE-REGION-1-AD-3"]
mongodb01_config_server_fd_list       = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3"]
mongodb01_config_server_is_flex_shape = false
mongodb01_config_server_ocpus         = ""
mongodb01_config_server_memory_in_gb  = ""

mongodb01_query_server_name          = "MY_QUERY_SERVER"
mongodb01_query_server_shape         = "VM.Standard2.1"
mongodb01_query_server_count         = 2
mongodb01_query_server_ad_list       = ["aBCD:RE-REGION-1-AD-1", "aBCD:RE-REGION-1-AD-2", "aBCD:RE-REGION-1-AD-3"]
mongodb01_query_server_fd_list       = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3"]
mongodb01_query_server_is_flex_shape = false
mongodb01_query_server_ocpus         = ""
mongodb01_query_server_memory_in_gb  = ""

mongodb01_shard_replica_set_name          = "MY_SHARD_SERVER_NAME"
mongodb01_shard_replica_set_shape         = "VM.Standard2.1"
mongodb01_shard_replica_set_count         = 3
mongodb01_shard_replica_set_ad_list       = ["aBCD:RE-REGION-1-AD-1", "aBCD:RE-REGION-1-AD-2", "aBCD:RE-REGION-1-AD-3"]
mongodb01_shard_replica_set_fd_list       = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3"]
mongodb01_shard_replica_set_is_flex_shape = false
mongodb01_shard_replica_set_ocpus         = ""
mongodb01_shard_replica_set_memory_in_gb  = ""

mongodb01_instance_backup_policy_level = "bronze"

mongodb01_config_disk_size_in_gb     = "50"
mongodb01_config_disk_vpus_per_gb    = "10"
mongodb01_config_backup_policy_level = "bronze"

mongodb01_query_disk_size_in_gb     = "50"
mongodb01_query_disk_vpus_per_gb    = "10"
mongodb01_query_backup_policy_level = "bronze"

mongodb01_database_size_in_gb          = "50"
mongodb01_database_vpus_per_gb         = "10"
mongodb01_database_backup_policy_level = "bronze"

mongodb01_mongodb_version = "5.0"
######################################## ARTIFACT SPECIFIC VARIABLES ######################################
