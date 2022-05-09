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


module "postgre01" {
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-postgresql?ref=v1.0.6"
  depends_on = [module.fssdisk01]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################

  ######################################## POSTGRE01 SPECIFIC VARIABLES ######################################
  ssh_public_key                                              = var.postgre01_ssh_public_key
  ssh_private_key                                             = var.postgre01_ssh_private_key
  compute_nsg_name                                            = var.postgre01_compute_nsg_name
  linux_compute_instance_compartment_name                     = var.postgre01_linux_compute_instance_compartment_name
  linux_compute_network_compartment_name                      = var.postgre01_linux_compute_network_compartment_name
  private_network_subnet_name                                 = var.postgre01_private_network_subnet_name
  vcn_display_name                                            = var.postgre01_vcn_display_name

  postgresql_replicat_username                                = var.postgre01_postgresql_replicat_username
  postgresql_password                                         = var.postgre01_postgresql_password
  postgresql_version                                          = var.postgre01_postgresql_version
  database_size_in_gb                                         = var.postgre01_database_size_in_gb
  database_vpus_per_gb                                        = var.postgre01_database_vpus_per_gb
  database_backup_policy_level                                = var.postgre01_database_backup_policy_level
  instance_backup_policy_level                                = var.postgre01_instance_backup_policy_level

  postgresql_master_name                                      = var.postgre01_postgresql_master_name
  postgresql_master_ad                                        = var.postgre01_postgresql_master_ad
  postgresql_master_fd                                        = var.postgre01_postgresql_master_fd
  postgresql_master_shape                                     = var.postgre01_postgresql_master_shape

  postgresql_hotstandby_is_flex_shape                         = var.postgre01_postgresql_hotstandby_is_flex_shape
  postgresql_hotstandby_shape                                 = var.postgre01_postgresql_hotstandby_shape

  postgresql_deploy_hotstandby1                               = var.postgre01_postgresql_deploy_hotstandby1
  postgresql_standyby1_name                                   = var.postgre01_postgresql_standyby1_name
  postgresql_hotstandby1_ad                                   = var.postgre01_postgresql_hotstandby1_ad
  postgresql_hotstandby1_fd                                   = var.postgre01_postgresql_hotstandby1_fd

  postgresql_deploy_hotstandby2                               = var.postgre01_postgresql_deploy_hotstandby2
  postgresql_standyby2_name                                   = var.postgre01_postgresql_standyby2_name
  postgresql_hotstandby2_ad                                   = var.postgre01_postgresql_hotstandby2_ad
  postgresql_hotstandby2_fd                                   = var.postgre01_postgresql_hotstandby2_fd
  ######################################## POSTGRE01 SPECIFIC VARIABLES ######################################
}


module "fssdisk01" {
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-fss.git?ref=v1.0.0"
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
  depends_on = [module.loadbalancer01, module.instance01]
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
  balanced_artifact                          = module.instance01.instance
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
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