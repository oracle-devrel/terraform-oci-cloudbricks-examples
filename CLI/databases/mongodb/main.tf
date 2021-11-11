# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# main.tf
#
# Purpose: Defines all the components related to environment


module "mongodb01" {
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-mongodb?ref=v1.0.2"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  ssh_public_key                          = var.mongodb01_ssh_public_key
  ssh_private_key                         = var.mongodb01_ssh_private_key
  compute_nsg_name                        = var.mongodb01_compute_nsg_name
  linux_compute_instance_compartment_name = var.mongodb01_linux_compute_instance_compartment_name
  linux_compute_network_compartment_name  = var.mongodb01_linux_compute_network_compartment_name
  private_network_subnet_name             = var.mongodb01_private_network_subnet_name
  vcn_display_name                        = var.mongodb01_vcn_display_name

  config_server_name          = var.mongodb01_config_server_name
  config_server_shape         = var.mongodb01_config_server_shape
  config_server_count         = var.mongodb01_config_server_count
  config_server_ad_list       = var.mongodb01_config_server_ad_list
  config_server_fd_list       = var.mongodb01_config_server_fd_list
  config_server_is_flex_shape = var.mongodb01_config_server_is_flex_shape
  config_server_ocpus         = var.mongodb01_config_server_ocpus
  config_server_memory_in_gb  = var.mongodb01_config_server_memory_in_gb

  query_server_name          = var.mongodb01_query_server_name
  query_server_shape         = var.mongodb01_query_server_shape
  query_server_count         = var.mongodb01_query_server_count
  query_server_ad_list       = var.mongodb01_query_server_ad_list
  query_server_fd_list       = var.mongodb01_query_server_fd_list
  query_server_is_flex_shape = var.mongodb01_query_server_is_flex_shape
  query_server_ocpus         = var.mongodb01_query_server_ocpus
  query_server_memory_in_gb  = var.mongodb01_query_server_memory_in_gb

  shard_replica_set_name          = var.mongodb01_shard_replica_set_name
  shard_replica_set_shape         = var.mongodb01_shard_replica_set_shape
  shard_replica_set_count         = var.mongodb01_shard_replica_set_count
  shard_replica_set_ad_list       = var.mongodb01_shard_replica_set_ad_list
  shard_replica_set_fd_list       = var.mongodb01_shard_replica_set_fd_list
  shard_replica_set_is_flex_shape = var.mongodb01_shard_replica_set_is_flex_shape
  shard_replica_set_ocpus         = var.mongodb01_shard_replica_set_ocpus
  shard_replica_set_memory_in_gb  = var.mongodb01_shard_replica_set_memory_in_gb

  instance_backup_policy_level = var.mongodb01_instance_backup_policy_level

  config_disk_size_in_gb     = var.mongodb01_config_disk_size_in_gb
  config_disk_vpus_per_gb    = var.mongodb01_config_disk_vpus_per_gb
  config_backup_policy_level = var.mongodb01_config_backup_policy_level

  query_disk_size_in_gb     = var.mongodb01_query_disk_size_in_gb
  query_disk_vpus_per_gb    = var.mongodb01_query_disk_vpus_per_gb
  query_backup_policy_level = var.mongodb01_query_backup_policy_level

  database_size_in_gb          = var.mongodb01_database_size_in_gb
  database_vpus_per_gb         = var.mongodb01_database_vpus_per_gb
  database_backup_policy_level = var.mongodb01_database_backup_policy_level

  mongodb_version = var.mongodb01_mongodb_version
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}
