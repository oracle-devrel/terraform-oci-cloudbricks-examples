# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# main.tf
#
# Purpose: Defines all the components related to environment


module "postgre01" {
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-postgresql?ref=v1.0.4"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################

  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  ssh_public_key                          = var.postgre01_ssh_public_key
  ssh_private_key                         = var.postgre01_ssh_private_key
  compute_nsg_name                        = var.postgre01_compute_nsg_name
  linux_compute_instance_compartment_name = var.postgre01_linux_compute_instance_compartment_name
  linux_compute_network_compartment_name  = var.postgre01_linux_compute_network_compartment_name
  private_network_subnet_name             = var.postgre01_private_network_subnet_name
  vcn_display_name                        = var.postgre01_vcn_display_name

  postgresql_replicat_username = var.postgre01_postgresql_replicat_username
  postgresql_password          = var.postgre01_postgresql_password
  postgresql_version           = var.postgre01_postgresql_version
  database_size_in_gb          = var.postgre01_database_size_in_gb
  database_vpus_per_gb         = var.postgre01_database_vpus_per_gb
  database_backup_policy_level = var.postgre01_database_backup_policy_level
  instance_backup_policy_level = var.postgre01_instance_backup_policy_level

  postgresql_master_name  = var.postgre01_postgresql_master_name
  postgresql_master_ad    = var.postgre01_postgresql_master_ad
  postgresql_master_fd    = var.postgre01_postgresql_master_fd
  postgresql_master_shape = var.postgre01_postgresql_master_shape

  postgresql_hotstandby_is_flex_shape = var.postgre01_postgresql_hotstandby_is_flex_shape
  postgresql_hotstandby_shape         = var.postgre01_postgresql_hotstandby_shape

  postgresql_deploy_hotstandby1 = var.postgre01_postgresql_deploy_hotstandby1
  postgresql_standyby1_name     = var.postgre01_postgresql_standyby1_name
  postgresql_hotstandby1_ad     = var.postgre01_postgresql_hotstandby1_ad
  postgresql_hotstandby1_fd     = var.postgre01_postgresql_hotstandby1_fd

  postgresql_deploy_hotstandby2 = var.postgre01_postgresql_deploy_hotstandby2
  postgresql_standyby2_name     = var.postgre01_postgresql_standyby2_name
  postgresql_hotstandby2_ad     = var.postgre01_postgresql_hotstandby2_ad
  postgresql_hotstandby2_fd     = var.postgre01_postgresql_hotstandby2_fd
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}