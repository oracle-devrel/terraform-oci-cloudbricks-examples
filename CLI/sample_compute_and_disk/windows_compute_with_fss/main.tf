# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# main.tf
#
# Purpose: Defines all the components related to environment


module "instance01" {
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-windows-compute.git?ref=v1.0.1"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  ssh_public_key                            = var.instance01_ssh_public_key
  ssh_private_key                           = var.instance01_ssh_private_key
  ssh_public_is_path                        = var.instance01_ssh_public_is_path
  ssh_private_is_path                       = var.instance01_ssh_private_is_path
  compute_availability_domain_list          = var.instance01_compute_availability_domain_list
  network_subnet_name                       = var.instance01_network_subnet_name
  assign_public_ip_flag                     = var.instance01_assign_public_ip_flag
  fault_domain_name                         = var.instance01_fault_domain_name
  bkp_policy_boot_volume                    = var.instance01_bkp_policy_boot_volume
  windows_compute_instance_compartment_name = var.instance01_windows_compute_instance_compartment_name
  windows_compute_network_compartment_name  = var.instance01_windows_compute_network_compartment_name
  vcn_display_name                          = var.instance01_vcn_display_name
  num_instances                             = var.instance01_num_instances
  is_nsg_required                           = var.instance01_is_nsg_required
  compute_nsg_name                          = var.instance01_compute_nsg_name
  compute_display_name_base                 = var.instance01_compute_display_name_base
  instance_image_ocid                       = var.instance01_instance_image_ocid
  instance_shape                            = var.instance01_instance_shape
  is_flex_shape                             = var.instance01_is_flex_shape
  instance_shape_config_ocpus               = var.instance01_instance_shape_config_ocpus
  instance_shape_config_memory_in_gbs       = var.instance01_instance_shape_config_memory_in_gbs

  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}

module "disk01" {
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-fss.git?ref=v1.0.0"
  depends_on = [module.instance01]
  count      = length(module.instance01.instance.*.id)
  ####################################### COMMON VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## COMMON VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  num_of_fss                           = var.disk01_num_of_fss
  export_path_base                     = var.disk01_export_path_base
  fss_display_name_base                = var.disk01_fss_display_name_base
  fss_instance_compartment_name        = var.disk01_fss_instance_compartment_name
  fss_network_compartment_name         = var.disk01_fss_network_compartment_name
  mt_compartment_name                  = var.disk01_mt_compartment_name
  vcn_display_name                     = var.disk01_vcn_display_name
  network_subnet_name                  = var.disk01_network_subnet_name
  fss_mount_target_availability_domain = var.disk01_fss_mount_target_availability_domain
  fss_mount_target_name                = var.disk01_fss_mount_target_name
  ssh_private_key                      = var.disk01_ssh_private_key
  os_type                              = var.disk01_os_type
  is_winrm_configured_with_ssl         = var.disk01_is_winrm_configured_with_ssl
  disk_unit                            = var.disk01_disk_unit
  compute_private_ip                   = module.instance01.instance[count.index].private_ip
  win_os_password                      = module.instance01.instance_password[0]
  compute_display_name                 = module.instance01.instance[count.index].display_name
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}
