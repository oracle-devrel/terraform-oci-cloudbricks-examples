# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# system.tfvars
#
# Purpose: The following script defines the system particular variables to provision environment


######################################## PROVIDER SPECIFIC VARIABLES ######################################
tenancy_ocid     = "ocid1.tenancy.oc1..foobarbar"
region           = "re-region-1"
user_ocid        = "ocid1.user.oc1..foobarbar"
fingerprint      = "fo:oo:ba:ar:ba:ar"
private_key_path = "/foo/bar/path/oci_api_key.pem"
######################################## PROVIDER SPECIFIC VARIABLES ######################################

######################################## COMPUTE01 SPECIFIC VARIABLES ######################################
compute01_ssh_public_key                   = "/foo/bar/path/auto_ssh_id_rsa.pub"
compute01_ssh_private_key                  = "/foo/bar/path/auto_ssh_id_rsa"
compute01_ssh_public_is_path               = true
compute01_ssh_private_is_path              = true
compute01_compute_availability_domain_list = ["aBCD:re-region-1-AD-1", "aBCD:re-region-1-AD-2", "aBCD:re-region-1-AD-3"]

compute01_network_subnet_name                     = "MY_SUBNET"
compute01_assign_public_ip_flag                   = true
compute01_fault_domain_name                       = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3"]
compute01_bkp_policy_boot_volume                  = "gold"
compute01_linux_compute_instance_compartment_name = "MY_ARTIFACT_COMPARTMENT"
compute01_linux_compute_network_compartment_name  = "MY_NETWORK_COMPARTMENT"
compute01_vcn_display_name                        = "MY_VCN"
compute01_num_instances                           = 4
compute01_is_nsg_required                         = true
compute01_compute_nsg_name                        = "MY_NSG"
compute01_compute_display_name_base               = "lnxmachine"
compute01_instance_image_ocid                     = "ocid1.image.oc1.uk-london-1.aaaaaaaahbeggsuyplosadiuzd2rzj2btsqapkuyb35kvnoiwhohk3tgz4wq" #Image: Oracle-Autonomous-Linux-7.9-2021.07-0
compute01_instance_shape                          = "VM.Standard2.1"
######################################## COMPUTE01 SPECIFIC VARIABLES ######################################

######################################## BACKENDSET01 SPECIFIC VARIABLES ######################################
backendset01_lbaas_bes_single_instance_compartment_name = "MY_ARTIFACT_COMPARTMENT"
backendset01_lbaas_bes_single_network_compartment_name  = "MY_NETWORK_COMPARTMENT"
backendset01_network_subnet_name                        = "MY_SUBNET"
backendset01_vcn_display_name                           = "MY_VCN"
backendset01_is_app_bes                                 = true
backendset01_backend_set_name                           = "bessingle"
backendset01_lbaas_policy                               = "ROUND_ROBIN"
backendset01_checkport                                  = "80"
backendset01_check_protocol                             = "TCP"
backendset01_session_persistance_cookie_name            = "COOKIE"
backendset01_listener_name                              = "listener"
backendset01_listen_port                                = "80"
backendset01_listen_protocol                            = "HTTP"
backendset01_backend_port                               = "80"
######################################## BACKENDSET01 SPECIFIC VARIABLES ######################################

######################################## LOADBALANCER01 SPECIFIC VARIABLES ######################################
loadbalancer01_lbaas_instance_compartment_name = "MY_ARTIFACT_COMPARTMENT"
loadbalancer01_lbaas_network_compartment_name  = "MY_NETWORK_COMPARTMENT"
loadbalancer01_network_subnet_name             = "MY_SUBNET"
loadbalancer01_vcn_display_name                = "MY_VCN"
loadbalancer01_lbaas_display_name              = "lbaas"
loadbalancer01_lbaas_shape                     = "flexible"
loadbalancer01_lbaas_shape_min_bw_mbps         = "100"
loadbalancer01_lbaas_shape_max_bw_mbps         = "100"
loadbalancer01_lb_nsg_name                     = "MY_NSG"
loadbalancer01_is_app_lbaas                    = true
loadbalancer01_is_private                      = false
######################################## LOADBALANCER01 SPECIFIC VARIABLES ######################################
