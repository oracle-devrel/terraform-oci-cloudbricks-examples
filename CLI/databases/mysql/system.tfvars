# Copyright (c) 2022 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# system.tfvars
#
# Purpose: The following script defines the system particular variables to provision environment

######################################## PROVIDER SPECIFIC VARIABLES ######################################
region           = "re-region-1"
tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaabcedfghijklmonoprstuvwxyz"
user_ocid        = "ocid1.tenancy.oc1..aaaaaaaabcedfghijklmonoprstuvwxyz"
fingerprint      = "fo:oo:ba:ar:ba:ar"
private_key_path = "/absolute/path/to/api/key/your_api_key.pem"
######################################## PROVIDER SPECIFIC VARIABLES ######################################
######################################## ARTIFACT SPECIFIC VARIABLES ######################################
mysql01_mysql_network_compartment_name                  = "MY_NETWORK_COMPARTMENT"
mysql01_mysql_instance_compartment_name                 = "MY_ARTIFACT_COMPARTMENT"
mysql01_vcn_display_name                                = "MY_VCN"
mysql01_network_subnet_name                             = "MY_PRIVATE_SUBNET"
mysql01_mysql_db_system_admin_username                  = "ADMIN_USERNAME"
mysql01_mysql_db_system_admin_password                  = "ADMIN_PASSWORD"
mysql01_mysql_db_system_availability_domain             = "aBCD:RE-REGION-1-AD-1"
mysql01_mysql_shape_name                                = "MySQL.VM.Standard.E3.1.8GB"
mysql01_mysql_db_system_backup_policy_is_enabled        = true
mysql01_mysql_db_system_backup_policy_retention_in_days = "7"
mysql01_mysql_db_system_backup_policy_window_start_time = "02:30"
mysql01_mysql_db_system_data_storage_size_in_gb         = "50"
mysql01_mysql_db_system_description                     = "DESCRIPTION"
mysql01_mysql_db_system_display_name                    = "DISPLAY_NAME"
mysql01_mysql_db_system_fault_domain                    = "FAULT-DOMAIN-1"
mysql01_mysql_db_system_hostname_label                  = "MY_DATABASE_LABEL"
mysql01_mysql_db_system_is_highly_available             = false
mysql01_mysql_db_system_maintenance_window_start_time   = "SUNDAY 14:30"
mysql01_mysql_db_system_port                            = "3306"
mysql01_mysql_db_system_port_x                          = "33060"
######################################## ARTIFACT SPECIFIC VARIABLES ######################################
######################################## HEATWAVE SPECIFIC VARIABLES ######################################
mysql01_mysql_heatwave_enabled                          = false
mysql01_mysql_heatwave_cluster_size                     = 3
mysql01_mysql_heatwave_shape                            = "MySQL.HeatWave.VM.Standard.E3"
######################################## HEATWAVE SPECIFIC VARIABLES ######################################
