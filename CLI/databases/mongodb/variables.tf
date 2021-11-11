# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# variables.tf
#
# Purpose: The following script declares all variables used in this backend repository


/********** Provider Variables NOT OVERLOADABLE **********/
variable "region" {
  description = "Target region where artifacts are going to be created"
}

variable "tenancy_ocid" {
  description = "OCID of tenancy"
}

variable "user_ocid" {
  description = "User OCID in tenancy. Currently hardcoded to user denny.alquinta@oracle.com"
}

variable "fingerprint" {
  description = "API Key Fingerprint for user_ocid derived from public API Key imported in OCI User config"
}

variable "private_key_path" {
  description = "Private Key Absolute path location where terraform is executed"
}

/********** Provider Variables NOT OVERLOADABLE **********/

/********** Brick Variables **********/

variable "mongodb01_config_server_name" {
  description = "The name given to the config server instances"
}

variable "mongodb01_config_server_ad_list" {
  description = "The availability domains to provision the config server instances in"
}

variable "mongodb01_config_server_fd_list" {
  description = "The fault domains to provision the config server instances in"
}

variable "mongodb01_config_server_shape" {
  description = "The shape for the config server instances to use"
}

variable "mongodb01_config_server_count" {
  description = "The number of config server instances to provision"
}

variable "mongodb01_config_server_is_flex_shape" {
  description = "Boolean to determine if the config server instances are flex or not"
  default     = false
  type        = bool
}

variable "mongodb01_config_server_ocpus" {
  description = "The number of OCPUS for the config server instances to use when flex shape is enabled"
  default     = ""
}

variable "mongodb01_config_server_memory_in_gb" {
  description = "The amount of memory in GB for the config server instances to use when flex shape is enabled"
  default     = ""
}


variable "mongodb01_query_server_name" {
  description = "The name given to the query server instances instance"
}

variable "mongodb01_query_server_count" {
  description = "The number of query server instances to provision"
}


variable "mongodb01_query_server_ad_list" {
  description = "The availability domains to provision the query server instances in"
}

variable "mongodb01_query_server_fd_list" {
  description = "The fault domains to provision the query server instances in"
}

variable "mongodb01_query_server_shape" {
  description = "The shape for the query server instances to use"
}

variable "mongodb01_query_server_is_flex_shape" {
  description = "Boolean to determine if the query server instances are flex or not"
  default     = false
  type        = bool
}

variable "mongodb01_query_server_ocpus" {
  description = "The number of OCPUS for the query server instances to use when flex shape is enabled"
  default     = ""
}

variable "mongodb01_query_server_memory_in_gb" {
  description = "The amount of memory in GB for the query server instances to use when flex shape is enabled"
  default     = ""
}

variable "mongodb01_shard_replica_set_name" {
  description = "The name given to the shard server instances"
}

variable "mongodb01_shard_replica_set_count" {
  description = "The number of shard server instances to provision"
}


variable "mongodb01_shard_replica_set_ad_list" {
  description = "The availability domains to provision the shard server instances in"
}

variable "mongodb01_shard_replica_set_fd_list" {
  description = "The fault domains to provision the shard server instances in"
}

variable "mongodb01_shard_replica_set_shape" {
  description = "The shape for the shard server instances to use"
}

variable "mongodb01_shard_replica_set_is_flex_shape" {
  description = "Boolean to determine if the shard server instances are flex or not"
  default     = false
  type        = bool
}

variable "mongodb01_shard_replica_set_ocpus" {
  description = "The number of OCPUS for the shard server instances to use when flex shape is enabled"
  default     = ""
}

variable "mongodb01_shard_replica_set_memory_in_gb" {
  description = "The amount of memory in GB for the shard server instances to use when flex shape is enabled"
  default     = ""
}

variable "mongodb01_mongodb_version" {
  description = "The version of MongoDB used in the setup"
}

variable "mongodb01_ssh_public_key" {
  description = "Defines SSH Public Key to be used in order to remotely connect to compute instances"
}

variable "mongodb01_ssh_private_key" {
  description = "Defines SSH Private Key to be used in order to remotely connect to compute instances"
}

variable "mongodb01_linux_compute_instance_compartment_name" {
  description = "Defines the compartment name where the infrastructure will be created"
}

variable "mongodb01_linux_compute_network_compartment_name" {
  description = "Defines the compartment where the Network is currently located"
}

variable "mongodb01_vcn_display_name" {
  description = "VCN Display name to execute lookup"
}

variable "mongodb01_private_network_subnet_name" {
  description = "Defines the subnet display name where this resource will be created at"
}

variable "mongodb01_compute_nsg_name" {
  description = "Name of the NSG associated to the computes"
  default     = ""
}

variable "mongodb01_config_disk_size_in_gb" {
  description = "The size of the attached disk to the config server instances, stores logging data"
}

variable "mongodb01_config_disk_vpus_per_gb" {
  description = "The VPUS of the attached disk to the config server instances"
}

variable "mongodb01_query_disk_size_in_gb" {
  description = "The size of the attached disk to the query server instances, stores logging data"
}

variable "mongodb01_query_disk_vpus_per_gb" {
  description = "The VPUS of the attached disk to the query server instances"
}

variable "mongodb01_database_size_in_gb" {
  description = "The size of the attached disk to the shard server instances, stores database data"
}

variable "mongodb01_database_vpus_per_gb" {
  description = "The VPUS of the attached disk to the shard server instances"
}

variable "mongodb01_instance_backup_policy_level" {
  description = "The backup policy of all instances boot volumes"
}

variable "mongodb01_config_backup_policy_level" {
  description = "The backup policy of config server ISCSI disks"
}

variable "mongodb01_query_backup_policy_level" {
  description = "The backup policy of query server ISCSI disks"
}

variable "mongodb01_database_backup_policy_level" {
  description = "Backup policy level for Database ISCSI disks"
}

/********** Brick Variables **********/
