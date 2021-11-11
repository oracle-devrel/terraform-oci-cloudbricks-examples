# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# variables.tf
#
# Purpose: The following script declares all variables used in this frontend repository

/********** Provider Variables NOT OVERLOADABLE **********/
variable "region" {
  description = "Target region where artifacts are going to be created"
}

variable "tenancy_ocid" {
  description = "OCID of tenancy"
}

variable "user_ocid" {
  description = "User OCID in tenancy."
}

variable "fingerprint" {
  description = "API Key Fingerprint for user_ocid derived from public API Key imported in OCI User config"
}

variable "private_key_path" {
  description = "Private Key Absolute path location where terraform is executed"

}
/********** Provider Variables NOT OVERLOADABLE **********/

/********** Brick Variables **********/

variable "postgre01_postgresql_master_name" {
  description = "The name given to the master instance"
}

variable "postgre01_postgresql_master_ad" {
  description = "The availability domain to provision the master instance in"
}

variable "postgre01_postgresql_master_fd" {
  description = "The fault domain to provision the master instance in"
}

variable "postgre01_postgresql_master_shape" {
  description = "The shape for the master instance to use"
}

variable "postgre01_postgresql_master_is_flex_shape" {
  description = "Boolean to determine if the master instance is flex or not"
  default     = false
  type        = bool
}

variable "postgre01_postgresql_master_ocpus" {
  description = "The number of OCPUS for the master instance to use when flex shape is enabled"
  default     = ""
}

variable "postgre01_postgresql_master_memory_in_gb" {
  description = "The amount of memory in GB for the master instance to use when flex shape is enabled"
  default     = ""
}

variable "postgre01_postgresql_hotstandby_shape" {
  description = "The shape for the hotstandby instances to use"
  default     = ""
}

variable "postgre01_postgresql_hotstandby_is_flex_shape" {
  description = "Boolean to determine if the standy instances are flex or not"
  default     = false
  type        = bool
}

variable "postgre01_postgresql_hotstandby_ocpus" {
  description = "The number of OCPUS for the flex instances to use when flex shape is enabled"
  default     = ""
}

variable "postgre01_postgresql_hotstandby_memory_in_gb" {
  description = "The amount of memory in GB for the standby instances to use when flex shape is enabled"
  default     = ""
}

variable "postgre01_postgresql_deploy_hotstandby1" {
  description = "Boolean to determine if to provision hotstandby1"
  default     = false
  type        = bool
}

variable "postgre01_postgresql_standyby1_name" {
  description = "The name given to the standby1 instance"
  default     = ""
}

variable "postgre01_postgresql_hotstandby1_ad" {
  description = "The availability domain to provision the hoststandby1 instance in"
  default     = ""
}

variable "postgre01_postgresql_hotstandby1_fd" {
  description = "The fault domain to provision the hoststandby1 instance in"
  default     = ""
}

variable "postgre01_postgresql_deploy_hotstandby2" {
  description = "Boolean to determine if to provision hotstandby2"
  default     = false
  type        = bool
}

variable "postgre01_postgresql_standyby2_name" {
  description = "The name given to the standby2 instance"
  default     = ""
}

variable "postgre01_postgresql_hotstandby2_ad" {
  description = "The availability domain to provision the hoststandby2 instance in"
  default     = ""
}

variable "postgre01_postgresql_hotstandby2_fd" {
  description = "The fault domain to provision the hoststandby2 instance in"
  default     = ""
}

variable "postgre01_instance_os" {
  description = "Operating system for compute instances"
  default     = "Oracle Linux"
}

variable "postgre01_linux_os_version" {
  description = "Operating system version for all Linux instances"
  default     = "7.9"
}

variable "postgre01_postgresql_replicat_username" {
  description = "The username used in setup of PostgreSQL replication"
  default     = "replicator"
}

variable "postgre01_postgresql_password" {
  description = "The password used in setup of the PostgreSQL database"
}

variable "postgre01_postgresql_version" {
  description = "The version of PostgreSQL used in the setup"
}

variable "postgre01_ssh_public_key" {
  description = "Defines SSH Public Key to be used in order to remotely connect to compute instances"
}

variable "postgre01_ssh_private_key" {
  description = "Defines SSH Private Key to be used in order to remotely connect to compute instances"
}

variable "postgre01_linux_compute_instance_compartment_name" {
  description = "Defines the compartment name where the infrastructure will be created"
}

variable "postgre01_linux_compute_network_compartment_name" {
  description = "Defines the compartment where the Network is currently located"
}

variable "postgre01_vcn_display_name" {
  description = "VCN Display name to execute lookup"
}

variable "postgre01_private_network_subnet_name" {
  description = "Defines the subnet display name where this resource will be created at"
}

variable "postgre01_compute_nsg_name" {
  description = "Name of the NSG associated to the compute"
  default     = ""
}

variable "postgre01_database_backup_policy_level" {
  description = "Backup policy level for Database ISCSI disks"
}

variable "postgre01_database_size_in_gb" {
  description = "Disk Capacity for Database"
}

variable "postgre01_database_vpus_per_gb" {
  description = "Disk VPUS for the Database"
}

variable "postgre01_instance_backup_policy_level" {
  description = "Backup policy level for instance boot volume disks"
}

/********** Brick Variables **********/