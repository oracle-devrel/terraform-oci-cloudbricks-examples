# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# main.tf
#
# Purpose: Defines all the components related to environment


module "dbcs01" {
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-dbcs-database?ref=v1.0.0"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  ssh_public_key                  = var.dbcs01_ssh_public_key
  ssh_private_key                 = var.dbcs01_ssh_private_key
  ssh_public_is_path              = var.dbcs01_ssh_public_is_path
  ssh_private_is_path             = var.dbcs01_ssh_private_is_path
  fault_domains                   = var.dbcs01_fault_domains
  dbcs_availability_domain_number = var.dbcs01_dbcs_availability_domain_number
  dbcs_instance_compartment_name  = var.dbcs01_dbcs_instance_compartment_name
  dbcs_network_compartment_name   = var.dbcs01_dbcs_network_compartment_name
  network_subnet_name             = var.dbcs01_network_subnet_name
  vcn_display_name                = var.dbcs01_vcn_display_name
  cluster_name                    = var.dbcs01_cluster_name
  db_admin_password               = var.dbcs01_db_admin_password
  db_name                         = var.dbcs01_db_name
  db_display_name                 = var.dbcs01_db_display_name
  db_home_display_name            = var.dbcs01_db_home_display_name
  character_set                   = var.dbcs01_character_set
  n_character_set                 = var.dbcs01_n_character_set
  db_workload                     = var.dbcs01_db_workload
  db_version                      = var.dbcs01_db_version
  database_software_image_id      = var.dbcs01_database_software_image_id
  pdb_name                        = var.dbcs01_pdb_name
  db_disk_redundancy              = var.dbcs01_db_disk_redundancy
  db_system_shape                 = var.dbcs01_db_system_shape
  hostname                        = var.dbcs01_hostname
  data_storage_size_in_gb         = var.dbcs01_data_storage_size_in_gb
  license_model                   = var.dbcs01_license_model
  node_count                      = var.dbcs01_node_count
  dbcs_nsg_name                   = var.dbcs01_dbcs_nsg_name
  db_edition                      = var.dbcs01_db_edition
  time_zone                       = var.dbcs01_time_zone
  auto_backup_enabled             = var.dbcs01_auto_backup_enabled
  recovery_window_in_days         = var.dbcs01_recovery_window_in_days
  auto_backup_window_utc          = var.dbcs01_auto_backup_window_utc
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}
