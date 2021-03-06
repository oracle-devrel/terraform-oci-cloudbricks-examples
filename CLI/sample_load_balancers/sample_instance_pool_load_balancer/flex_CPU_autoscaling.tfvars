# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# system.tfvars
#
# Purpose: The following script defines the system particular variables to provision environment


######################################## PROVIDER SPECIFIC VARIABLES ######################################
tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaaoqdygmiidrabhv3y4hkr3rb3z6dpmgotvq2scffra6jt7rubresa"
region           = "uk-london-1"
user_ocid        = "ocid1.user.oc1..aaaaaaaaks2c4yiciufzzpcixzsmgstgtprvpymv6zonmkyq6sbsnsokblpa"
fingerprint      = "57:4d:4f:3e:d0:fa:f8:93:38:43:b4:80:7f:b4:47:94"
private_key_path = "~/.ssh/OCI_KEYS/API/auto_api_key.pem"
######################################## PROVIDER SPECIFIC VARIABLES ######################################

######################################## INSTANCEPOOL01 SPECIFIC VARIABLES ######################################

instancepool01_compute_availability_domain_map              = { "ad1" : "aBCD:RE-REGION-1-AD-1" }

instancepool01_network_subnet_name                          = "My_Subnet"
instancepool01_assign_public_ip_flag                        = true
instancepool01_bkp_policy_boot_volume                       = "gold"
instancepool01_linux_compute_instance_compartment_name      = "MY_ARTIFACT_COMPARTMENT"
instancepool01_linux_compute_network_compartment_name       = "MY_NETWORK_COMPARTMENT"
instancepool01_vcn_display_name                             = "MY_VCN"
instancepool01_pool_size                                    = 2
instancepool01_is_flex_shape                                = true
instancepool01_instance_config_shape                        = "VM.Standard.E4.Flex"
instancepool01_instance_shape_config_ocpus                  = 2
instancepool01_instance_shape_config_memory_in_gbs          = 32

instancepool01_is_load_balancer_required                    = true

instancepool01_instance_display_name_base                   = "My_Instance"
instancepool01_compute_display_name_base                    = "My_Instance_Pool"
instancepool01_base_compute_image_ocid                      = "ocid1.image.oc1.re-region-1.aaaaaaaawxyz" 
instancepool01_instance_configuration_display_name          = "My_Config_Name"

instancepool01_autoscaling_config_display_name              = "My_Autoscaling_Config_Name"
instancepool01_is_autoscaling_enabled                       = true
instancepool01_autoscaling_cooldown                         = 300

instancepool01_autoscaling_is_cpu                           = true
instancepool01_max_autoscale_instance_number                = 4
instancepool01_min_autoscale_instance_number                = 2
instancepool01_threshold_scale_out                          = 80
instancepool01_threshold_scale_in                           = 20
instancepool01_scaleout_step                                = 1
instancepool01_scalein_step                                 = 1
######################################## INSTANCEPOOL01 SPECIFIC VARIABLES ######################################

######################################## BACKENDSET01 SPECIFIC VARIABLES ########################################
backendset01_lbaas_bes_single_instance_compartment_name     = "MY_ARTIFACT_COMPARTMENT"
backendset01_lbaas_bes_single_network_compartment_name      = "MY_NETWORK_COMPARTMENT"
backendset01_network_subnet_name                            = "MY_SUBNET"
backendset01_vcn_display_name                               = "MY_VCN"
backendset01_is_instancepool_bes                            = true
backendset01_backend_set_name                               = "bessingle"
backendset01_lbaas_policy                                   = "ROUND_ROBIN"
backendset01_checkport                                      = "22"
backendset01_check_protocol                                 = "TCP"
backendset01_backend_port                                   = "80"
backendset01_session_persistance_cookie_name                = "COOKIE"
######################################## BACKENDSET01 SPECIFIC VARIABLES ########################################

######################################## LOADBALANCER01 SPECIFIC VARIABLES ######################################
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
loadbalancer01_is_private                                   = true
######################################## LOADBALANCER01 SPECIFIC VARIABLES ######################################
