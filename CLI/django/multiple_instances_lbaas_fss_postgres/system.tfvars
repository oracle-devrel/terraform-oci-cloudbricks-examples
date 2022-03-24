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

######################################## INSTANCE01 SPECIFIC VARIABLES ###########################################
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
instance01_num_instances                                    = 2
instance01_is_nsg_required                                  = false
instance01_compute_nsg_name                                 = "MY_NSG"
instance01_compute_display_name_base                        = "lnxmachine"
instance01_instance_image_ocid                              = "ocid1.image.oc1.re-region-1.aaaaaaaaadjm5mskcp6zmpoxajqutyiictchscltnunfmheq65rkcqpb3yua"  #Oracle-Linux-8.5-2022.02.25-0
instance01_instance_shape                                   = "VM.Standard.E4.Flex"
instance01_is_flex_shape                                    = true
instance01_instance_shape_config_ocpus                      = 1
instance01_instance_shape_config_memory_in_gbs              = 16
######################################## INSTANCE01 SPECIFIC VARIABLES ################################################

######################################## POSTGRE01 SPECIFIC VARIABLES ###################################################
postgre01_ssh_public_key                                              = "/path/to/public/ssh/key/pub_key"
postgre01_ssh_private_key                                             = "/path/to/private/ssh/key/priv_key"
postgre01_compute_nsg_name                                            = ""
postgre01_linux_compute_instance_compartment_name                     = "MY_ARTIFACT_COMPARTMENT"
postgre01_linux_compute_network_compartment_name                      = "MY_NETWORK_COMPARTMENT"
postgre01_private_network_subnet_name                                 = "My_Private_Subnet"
postgre01_vcn_display_name                                            = "MY_VCN"

postgre01_postgresql_replicat_username                                = "replicator"
postgre01_postgresql_password                                         = "MY_DATABASE_PASSWORD"
postgre01_postgresql_version                                          = "14"
postgre01_database_size_in_gb                                         = "50"
postgre01_database_vpus_per_gb                                        = "10"
postgre01_database_backup_policy_level                                = "gold"
postgre01_instance_backup_policy_level                                = "bronze"

postgre01_postgresql_master_name                                      = "master"
postgre01_postgresql_master_ad                                        = "aBCD:foo-REGION-1-AD-1"
postgre01_postgresql_master_fd                                        = "FAULT-DOMAIN-1"
postgre01_postgresql_master_shape                                     = "VM.Standard2.2"

postgre01_postgresql_hotstandby_is_flex_shape                         = false
postgre01_postgresql_hotstandby_shape                                 = "VM.Standard2.1"

postgre01_postgresql_deploy_hotstandby1                               = true
postgre01_postgresql_standyby1_name                                   = "slave1"
postgre01_postgresql_hotstandby1_ad                                   = "aBCD:foo-REGION-1-AD-2"
postgre01_postgresql_hotstandby1_fd                                   = "FAULT-DOMAIN-1"

postgre01_postgresql_deploy_hotstandby2                               = true
postgre01_postgresql_standyby2_name                                   = "slave2"
postgre01_postgresql_hotstandby2_ad                                   = "aBCD:foo-REGION-1-AD-3"
postgre01_postgresql_hotstandby2_fd                                   = "FAULT-DOMAIN-1"
######################################## POSTGRE01 SPECIFIC VARIABLES ###################################################


######################################## FSSDISK01 SPECIFIC VARIABLES ##################################################
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
######################################## FSSDISK01 SPECIFIC VARIABLES ####################################################

######################################## BACKENDSET01 SPECIFIC VARIABLES ##################################################
backendset01_lbaas_bes_single_instance_compartment_name     = "MY_ARTIFACT_COMPARTMENT"
backendset01_lbaas_bes_single_network_compartment_name      = "MY_NETWORK_COMPARTMENT"
backendset01_network_subnet_name                            = "MY_SUBNET"
backendset01_vcn_display_name                               = "MY_VCN"
backendset01_is_app_bes                                     = true
backendset01_backend_set_name                               = "bessingle"
backendset01_lbaas_policy                                   = "ROUND_ROBIN"
backendset01_checkport                                      = "80"
backendset01_check_protocol                                 = "TCP"
backendset01_session_persistance_cookie_name                = "COOKIE"
backendset01_listener_name                                  = "listener"
backendset01_listen_port                                    = "80"
backendset01_listen_protocol                                = "HTTP"
backendset01_backend_port                                   = "80"
######################################## BACKENDSET01 SPECIFIC VARIABLES ##################################################

######################################## LOADBALANCER01 SPECIFIC VARIABLES #################################################
loadbalancer01_lbaas_instance_compartment_name              = "MY_ARTIFACT_COMPARTMENT"
loadbalancer01_lbaas_network_compartment_name               = "MY_NETWORK_COMPARTMENT"
loadbalancer01_network_subnet_name                          = "MY_SUBNET"
loadbalancer01_vcn_display_name                             = "MY_VCN"
loadbalancer01_lbaas_display_name                           = "lbaas"
loadbalancer01_lbaas_shape                                  = "flexible"
loadbalancer01_lbaas_shape_min_bw_mbps                      = "100"
loadbalancer01_lbaas_shape_max_bw_mbps                      = "100"
loadbalancer01_lb_nsg_name                                  = "MY_NSG"
loadbalancer01_is_app_lbaas                                 = true
loadbalancer01_is_private                                   = false
######################################## LOADBALANCER01 SPECIFIC VARIABLES ##################################################

######################################## DJANGOCONFIG01 SPECIFIC VARIABLES ##################################################
djangoconfig01_ssh_public_key                               = "/path/to/public/ssh/key/pub_key"
djangoconfig01_ssh_private_key                              = "/path/to/private/ssh/key/priv_key"
djangoconfig01_ssh_public_is_path                           = true
djangoconfig01_ssh_private_is_path                          = true
djangoconfig01_script_name                                  = "./scripts/script.sh"
djangoconfig01_script_args                                  = ""
######################################## DJANGOCONFIG01 SPECIFIC VARIABLES ###################################################