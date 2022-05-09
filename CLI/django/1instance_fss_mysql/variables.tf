# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# variables.tf
#
# Purpose:The following script declares all variables used in this backend repository

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

/********* Instance Variables *********/
/********** Compute SSH Key Variables **********/

variable "instance01_ssh_public_is_path" {
  description = "Describes if SSH Public Key is located on file or inside code"
  default     = false
}

variable "instance01_ssh_private_is_path" {
  description = "Describes if SSH Private Key is located on file or inside code"
  default     = false
}

variable "instance01_ssh_public_key" {
  description = "Defines SSH Public Key to be used in order to remotely connect to compute instance"
  type        = string

}

variable "instance01_ssh_private_key" {
  description = "Private key to log into machine"

}
/********** Compute SSH Key Variables **********/

/********** Compute Variables **********/
variable "instance01_num_instances" {
  description = "Amount of instances to create"
  default     = 0
}

variable "instance01_label_zs" {
  type        = list(any)
  description = "Auxiliary variable to concatenate with compute number"
  default     = ["0", ""]
}


variable "instance01_compute_display_name_base" {
  description = "Defines the compute and hostname Label for created compute"
}

variable "instance01_instance_shape" {
  description = "Defines the shape to be used on compute creation"
}

variable "instance01_primary_vnic_display_name" {
  description = "Defines the Primary VNIC Display Name"
  default     = "primaryvnic"
}

variable "instance01_assign_public_ip_flag" {
  description = "Defines either machine will have or not a Public IP assigned. All Pvt networks this variable must be false"
  default     = false
}

variable "instance01_fault_domain_name" {
  type        = list(any)
  description = "Describes the fault domain to be used by machine"
  default     = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3"]

}

variable "instance01_instance_image_ocid" {
  description = "Defines the OCID for the OS image to be used on artifact creation. Extract OCID from: https://docs.cloud.oracle.com/iaas/images/ or designated custom image OCID created by packer"
}

variable "instance01_private_ip" {
  description = "Describes the private IP required for machine"
  default     = null
}

variable "instance01_bkp_policy_boot_volume" {
  description = "Describes the backup policy attached to the boot volume"
  default     = "gold"
}


variable "instance01_linux_compute_instance_compartment_name" {
  description = "Defines the compartment name where the infrastructure will be created"
}

variable "instance01_linux_compute_network_compartment_name" {
  description = "Defines the compartment where the Network is currently located"
}

variable "instance01_compute_nsg_name" {
  description = "Name of the NSG associated to the compute"
}

variable "instance01_instance_shape_config_memory_in_gbs" {
  description = "(Updatable) The total amount of memory available to the instance, in gigabytes."
  default     = ""
}

variable "instance01_instance_shape_config_ocpus" {
  description = "(Updatable) The total number of OCPUs available to the instance."
  default     = ""
}

variable "instance01_is_flex_shape" {
  description = "Boolean that describes if the shape is flex or not"
  default     = false
  type        = bool

}

variable "instance01_is_nsg_required" {
  description = "Boolean that describes if an NSG is associated to the machine"
  default     = false
  type        = bool

}
/********** Compute Variables **********/

/********** Compute Datasource and Subnet Lookup related variables **********/
variable "instance01_compute_availability_domain_list" {
  type        = list(any)
  description = "Defines the availability domain list where OCI artifact will be created. This is a numeric value greater than 0"
}

variable "instance01_network_subnet_name" {
  description = "Defines the subnet display name where this resource will be created at"
}

variable "instance01_vcn_display_name" {
  description = "VCN Display name to execute lookup"
}
/********** Compute Datasource related variables **********/

/********* Instance Variables *********/

/********** FSS Variables **********/

variable "fssdisk01_fss_mount_target_name" {
  description = "User friendly name for Mount Target"
}

variable "fssdisk01_fss_display_name_base" {
  description = "User friendly name for File Storage Service"
}

variable "fssdisk01_export_path_base" {
  description = "Export path for File Storage Service"
}
variable "fssdisk01_mt_compartment_name" {
  description = "Mount Target Compartment Location"
  default     = ""
}
variable "fssdisk01_mt_compartment_id" {
  description = "Mount Target Compartment Location OCID"
  default     = ""
}

variable "fssdisk01_label_zs" {
  type    = list(any)
  default = ["0", ""]
}

variable "fssdisk01_num_of_fss" {
  description = "Amount of FSS that will be created"
}

variable "fssdisk01_fss_mount_target_availability_domain" {
  description = "Availability domain where the mount target is located at"

}

variable "fssdisk01_os_type" {
  description = "Describes the type of OS currently in place. Valid values are: linux, ubuntu, windows"
  type        = string


}

variable "fssdisk01_ssh_private_is_path" {
  description = "Determines if key is supposed to be on file or in text"
  default     = true
}

variable "fssdisk01_ssh_private_key" {
  description = "Determines what is the private key to connect to machine"
  default     = ""
}

variable "fssdisk01_win_os_password" {
  description = "Windows Server OS Password"
  default     = ""

}

variable "fssdisk01_disk_unit" {
  description = "Disk Unit Assigned to NFS Disk"
  default     = ""

}

variable "fssdisk01_is_winrm_configured_for_image" {
  description = "Defines if winrm is being used in this installation"
  type        = bool
  default     = true
}


variable "fssdisk01_is_winrm_configured_with_ssl" {
  description = "Use the https 5986 port for winrm by default. If that fails with a http response error: 401 - invalid content type, the SSL may not be configured correctly"
  type        = bool
  default     = true
}


/********** Datasource and Subnet Lookup related variables **********/

variable "fssdisk01_fss_instance_compartment_name" {
  description = "Defines the compartment name where the infrastructure will be created"
  default     = ""
}

variable "fssdisk01_fss_instance_compartment_id" {
  description = "Defines the compartment OCID where the infrastructure will be created"
  default     = ""
}

variable "fssdisk01_fss_network_compartment_name" {
  description = "Defines the compartment where the Network is currently located"
}

variable "fssdisk01_vcn_display_name" {
  description = "Display Name associated to VCN"
}

variable "fssdisk01_network_subnet_name" {
  description = "Name of the subnet where the artifact is located"
}

/********** Datasource related variables **********/

/********** FSS Variables **********/

/********** MySQL Variables **********/
variable "mysql01_mysql_instance_compartment_name" {
  description = "Compartment where MySQL Instance will be created"
  default = ""
}

variable "mysql01_mysql_network_compartment_name" {
  description = "Compartment where the network of MySQL artifact is"
  default = ""
}

variable "mysql01_mysql_instance_compartment_ocid" {
  description = "OCID of the compartment where MySQL Instance will be created. Use alternatively to mysql01_mysql_instance_compartment_name"
  default = ""
}

variable "mysql01_mysql_network_compartment_ocid" {
  description = "OCID of the compartment where the network of MySQL artifact is. Use alternatively to mysql01_mysql_network_compartment_name"
  default = ""
}

variable "mysql01_mysql_db_system_admin_password" {
  description = "(Required) The password for the administrative user. The password must be between 8 and 32 characters long, and must contain at least 1 numeric character, 1 lowercase character, 1 uppercase character, and 1 special (nonalphanumeric) character."
}

variable "mysql01_mysql_db_system_admin_username" {
  description = "(Required) The username for the administrative user."
}

variable "mysql01_mysql_db_system_availability_domain" {
  description = "(Required) The availability domain on which to deploy the Read/Write endpoint. This defines the preferred primary instance. In a failover scenario, the Read/Write endpoint is redirected to one of the other availability domains and the MySQL instance in that domain is promoted to the primary instance. This redirection does not affect the IP address of the DB System in any way. For a standalone DB System, this defines the availability domain in which the DB System is placed."
}

variable "mysql01_mysql_db_system_backup_policy_is_enabled" {
  description = "Boolean that defines if either backup is enabled or not"
  default     = false
}

variable "mysql01_mysql_db_system_backup_policy_retention_in_days" {
  description = "The number of days automated backups are retained."
  default     = ""
}

variable "mysql01_mysql_db_system_backup_policy_window_start_time" {
  description = "The start of a 30-minute window of time in which daily, automated backups occur. This should be in the format of the Time portion of an RFC3339-formatted timestamp. Any second or sub-second time data will be truncated to zero. At some point in the window, the system may incur a brief service disruption as the backup is performed."
  default     = ""
}

variable "mysql01_mysql_db_system_data_storage_size_in_gb" {
  description = "Initial size of the data volume in GiBs that will be created and attached."
}

variable "mysql01_mysql_db_system_defined_tags" {
  description = "Defined tags for this resource. Each key is predefined and scoped to a namespace."
  default = {}
}

variable "mysql01_mysql_db_system_description" {
  description = "User-provided data about the DB System."
}

variable "mysql01_mysql_db_system_display_name" {
  description = "The user-friendly name for the DB System. It does not have to be unique."
}

variable "mysql01_mysql_db_system_fault_domain" {
  description = "The fault domain on which to deploy the Read/Write endpoint. This defines the preferred primary instance."
}

variable "mysql01_mysql_db_system_freeform_tags" {
  description = "Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace."
  default = {}
}

variable "mysql01_mysql_db_system_hostname_label" {
  description = "The hostname for the primary endpoint of the DB System. Used for DNS. The value is the hostname portion of the primary private IP's fully qualified domain name (FQDN) (for example, dbsystem-1 in FQDN dbsystem-1.subnet123.vcn1.oraclevcn.com). Must be unique across all VNICs in the subnet and comply with RFC 952 and RFC 1123."

}

variable "mysql01_mysql_db_system_is_highly_available" {
  description = "Boolean that describes if either HA is enabled or not"
  default     = false
}

variable "mysql01_mysql_db_system_maintenance_window_start_time" {
  description = "(Required) (Updatable) The start of the 2 hour maintenance window. This string is of the format: {day-of-week} {time-of-day}. {day-of-week} is a case-insensitive string like mon, tue, etc. {time-of-day} is the Time portion of an RFC3339-formatted timestamp. Any second or sub-second time data will be truncated to zero."

}

variable "mysql01_mysql_db_system_port" {
  description = "(Optional) The port for primary endpoint of the DB System to listen on."
  default     = "3306"
}

variable "mysql01_mysql_db_system_port_x" {
  description = "(Optional) The TCP network port on which X Plugin listens for connections. This is the X Plugin equivalent of port."
  default     = "33060"
}

variable "mysql01_mysql_shape_name" {
  description = "(Required) The name of the shape. The shape determines the resources allocated. CPU cores and memory for VM shapes; CPU cores, memory and storage for non-VM (or bare metal) shapes. To get a list of shapes, use the ListShapes operation."
  default     = "MySQL.VM.Standard.E3.1.8GB"
}

variable "mysql01_mysql_heatwave_enabled" {
  description = "Defines whether a MySQL HeatWave cluster is enabled"
  default     = false
}

variable "mysql01_mysql_heatwave_cluster_size" {
  description = "Number of MySQL HeatWave nodes to be created"
  default     = 2
}

variable "mysql01_mysql_heatwave_shape" {
  description = "The shape to be used instead of mysql01_mysql_shape_name when mysql01_mysql_heatwave_enabled = true."
  default     = "MySQL.HeatWave.VM.Standard.E3"
}

/********** MySQL Variables **********/

/********** Datasource and Subnet Lookup related variables **********/
variable "mysql01_network_subnet_name" {
  description = "Defines the subnet display name where this resource will be created at"
  default = ""
}

variable "mysql01_vcn_display_name" {
  description = "VCN Display name to execute lookup"
  default = ""
}

variable "mysql01_subnet_id" {
  description = "Subnet OCID. Use alternatively to network_subnet_name"
  default = ""
}

/********** Django config related variables **********/

/********** Executor Variables **********/
variable "djangoconfig01_script_name" {
  description = "Name of .sh script"
  default     = "script.sh"
}

variable "djangoconfig01_script_args" {
  description = "Arguments that are passed on to the script"
  default     = null
}

/********** Executor Variables **********/

/********** SSH Key Variables **********/
variable "djangoconfig01_ssh_public_is_path" {
  description = "Describes if SSH Public Key is located on file or inside code"
  default     = false
}

variable "djangoconfig01_ssh_private_is_path" {
  description = "Describes if SSH Private Key is located on file or inside code"
  default     = false
}

variable "djangoconfig01_ssh_public_key" {
  description = "Defines SSH Public Key to be used in order to remotely connect to compute instance"
  type        = string

}

variable "djangoconfig01_ssh_private_key" {
  description = "Private key to log into machine"

}
/********** Django config related variables **********/