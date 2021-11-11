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
dbcs01_ssh_public_key                  = "/absolute/path/to/public/ssh/key/your_public_ssh_key.pub"
dbcs01_ssh_private_key                 = "/absolute/path/to/private/ssh/key/your_private_ssh_key"
dbcs01_ssh_public_is_path              = true
dbcs01_ssh_private_is_path             = true
dbcs01_fault_domains                   = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2"]
dbcs01_dbcs_availability_domain_number = 1
dbcs01_dbcs_instance_compartment_name  = "MY_ARTIFACT_COMPARTMENT"
dbcs01_dbcs_network_compartment_name   = "MY_NETWORK_COMPARTMENT"
dbcs01_network_subnet_name             = "MY_SUBNET"
dbcs01_vcn_display_name                = "MY_VCN"
dbcs01_cluster_name                    = "MY_CLUSTER_NAME"
dbcs01_db_admin_password               = "MY_ADMIN_PASSWORD"
dbcs01_db_name                         = "MY_DB_NAME"
dbcs01_db_display_name                 = "MY_DB_DISPLAY_NAME"
dbcs01_db_home_display_name            = "MY_DB_HOME_DISPLAY_NAME"
dbcs01_character_set                   = "AL32UTF8"
dbcs01_n_character_set                 = "AL16UTF16"
dbcs01_db_workload                     = "OLTP"
dbcs01_db_version                      = "19.11.0.0"
dbcs01_database_software_image_id      = "ocid1.databasesoftwareimage.oc1.re-region.1.aaaaaaaaoprstuv"
dbcs01_pdb_name                        = "MY_PLUGGABLE_DB_NAME"
dbcs01_db_disk_redundancy              = "HIGH"
dbcs01_db_system_shape                 = "VM.Standard2.2"
dbcs01_hostname                        = "MY_HOSTNAME"
dbcs01_data_storage_size_in_gb         = "2048"
dbcs01_license_model                   = "BRING_YOUR_OWN_LICENSE"
dbcs01_node_count                      = "2"
dbcs01_dbcs_nsg_name                   = "MY_NSG"
dbcs01_db_edition                      = "ENTERPRISE_EDITION_EXTREME_PERFORMANCE"
dbcs01_time_zone                       = "MY_CONTINENT/MY_CITY"
dbcs01_auto_backup_enabled             = true
dbcs01_recovery_window_in_days         = 7
dbcs01_auto_backup_window_utc          = "08:00AM-10:00AM_UTC"
######################################## ARTIFACT SPECIFIC VARIABLES ######################################
