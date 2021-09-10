# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# main.tf
#
# Purpose: Defines all the components related to environment


module "compute01" {
  source = "git::ssh://git@github.com:oracle-devrel/terraform-oci-cloudbricks-linux-compute.git?ref=v1.0.1"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  ssh_public_key                   = var.compute01_ssh_public_key
  ssh_private_key                  = var.compute01_ssh_private_key
  ssh_public_is_path               = var.compute01_ssh_public_is_path
  ssh_private_is_path              = var.compute01_ssh_private_is_path
  compute_availability_domain_list = var.compute01_compute_availability_domain_list

  network_subnet_name                     = var.compute01_network_subnet_name
  assign_public_ip_flag                   = var.compute01_assign_public_ip_flag
  fault_domain_name                       = var.compute01_fault_domain_name
  bkp_policy_boot_volume                  = var.compute01_bkp_policy_boot_volume
  linux_compute_instance_compartment_name = var.compute01_linux_compute_instance_compartment_name
  linux_compute_network_compartment_name  = var.compute01_linux_compute_network_compartment_name
  vcn_display_name                        = var.compute01_vcn_display_name
  num_instances                           = var.compute01_num_instances
  compute_display_name_base               = var.compute01_compute_display_name_base
  instance_image_ocid                     = var.compute01_instance_image_ocid
  instance_shape                          = var.compute01_instance_shape
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}


module "loadbalancer01" {
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lbaas.git?ref=v1.0.0"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  lbaas_instance_compartment_name = var.loadbalancer01_lbaas_instance_compartment_name
  lbaas_network_compartment_name  = var.loadbalancer01_lbaas_network_compartment_name
  vcn_display_name                = var.loadbalancer01_vcn_display_name
  network_subnet_name             = var.loadbalancer01_network_subnet_name
  lbaas_display_name              = var.loadbalancer01_lbaas_display_name
  lbaas_shape                     = var.loadbalancer01_lbaas_shape
  lbaas_shape_min_bw_mbps         = var.loadbalancer01_lbaas_shape_min_bw_mbps
  lbaas_shape_max_bw_mbps         = var.loadbalancer01_lbaas_shape_max_bw_mbps
  lb_nsg_name                     = var.loadbalancer01_lb_nsg_name
  is_app_lbaas                    = var.loadbalancer01_is_app_lbaas
  is_private                      = var.loadbalancer01_is_private
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}


module "backendset01" {
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lbaas-bes-single.git?ref=v1.0.0"
  depends_on = [module.loadbalancer01, module.compute01]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  lbaas_bes_single_instance_compartment_name = var.backendset01_lbaas_bes_single_instance_compartment_name
  lbaas_bes_single_network_compartment_name  = var.backendset01_lbaas_bes_single_network_compartment_name
  vcn_display_name                           = var.backendset01_vcn_display_name
  network_subnet_name                        = var.backendset01_network_subnet_name
  is_app_bes                                 = var.backendset01_is_app_bes
  backend_set_name                           = var.backendset01_backend_set_name
  load_balancer_id                           = module.loadbalancer01.app_lbaas_instance[0].id
  lbaas_policy                               = var.backendset01_lbaas_policy
  checkport                                  = var.backendset01_checkport
  check_protocol                             = var.backendset01_check_protocol
  backend_port                               = var.backendset01_backend_port
  session_persistance_cookie_name            = var.backendset01_session_persistance_cookie_name
  listener_name                              = var.backendset01_listener_name
  listen_port                                = var.backendset01_listen_port
  listen_protocol                            = var.backendset01_listen_protocol
  balanced_artifact                          = module.compute01.instance
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}
