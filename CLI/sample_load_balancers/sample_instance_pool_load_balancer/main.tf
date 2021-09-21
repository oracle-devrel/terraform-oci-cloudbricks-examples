# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# main.tf
#
# Purpose: Defines all the components related to environment


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
  depends_on = [module.loadbalancer01]
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
  is_instancepool_bes                        = var.backendset01_is_instancepool_bes
  backend_set_name                           = var.backendset01_backend_set_name
  load_balancer_id                           = module.loadbalancer01.app_lbaas_instance[0].id
  lbaas_policy                               = var.backendset01_lbaas_policy
  checkport                                  = var.backendset01_checkport
  check_protocol                             = var.backendset01_check_protocol
  backend_port                               = var.backendset01_backend_port
  session_persistance_cookie_name            = var.backendset01_session_persistance_cookie_name
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}


module "instancepool01" {
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-linux-compute-instance-pool.git?ref=v1.0.0"
  depends_on = [module.backendset01]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  compute_availability_domain_map = var.instancepool01_compute_availability_domain_map

  network_subnet_name                     = var.instancepool01_network_subnet_name
  assign_public_ip_flag                   = var.instancepool01_assign_public_ip_flag
  bkp_policy_boot_volume                  = var.instancepool01_bkp_policy_boot_volume
  linux_compute_instance_compartment_name = var.instancepool01_linux_compute_instance_compartment_name
  linux_compute_network_compartment_name  = var.instancepool01_linux_compute_network_compartment_name
  vcn_display_name                        = var.instancepool01_vcn_display_name
  is_load_balancer_required               = var.instancepool01_is_load_balancer_required
  lbaas_bes_checkport                     = module.backendset01.instancepool_bes_instance[0].health_checker[0].port
  lbaas_bes_name                          = module.backendset01.instancepool_bes_instance[0].name
  load_balancer_ocid                      = module.loadbalancer01.app_lbaas_instance[0].id
  pool_size                               = var.instancepool01_pool_size
  instance_config_shape                   = var.instancepool01_instance_config_shape

  instance_display_name_base          = var.instancepool01_instance_display_name_base
  compute_display_name_base           = var.instancepool01_compute_display_name_base
  base_compute_image_ocid             = var.instancepool01_base_compute_image_ocid
  instance_configuration_display_name = var.instancepool01_instance_configuration_display_name

  autoscaling_config_display_name = var.instancepool01_autoscaling_config_display_name
  is_autoscaling_enabled          = var.instancepool01_is_autoscaling_enabled
  autoscaling_cooldown            = var.instancepool01_autoscaling_cooldown

  autoscaling_is_cpu            = var.instancepool01_autoscaling_is_cpu
  max_autoscale_instance_number = var.instancepool01_max_autoscale_instance_number
  min_autoscale_instance_number = var.instancepool01_min_autoscale_instance_number
  threshold_scale_out           = var.instancepool01_threshold_scale_out
  threshold_scale_in            = var.instancepool01_threshold_scale_in
  scaleout_step                 = var.instancepool01_scaleout_step
  scalein_step                  = var.instancepool01_scalein_step
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}
