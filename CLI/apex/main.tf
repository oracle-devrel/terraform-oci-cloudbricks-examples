# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# main.tf
#
# Purpose: Defines all the components related to environment


module "apex01" {
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-apex?ref=v1.0.4"  
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  ssh_public_key                   = var.apex01_ssh_public_key
  ssh_private_key                  = var.apex01_ssh_private_key
  ssh_public_is_path               = var.apex01_ssh_public_is_path
  ssh_private_is_path              = var.apex01_ssh_private_is_path
  compute_availability_domain_list = var.apex01_compute_availability_domain_list

  apex_version                            = var.apex01_apex_version
  compute_network_subnet_name             = var.apex01_compute_network_subnet_name
  compute_network_subnet_cidr_block       = var.apex01_compute_network_subnet_cidr_block
  fault_domain_name                       = var.apex01_fault_domain_name
  bkp_policy_boot_volume                  = var.apex01_bkp_policy_boot_volume
  linux_compute_instance_compartment_name = var.apex01_linux_compute_instance_compartment_name
  linux_compute_network_compartment_name  = var.apex01_linux_compute_network_compartment_name
  vcn_display_name                        = var.apex01_vcn_display_name
  num_instances                           = var.apex01_num_instances
  compute_display_name_base               = var.apex01_compute_display_name_base
  instance_shape                          = var.apex01_instance_shape
  is_flex_shape                           = var.apex01_is_flex_shape
  instance_shape_config_ocpus             = var.apex01_instance_shape_config_ocpus
  instance_shape_config_memory_in_gbs     = var.apex01_instance_shape_config_memory_in_gbs

  lbaas_display_name        = var.apex01_lbaas_display_name
  lbaas_subnet_cidr_block   = var.apex01_lbaas_subnet_cidr_block
  flex_lb_min_shape         = var.apex01_flex_lb_min_shape
  flex_lb_max_shape         = var.apex01_flex_lb_max_shape
  lbaas_network_subnet_name = var.apex01_lbaas_network_subnet_name
  certificate_private_key   = var.apex01_certificate_private_key
  lbaas_ca_cert             = var.apex01_lbaas_ca_cert
  lbaas_ssl_cert            = var.apex01_lbaas_ssl_cert
  verify_peer_certificate   = var.apex01_verify_peer_certificate



  ATP_instance_compartment_name         = var.apex01_ATP_instance_compartment_name
  ATP_database_cpu_core_count           = var.apex01_ATP_database_cpu_core_count
  ATP_database_data_storage_size_in_tbs = var.apex01_ATP_database_data_storage_size_in_tbs
  ATP_database_db_name                  = var.apex01_ATP_database_db_name
  ATP_database_display_name             = var.apex01_ATP_database_display_name
  ATP_database_db_version               = var.apex01_ATP_database_db_version
  ATP_database_license_model            = var.apex01_ATP_database_license_model
  ATP_data_guard_enabled                = var.apex01_ATP_data_guard_enabled
  ATP_private_endpoint_label            = var.apex01_ATP_private_endpoint_label
  ATP_password                          = var.apex01_ATP_password
  ATP_network_subnet_name               = var.apex01_ATP_network_subnet_name
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}
