# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# main.tf
#
# Purpose: Defines all the components related to environment


module "instance01" {
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-linux-compute.git?ref=v1.0.2"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  ssh_public_key                          = var.instance01_ssh_public_key
  ssh_private_key                         = var.instance01_ssh_private_key
  ssh_public_is_path                      = var.instance01_ssh_public_is_path
  ssh_private_is_path                     = var.instance01_ssh_private_is_path
  compute_availability_domain_list        = var.instance01_compute_availability_domain_list
  network_subnet_name                     = var.instance01_network_subnet_name
  assign_public_ip_flag                   = var.instance01_assign_public_ip_flag
  fault_domain_name                       = var.instance01_fault_domain_name
  bkp_policy_boot_volume                  = var.instance01_bkp_policy_boot_volume
  linux_compute_instance_compartment_name = var.instance01_linux_compute_instance_compartment_name
  linux_compute_network_compartment_name  = var.instance01_linux_compute_network_compartment_name
  vcn_display_name                        = var.instance01_vcn_display_name
  num_instances                           = var.instance01_num_instances
  is_nsg_required                         = var.instance01_is_nsg_required
  compute_nsg_name                        = var.instance01_compute_nsg_name
  compute_display_name_base               = var.instance01_compute_display_name_base
  instance_image_ocid                     = var.instance01_instance_image_ocid
  instance_shape                          = var.instance01_instance_shape
  is_flex_shape                           = var.instance01_is_flex_shape
  instance_shape_config_ocpus             = var.instance01_instance_shape_config_ocpus
  instance_shape_config_memory_in_gbs     = var.instance01_instance_shape_config_memory_in_gbs

  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}

module "mysql01" {
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-mysql-database?ref=v1.0.4.1"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  region           = var.region
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  mysql_instance_compartment_name                 = var.mysql01_mysql_instance_compartment_name
  mysql_network_compartment_name                  = var.mysql01_mysql_network_compartment_name
  vcn_display_name                                = var.mysql01_vcn_display_name
  network_subnet_name                             = var.mysql01_network_subnet_name
  mysql_db_system_admin_username                  = var.mysql01_mysql_db_system_admin_username
  mysql_db_system_admin_password                  = var.mysql01_mysql_db_system_admin_password
  mysql_db_system_availability_domain             = var.mysql01_mysql_db_system_availability_domain
  mysql_shape_name                                = var.mysql01_mysql_shape_name
  mysql_db_system_backup_policy_is_enabled        = var.mysql01_mysql_db_system_backup_policy_is_enabled
  mysql_db_system_backup_policy_retention_in_days = var.mysql01_mysql_db_system_backup_policy_retention_in_days
  mysql_db_system_backup_policy_window_start_time = var.mysql01_mysql_db_system_backup_policy_window_start_time
  mysql_db_system_data_storage_size_in_gb         = var.mysql01_mysql_db_system_data_storage_size_in_gb
  mysql_db_system_description                     = var.mysql01_mysql_db_system_description
  mysql_db_system_display_name                    = var.mysql01_mysql_db_system_display_name
  mysql_db_system_fault_domain                    = var.mysql01_mysql_db_system_fault_domain
  mysql_db_system_hostname_label                  = var.mysql01_mysql_db_system_hostname_label
  mysql_db_system_is_highly_available             = var.mysql01_mysql_db_system_is_highly_available
  mysql_db_system_maintenance_window_start_time   = var.mysql01_mysql_db_system_maintenance_window_start_time
  mysql_db_system_port                            = var.mysql01_mysql_db_system_port
  mysql_db_system_port_x                          = var.mysql01_mysql_db_system_port_x
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  ######################################## HEATWAVE SPECIFIC VARIABLES ######################################
  mysql_heatwave_enabled                          = var.mysql01_mysql_heatwave_enabled
  mysql_heatwave_cluster_size                     = var.mysql01_mysql_heatwave_cluster_size
  mysql_heatwave_shape                            = var.mysql01_mysql_heatwave_shape
  ######################################## HEATWAVE SPECIFIC VARIABLES ######################################
}

module "fssdisk01" {
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
  ######################################## FSSDISK01 VARIABLES ######################################
  num_of_fss                           = var.fssdisk01_num_of_fss
  export_path_base                     = var.fssdisk01_export_path_base
  fss_display_name_base                = var.fssdisk01_fss_display_name_base
  fss_instance_compartment_name        = var.fssdisk01_fss_instance_compartment_name
  fss_network_compartment_name         = var.fssdisk01_fss_network_compartment_name
  mt_compartment_name                  = var.fssdisk01_mt_compartment_name
  vcn_display_name                     = var.fssdisk01_vcn_display_name
  network_subnet_name                  = var.fssdisk01_network_subnet_name
  fss_mount_target_availability_domain = var.fssdisk01_fss_mount_target_availability_domain
  fss_mount_target_name                = var.fssdisk01_fss_mount_target_name
  compute_private_ip                   = module.instance01.instance[count.index].private_ip
  compute_display_name                 = module.instance01.instance[count.index].display_name
  os_type                              = var.fssdisk01_os_type
  ssh_private_key                      = var.fssdisk01_ssh_private_key
  ######################################## FSSDISK01 VARIABLES ######################################
}

module "djangoconfig01" {
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-remote-linux-executor.git?ref=v1.0.0"
  depends_on = [
                module.instance01,
                module.fssdisk01
                ]
  count      = length(module.instance01.instance.*.id)
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  ssh_public_key                 = var.djangoconfig01_ssh_public_key
  ssh_private_key                = var.djangoconfig01_ssh_private_key
  ssh_public_is_path             = var.djangoconfig01_ssh_public_is_path
  ssh_private_is_path            = var.djangoconfig01_ssh_private_is_path
  script_name                    = var.djangoconfig01_script_name
  script_args                    = var.djangoconfig01_script_args
  linux_compute_private_ip       = module.instance01.instance[count.index].private_ip
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}