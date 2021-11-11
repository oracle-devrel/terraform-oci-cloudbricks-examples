# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# main.tf
#
# Purpose: Defines all the components related to environment


module "redis01" {
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-redis?ref=v1.0.1"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  ssh_public_key                          = var.redis01_ssh_public_key
  ssh_private_key                         = var.redis01_ssh_private_key
  compute_nsg_name                        = var.redis01_compute_nsg_name
  linux_compute_instance_compartment_name = var.redis01_linux_compute_instance_compartment_name
  linux_compute_network_compartment_name  = var.redis01_linux_compute_network_compartment_name
  private_network_subnet_name             = var.redis01_private_network_subnet_name
  vcn_display_name                        = var.redis01_vcn_display_name

  redis_master_name          = var.redis01_redis_master_name
  redis_master_shape         = var.redis01_redis_master_shape
  redis_master_ad            = var.redis01_redis_master_ad
  redis_master_fd            = var.redis01_redis_master_fd
  redis_master_is_flex_shape = var.redis01_redis_master_is_flex_shape
  redis_master_ocpus         = var.redis01_redis_master_ocpus
  redis_master_memory_in_gb  = var.redis01_redis_master_memory_in_gb

  redis_replica_name          = var.redis01_redis_replica_name
  redis_replica_count         = var.redis01_redis_replica_count
  redis_replica_shape         = var.redis01_redis_replica_shape
  redis_replica_ad_list       = var.redis01_redis_replica_ad_list
  redis_replica_fd_list       = var.redis01_redis_replica_fd_list
  redis_replica_is_flex_shape = var.redis01_redis_replica_is_flex_shape
  redis_replica_memory_in_gb  = var.redis01_redis_replica_memory_in_gb
  redis_replica_ocpus         = var.redis01_redis_replica_ocpus

  redis_version = var.redis01_redis_version

  instance_backup_policy_level = var.redis01_instance_backup_policy_level

  master_disk_size_in_gb     = var.redis01_master_disk_size_in_gb
  master_disk_vpus_per_gb    = var.redis01_master_disk_vpus_per_gb
  master_backup_policy_level = var.redis01_master_backup_policy_level

  replica_disk_size_in_gb     = var.redis01_replica_disk_size_in_gb
  replica_disk_vpus_per_gb    = var.redis01_replica_disk_vpus_per_gb
  replica_backup_policy_level = var.redis01_replica_backup_policy_level
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}
