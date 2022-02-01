# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# system.tfvars
#
# Purpose: The following script defines the system particular variables to provision environment

######################################## COMMON VARIABLES ######################################
region           = "sa-santiago-1"
tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaaoqdygmiidrabhv3y4hkr3rb3z6dpmgotvq2scffra6jt7rubresa"
user_ocid        = "ocid1.user.oc1..aaaaaaaafl42rhkw624h4os6n2ulcfxjjn2ylqsanhgtcph7j7owirzj6gya"
fingerprint      = "11:32:10:d8:52:2b:dd:85:0a:04:0f:47:23:be:72:70"
private_key_path = "/home/opc/.ssh/OCI_KEYS/API/auto_api_key.pem"
######################################## COMMON VARIABLES ######################################
######################################## ARTIFACT SPECIFIC VARIABLES ######################################

######################################## ARTIFACT SPECIFIC VARIABLES ######################################
apex01_ssh_public_key                   = "/home/opc/.ssh/OCI_KEYS/SSH/auto_ssh_id_rsa.pub"
apex01_ssh_private_key                  = "/home/opc/.ssh/OCI_KEYS/SSH/auto_ssh_id_rsa"
apex01_ssh_public_is_path               = true
apex01_ssh_private_is_path              = true
apex01_compute_availability_domain_list = ["oDQF:SA-SANTIAGO-1-AD-1"]

apex01_compute_network_subnet_name             = "dalquint_hub_pvt_subnet"
apex01_compute_network_subnet_cidr_block       = "10.0.2.0/23"
apex01_fault_domain_name                       = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3"]
apex01_bkp_policy_boot_volume                  = "bronze"
apex01_linux_compute_instance_compartment_name = "DALQUINT_HUB"
apex01_linux_compute_network_compartment_name  = "DALQUINT_HUB"
apex01_vcn_display_name                        = "DALQUINT_HUB_VCN"
apex01_num_instances                           = 2
apex01_compute_display_name_base               = "ords"
apex01_instance_shape                          = "VM.Standard.E4.Flex"
apex01_is_flex_shape                           = true
apex01_instance_shape_config_ocpus             = 1
apex01_instance_shape_config_memory_in_gbs     = 16

apex01_lbaas_display_name        = "ordslbaas"
apex01_lbaas_subnet_cidr_block   = "10.0.0.0/23"
apex01_flex_lb_min_shape         = "10"
apex01_flex_lb_max_shape         = "100"
apex01_lbaas_network_subnet_name = "dalquint_hub_pub_subnet"
apex01_certificate_private_key   = "./certs/loadbalancer.key"
apex01_lbaas_ca_cert             = "./certs/ca.key"
apex01_lbaas_ssl_cert            = "./certs/loadbalancer.crt"
apex01_verify_peer_certificate   = false



apex01_ATP_instance_compartment_name         = "DALQUINT_HUB"
apex01_ATP_database_cpu_core_count           = 1
apex01_ATP_database_data_storage_size_in_tbs = 1
apex01_ATP_database_db_name                  = "apexatp"
apex01_ATP_database_display_name             = "apexatp"
apex01_ATP_database_db_version               = "19c"
apex01_ATP_database_license_model            = "LICENSE_INCLUDED"
apex01_ATP_data_guard_enabled                = false
apex01_ATP_private_endpoint_label            = "dummy"
apex01_ATP_password                          = "W3lc0m31abcd3fg"
apex01_ATP_network_subnet_name               = "dalquint_hub_pvt_subnet"
######################################## ARTIFACT SPECIFIC VARIABLES ######################################