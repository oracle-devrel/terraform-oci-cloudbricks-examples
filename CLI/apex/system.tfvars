# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# system.tfvars
#
# Purpose: The following script defines the system particular variables to provision environment

######################################## COMMON VARIABLES ######################################
region           = "re-region-1"
tenancy_ocid     = "ocid1.tenancy.oc1..foobar"
user_ocid        = "ocid1.user.oc1..foobar"
fingerprint      = "fo:oo:ba:ar:ba:ar"
private_key_path = "/absolute/path/to/api/key/your_api_key.pem"
######################################## COMMON VARIABLES ######################################
######################################## ARTIFACT SPECIFIC VARIABLES ######################################

######################################## ARTIFACT SPECIFIC VARIABLES ######################################
apex01_ssh_public_key                   = "/absolute/path/to/public/ssh/key/your_public_ssh_key.pub"
apex01_ssh_private_key                  = "/absolute/path/to/private/ssh/key/your_private_ssh_key"
apex01_ssh_public_is_path               = true
apex01_ssh_private_is_path              = true
apex01_compute_availability_domain_list = ["ABCD:re-region-1-AD-1"]

apex01_compute_network_subnet_name             = "compute_private_subnet_name"
apex01_compute_network_subnet_cidr_block       = "compute_private_subnet_CIDR_block"
apex01_fault_domain_name                       = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3"]
apex01_bkp_policy_boot_volume                  = "Strategy"
apex01_linux_compute_instance_compartment_name = "MY_ARTIFACT_COMPARTMENT"
apex01_linux_compute_network_compartment_name  = "MY_NETWORK_COMPARTMENT"
apex01_vcn_display_name                        = "MY_VCN"
apex01_num_instances                           = 2
apex01_compute_display_name_base               = "ords"
apex01_instance_shape                          = "VM.Standard.E4.Flex"
apex01_is_flex_shape                           = true
apex01_instance_shape_config_ocpus             = 1
apex01_instance_shape_config_memory_in_gbs     = 16

apex01_lbaas_display_name        = "LBAAS_NAME"
apex01_lbaas_network_subnet_name = "lbaas_public_subnet_name"
apex01_lbaas_subnet_cidr_block   = "lbaas_public_subnet_CIDR_block"
apex01_flex_lb_min_shape         = "10"
apex01_flex_lb_max_shape         = "100"
apex01_certificate_private_key   = "./certs/loadbalancer.key"
apex01_lbaas_ca_cert             = "./certs/ca.key"
apex01_lbaas_ssl_cert            = "./certs/loadbalancer.crt"
apex01_verify_peer_certificate   = false



apex01_ATP_instance_compartment_name         = "MY_ARTIFACT_COMPARTMENT"
apex01_ATP_database_cpu_core_count           = 1
apex01_ATP_database_data_storage_size_in_tbs = 1
apex01_ATP_database_db_name                  = "apexatp"
apex01_ATP_database_display_name             = "apexatp"
apex01_ATP_database_db_version               = "19c"
apex01_ATP_database_license_model            = "LICENSE_INCLUDED"
apex01_ATP_data_guard_enabled                = false
apex01_ATP_private_endpoint_label            = "dummy"
apex01_ATP_password                          = "AlphanumericPassword"
apex01_ATP_network_subnet_name               = "database_private_subnet_name"
######################################## ARTIFACT SPECIFIC VARIABLES ######################################