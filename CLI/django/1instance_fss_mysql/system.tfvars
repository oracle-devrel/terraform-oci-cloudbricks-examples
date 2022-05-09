# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# system.tfvars
#
# Purpose: The following script defines the system particular variables to provision environment

######################################## PROVIDER SPECIFIC VARIABLES ############################################
tenancy_ocid        = "ocid1.tenancy.oc1..foobarbar"
region              = "re-region-1"
user_ocid           = "ocid1.user.oc1..foobarbar"
fingerprint         = "fo:oo:ba:ar:ba:ar"
private_key_path    = "/foo/bar/path/oci_api_key.pem"
######################################## PROVIDER SPECIFIC VARIABLES ############################################

######################################## INSTANCE01 SPECIFIC VARIABLES ###################################################
instance01_ssh_public_key                                   = "/path/to/public/ssh/key/pub_key"
instance01_ssh_private_key                                  = "/path/to/private/ssh/key/priv_key"
instance01_ssh_public_is_path                               = true
instance01_ssh_private_is_path                              = true
instance01_compute_availability_domain_list                 = ["aBCD:foo-REGION-1-AD-1"]

instance01_network_subnet_name                              = "My_Public_Subnet"
instance01_assign_public_ip_flag                            = true
instance01_fault_domain_name                                = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3"]
instance01_bkp_policy_boot_volume                           = "bronze"
instance01_linux_compute_instance_compartment_name          = "MY_ARTIFACT_COMPARTMENT"
instance01_linux_compute_network_compartment_name           = "MY_NETWORK_COMPARTMENT"
instance01_vcn_display_name                                 = "MY_VCN"
instance01_num_instances                                    = 1
instance01_is_nsg_required                                  = false
instance01_compute_nsg_name                                 = "MY_NSG"
instance01_compute_display_name_base                        = "lnxmachine"
instance01_instance_image_ocid                              = "ocid1.image.oc1.re-region-1.aaaaaaaaadjm5mskcp6zmpoxajqutyiictchscltnunfmheq65rkcqpb3yua"  #Oracle-Linux-8.5-2022.02.25-0
instance01_instance_shape                                   = "VM.Standard.E4.Flex"
instance01_is_flex_shape                                    = true
instance01_instance_shape_config_ocpus                      = 1
instance01_instance_shape_config_memory_in_gbs              = 16
######################################## INSTANCE01 SPECIFIC VARIABLES ###################################################

######################################## MYSQL01 SPECIFIC VARIABLES ###################################################
mysql01_mysql_instance_compartment_name                         = "MY_ARTIFACT_COMPARTMENT"
mysql01_mysql_network_compartment_name                          = "MY_NETWORK_COMPARTMENT"
mysql01_vcn_display_name                                        = "MY_VCN"
mysql01_network_subnet_name                                     = "My_Private_Subnet"
mysql01_mysql_db_system_admin_username                          = "Username"
mysql01_mysql_db_system_admin_password                          = "Password"
mysql01_mysql_db_system_availability_domain                     = "aBCD:foo-REGION-1-AD-1"
mysql01_mysql_shape_name                                        = "MySQL.VM.Standard.E3.1.8GB"
mysql01_mysql_db_system_backup_policy_is_enabled                = true
mysql01_mysql_db_system_backup_policy_retention_in_days         = "7"
mysql01_mysql_db_system_backup_policy_window_start_time         = "02:30"
mysql01_mysql_db_system_data_storage_size_in_gb                 = "50"
mysql01_mysql_db_system_description                             = "My_Database"
mysql01_mysql_db_system_display_name                            = "MyDatabase"
mysql01_mysql_db_system_fault_domain                            = "FAULT-DOMAIN-1"
mysql01_mysql_db_system_hostname_label                          = "MYDATABASELABEL"
mysql01_mysql_db_system_is_highly_available                     = false
mysql01_mysql_db_system_maintenance_window_start_time           = "SUNDAY 14:30"
mysql01_mysql_db_system_port                                    = "3306"
mysql01_mysql_db_system_port_x                                  = "33060"
######################################## HEATWAVE SPECIFIC VARIABLES ###################################################
mysql01_mysql_heatwave_enabled                                  = false
mysql01_mysql_heatwave_cluster_size                             = 3
mysql01_mysql_heatwave_shape                                    = "MySQL.HeatWave.VM.Standard.E3"
######################################## MYSQL01 SPECIFIC VARIABLES ###################################################

######################################## FSSDISK01 SPECIFIC VARIABLES ####################################################
fssdisk01_num_of_fss                                        = 1
fssdisk01_export_path_base                                  = "fss"
fssdisk01_fss_display_name_base                             = "fssdisk"
fssdisk01_fss_instance_compartment_name                     = "MY_ARTIFACT_COMPARTMENT"
fssdisk01_fss_network_compartment_name                      = "MY_NETWORK_COMPARTMENT"
fssdisk01_mt_compartment_name                               = "MY_ARTIFACT_COMPARTMENT"
fssdisk01_vcn_display_name                                  = "MY_VCN"
fssdisk01_network_subnet_name                               = "My_Private_Subnet"
fssdisk01_fss_mount_target_availability_domain              = "aBCD:foo-REGION-1-AD-1"
fssdisk01_fss_mount_target_name                             = "mount_target"
fssdisk01_os_type                                           = "linux"
fssdisk01_ssh_private_key                                   = "/path/to/private/ssh/key/priv_key"
######################################## FSSDISK01 SPECIFIC VARIABLES ########################################

######################################## DJANGOCONFIG01 SPECIFIC VARIABLES ###################################
djangoconfig01_ssh_public_key      = "/path/to/public/ssh/key/pub_key"
djangoconfig01_ssh_private_key     = "/path/to/private/ssh/key/priv_key"
djangoconfig01_ssh_public_is_path  = true
djangoconfig01_ssh_private_is_path = true
djangoconfig01_script_name         = "./scripts/script.sh"
djangoconfig01_script_args         = ""
######################################## DJANGOCONFIG01 SPECIFIC VARIABLES ###################################