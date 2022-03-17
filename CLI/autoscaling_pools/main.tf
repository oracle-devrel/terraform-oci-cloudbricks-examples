# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# main.tf
#
# Purpose: Defines all the components related to environment


module "instancepool01" {
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-linux-compute-instance-pool.git?ref=v1.0.0"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid       = var.tenancy_ocid
  region             = var.region
  user_ocid          = var.user_ocid
  fingerprint        = var.fingerprint
  private_key_path   = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  compute_availability_domain_map              = var.instancepool01_compute_availability_domain_map

  network_subnet_name                          = var.instancepool01_network_subnet_name
  assign_public_ip_flag                        = var.instancepool01_assign_public_ip_flag
  bkp_policy_boot_volume                       = var.instancepool01_bkp_policy_boot_volume
  linux_compute_instance_compartment_name      = var.instancepool01_linux_compute_instance_compartment_name
  linux_compute_network_compartment_name       = var.instancepool01_linux_compute_network_compartment_name
  vcn_display_name                             = var.instancepool01_vcn_display_name
  pool_size                                    = var.instancepool01_pool_size
  is_flex_shape                                = var.instancepool01_is_flex_shape
  instance_config_shape                        = var.instancepool01_instance_config_shape
  instance_shape_config_ocpus                  = var.instancepool01_instance_shape_config_ocpus
  instance_shape_config_memory_in_gbs          = var.instancepool01_instance_shape_config_memory_in_gbs

  instance_display_name_base                   = var.instancepool01_instance_display_name_base
  compute_display_name_base                    = var.instancepool01_compute_display_name_base
  base_compute_image_ocid                      = var.instancepool01_base_compute_image_ocid
  instance_configuration_display_name          = var.instancepool01_instance_configuration_display_name

  autoscaling_config_display_name              = var.instancepool01_autoscaling_config_display_name
  is_autoscaling_enabled                       = var.instancepool01_is_autoscaling_enabled
  autoscaling_cooldown                         = var.instancepool01_autoscaling_cooldown

  autoscaling_is_schedule                      = var.instancepool01_autoscaling_is_schedule
  schedule_is_scalein_enabled                  = var.instancepool01_schedule_is_scalein_enabled
  schedule_is_scaleout_enabled                 = var.instancepool01_schedule_is_scaleout_enabled
  schedule_scaleout_instance_number            = var.instancepool01_schedule_scaleout_instance_number
  schedule_scaleout_time_window                = var.instancepool01_schedule_scaleout_time_window
  schedule_scalein_time_window                 = var.instancepool01_schedule_scalein_time_window

  autoscaling_is_memory                        = var.instancepool01_autoscaling_is_memory
  autoscaling_is_cpu                           = var.instancepool01_autoscaling_is_cpu
  max_autoscale_instance_number                = var.instancepool01_max_autoscale_instance_number
  min_autoscale_instance_number                = var.instancepool01_min_autoscale_instance_number
  threshold_scale_out                          = var.instancepool01_threshold_scale_out
  threshold_scale_in                           = var.instancepool01_threshold_scale_in
  scaleout_step                                = var.instancepool01_scaleout_step
  scalein_step                                 = var.instancepool01_scalein_step
  
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}
