# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# system.tfvars
#
# Purpose: The following script defines the system particular variables to provision environment


######################################## PROVIDER SPECIFIC VARIABLES ######################################
region           = "uk-london-1"
tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaaoqdygmiidrabhv3y4hkr3rb3z6dpmgotvq2scffra6jt7rubresa"
user_ocid        = "ocid1.user.oc1..aaaaaaaaxc4jvxrvoyffcxoeeq4yzugcsalqhbh2yitkac2yu2jmg7vppera"
fingerprint      = "ea:56:d4:d8:36:58:a8:1c:8f:a1:3a:59:68:82:f6:f8"
private_key_path = "/home/opc/.ssh/id_rsa"
######################################## PROVIDER SPECIFIC VARIABLES ######################################

######################################## INSTANCEPOOL01 SPECIFIC VARIABLES ######################################
instancepool01_compute_availability_domain_map = { "ad1" : "oDQF:uk-london-1-AD-1", "ad2" : "oDQF:uk-london-1-AD-2", "ad3" : "oDQF:uk-london-1-AD-3" }

instancepool01_network_subnet_name                     = "cloudbricks-public-subnet"
instancepool01_assign_public_ip_flag                   = true
instancepool01_bkp_policy_boot_volume                  = "gold"
instancepool01_linux_compute_instance_compartment_name = "CloudBricks_Artifacts"
instancepool01_linux_compute_network_compartment_name  = "CloudBricks"
instancepool01_vcn_display_name                        = "cloudbricks-vcn"
instancepool01_is_load_balancer_required               = true
instancepool01_pool_size                               = 2
instancepool01_instance_config_shape                   = "VM.Standard2.1"

instancepool01_instance_display_name_base          = "feunitaryinstance"
instancepool01_compute_display_name_base           = "feinstancepool"
instancepool01_base_compute_image_ocid             = "ocid1.image.oc1.uk-london-1.aaaaaaaaqdz574nxs7wk5fpv2shn6hrv7zz7l4ixj46okpudnpunrzpjmoqq"
instancepool01_instance_configuration_display_name = "feinstnaceconfig"

instancepool01_autoscaling_config_display_name = "feautoscalingconfig"
instancepool01_is_autoscaling_enabled          = true
instancepool01_autoscaling_cooldown            = 300

instancepool01_autoscaling_is_cpu            = true
instancepool01_max_autoscale_instance_number = 4
instancepool01_min_autoscale_instance_number = 2
instancepool01_threshold_scale_out           = 80
instancepool01_threshold_scale_in            = 20
instancepool01_scaleout_step                 = 1
instancepool01_scalein_step                  = 1
######################################## INSTANCEPOOL01 SPECIFIC VARIABLES ######################################

######################################## BACKENDSET01 SPECIFIC VARIABLES ######################################
backendset01_lbaas_bes_single_instance_compartment_name = "CloudBricks_Artifacts"
backendset01_lbaas_bes_single_network_compartment_name  = "CloudBricks"
backendset01_network_subnet_name                        = "cloudbricks-public-subnet"
backendset01_vcn_display_name                           = "cloudbricks-vcn"
backendset01_is_instancepool_bes                        = true
backendset01_backend_set_name                           = "feunitarybessingle"
backendset01_lbaas_policy                               = "ROUND_ROBIN"
backendset01_checkport                                  = "22"
backendset01_check_protocol                             = "TCP"
backendset01_backend_port                               = "80"
backendset01_session_persistance_cookie_name            = "COOKIE"
######################################## BACKENDSET01 SPECIFIC VARIABLES ######################################

######################################## LOADBALANCER01 SPECIFIC VARIABLES ######################################
loadbalancer01_lbaas_instance_compartment_name = "CloudBricks_Artifacts"
loadbalancer01_lbaas_network_compartment_name  = "CloudBricks"
loadbalancer01_network_subnet_name             = "cloudbricks-public-subnet"
loadbalancer01_vcn_display_name                = "cloudbricks-vcn"
loadbalancer01_lbaas_display_name              = "feunitarylbaas"
loadbalancer01_lbaas_shape                     = "flexible"
loadbalancer01_lbaas_shape_min_bw_mbps         = "100"
loadbalancer01_lbaas_shape_max_bw_mbps         = "100"
loadbalancer01_lb_nsg_name                     = "NSG_Public_Access"
loadbalancer01_is_app_lbaas                    = true
loadbalancer01_is_private                      = true
######################################## LOADBALANCER01 SPECIFIC VARIABLES ######################################
