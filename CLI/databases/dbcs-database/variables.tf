# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# variables.tf 
#
# Purpose: The following file declares all variables used in this frontend repository


/********** Provider Variables NOT OVERLOADABLE **********/
variable "region" {
  description = "Target region where artifacts are going to be created"
}

variable "tenancy_ocid" {
  description = "OCID of tenancy"
}

variable "user_ocid" {
  description = "User OCID in tenancy"
}

variable "fingerprint" {
  description = "API Key Fingerprint for user_ocid derived from public API Key imported in OCI User config"
}

variable "private_key_path" {
  description = "Private Key Absolute path location where terraform is executed"
}

/********** Provider Variables NOT OVERLOADABLE **********/

/********** Brick Variables **********/

/********** DBCS Variables **********/

variable "dbcs01_ssh_public_is_path" {
  description = "Describes if SSH Public Key is located on file or inside code"
  default     = false
}

variable "dbcs01_ssh_private_is_path" {
  description = "Describes if SSH Private Key is located on file or inside code"
  default     = false
}

variable "dbcs01_ssh_public_key" {
  description = "Defines SSH Public Key to be used in order to remotely connect to compute instance"
  type        = string
}

variable "dbcs01_storage_management" {
  description = "The storage option used in DB system. ASM - Automatic storage management LVM - Logical Volume management"
  default     = "ASM"
}


variable "dbcs01_ssh_private_key" {
  description = "Private Key to use for latter connection to the DB on null resource"
}


variable "dbcs01_cluster_name" {
  description = "Describes the DB Cluster Name"
  default     = "DB-Cluster"
}

variable "dbcs01_db_admin_password" {
  description = "DBCS Administration Password"
}

variable "dbcs01_db_name" {
  description = "Database Name"
}

variable "dbcs01_character_set" {
  description = "Charset used by DB"
}

variable "dbcs01_n_character_set" {
  description = "N Charset used by DB"
}

variable "dbcs01_db_workload" {
  description = "Workload intended from DB"
}

variable "dbcs01_db_version" {
  description = "Database Version"
}

variable "dbcs01_db_display_name" {
  description = "Database Display Name"
}

variable "dbcs01_db_home_display_name" {
  description = "Database Home Display Name"
}

variable "dbcs01_db_disk_redundancy" {
  description = "Database Disk Redundancy"
}

variable "dbcs01_db_system_shape" {
  description = "DB Systems Shape"
}

variable "dbcs01_hostname" {
  description = "DB Hostname"
}

variable "dbcs01_data_storage_size_in_gb" {
  description = "Database Storage in GB"
}

variable "dbcs01_db_edition" {
  description = "Database Edition"
}

variable "dbcs01_license_model" {
  description = "Database System License Model"
}

variable "dbcs01_node_count" {
  description = "Amount of nodes in DB"
}

variable "dbcs01_dbcs_nsg_name" {
  description = "Display Name of an optional Network Security Group"
  default     = ""
}

variable "dbcs01_fault_domains" {
  description = "Fault Domains"
  default     = ""
}

variable "dbcs01_time_zone" {
  description = "Timezone definition for Database"
  default     = "America/Santiago"

}

variable "dbcs01_pdb_name" {
  description = "Pluggable Database Name for DB"
}

variable "dbcs01_dbcs_availability_domain_number" {
  description = "Defines the availability domain where OCI artifact will be created. This is a numeric value greater than 0"
}

variable "dbcs01_auto_backup_enabled" {
  description = "Defines if autobackup is enabled or not"
  default     = false
}

variable "dbcs01_recovery_window_in_days" {
  description = "Defines the recovery window in days. Supported values are 7,15,30,45 and 60 days"
  default     = null
}

variable "dbcs01_auto_backup_window_utc" {
  description = "Defines the recovery 2 hour window. The values must be from '12:00AM-02:00AM_UTC' to '10:00PM-12:00AM_UTC', if different value is provided defaults to null (ANYTIME) "
  default     = "ANYTIME"
}

variable "dbcs01_database_software_image_id" {
  description = "Defines the OCID of the Database Software Image that should be used by database"
  default     = null
}

/********** DBCS Variables **********/

/********** Datasource and Subnet Lookup related variables **********/

variable "dbcs01_dbcs_instance_compartment_name" {
  description = "Defines the compartment name where the infrastructure will be created"
  default     = ""
}

variable "dbcs01_dbcs_instance_compartment_id" {
  description = "Defines the compartment OCID where the infrastructure will be created"
  default     = ""
}

variable "dbcs01_dbcs_network_compartment_name" {
  description = "Defines the compartment where the Network is currently located"

}

variable "dbcs01_network_subnet_name" {
  description = "Defines the subnet display name where this resource will be created at"
}

variable "dbcs01_vcn_display_name" {
  description = "VCN Display name to execute lookup"
}

/********** Datasource related variables **********/

/********** Brick Variables **********/
