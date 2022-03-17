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

instancepool01_instance_display_name_base                   = "My_Instance"
instancepool01_compute_display_name_base                    = "My_Instance_Pool"
instancepool01_base_compute_image_ocid                      = "ocid1.image.oc1.re-region-1.aaaaaaaawxyz"
instancepool01_instance_configuration_display_name          = "My_Config_Name"

instancepool01_autoscaling_config_display_name              = "My_Autoscaling_Config_Name"
instancepool01_is_autoscaling_enabled                       = true
instancepool01_autoscaling_cooldown                         = 300

instancepool01_autoscaling_is_schedule                      = true
instancepool01_schedule_is_scalein_enabled                  = true
instancepool01_schedule_is_scaleout_enabled                 = true
instancepool01_schedule_scaleout_instance_number            = 4
instancepool01_schedule_scaleout_time_window                = "0 0 4 24 * ? *"
instancepool01_schedule_scalein_time_window                 = "0 0 4 5 * ? *"
######################################## INSTANCEPOOL01 SPECIFIC VARIABLES ######################################
