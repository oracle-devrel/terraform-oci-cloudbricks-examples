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
/********** SSH Key Variables **********/
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
/********** SSH Key Variables **********/


/********** Compute Variables **********/
variable "instance01_os_user" {
  description = "User that will log into windows"
  default     = "opc"
}

variable "instance01_userdata" {
  description = "Describes userdata placeholder variable"
  default     = "userdata"
}

variable "instance01_cloudinit_ps1" {
  description = "Describes cloudinit.ps1 powershell script placeholder variable"
  default     = "cloudinit.ps1"
}

variable "instance01_cloudinit_config" {
  description = "Describes cloudinit.yml powershell script placeholder variable"
  default     = "cloudinit.yml"
}

variable "instance01_setup_ps1" {
  description = "Describes setup.ps1 powershell script placeholder variable"
  default     = "setup.ps1"
}

variable "instance01_num_instances" {
  description = "Amount of instances to create"
  default     = 0
}

variable "instance01_label_zs" {
  type    = list(any)
  default = ["0", ""]
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


variable "instance01_is_compute_in_hub_dmz01" {
  description = "Defines if the compute is going to be created in Hub DMZ01 Subnet"
  default     = false
}

variable "instance01_is_compute_in_hub_svc01" {
  description = "Defines if the compute is going to be created in the Hub SharedSvc01 Subnet"
  default     = false
}

variable "instance01_is_winrm_configured_for_image" {
  description = "Defines if winrm is being used in this installation"
  default     = "true"
}


variable "instance01_is_winrm_configured_with_ssl" {
  description = "Use the https 5986 port for winrm by default. If that fails with a http response error: 401 - invalid content type, the SSL may not be configured correctly"
  default     = "true"
}

variable "instance01_windows_compute_instance_compartment_name" {
  description = "Defines the compartment name where the infrastructure will be created"
}

variable "instance01_windows_compute_network_compartment_name" {
  description = "Defines the compartment where the Network is currently located"
}

variable "instance01_compute_nsg_name" {
  description = "Name of the NSG associated to the compute"
  default     = ""
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

/********** Datasource and Subnet Lookup related variables **********/
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


# Use the https 5986 port for winrm by default
# If that fails with a http response error: 401 - invalid content type, the SSL may not be configured correctly
# In that case you can switch to http 5985 by setting this to false, and configuring winrm to AllowUnencrypted traffic
variable "instance01_is_winrm_configured_for_ssl" {
  default = "true"
}

/********** Datasource related variables **********/

/************* Datasource Script Variables *************/
variable "disk01_iscsi_disk_instance_compartment_name" {
  description = "Defines the compartment name where the infrastructure will be created"
}
/************* Datasource Script Variables *************/

/************* Disk Variables *************/
variable "disk01_ssh_private_is_path" {
  description = "Determines if key is supposed to be on file or in text"
  default     = true
}

variable "disk01_amount_of_disks" {
  description = "Amount of equally sized disks"
}

variable "disk01_disk_size_in_gb" {
  description = "Size in GB for Product Disk"
}

variable "disk01_volume_display_name" {
  description = "Disk display name."
}

variable "disk01_attachment_type" {
  description = "Atacchment type can be iscsi or paravirtualized"
  default     = "iscsi"
}

variable "disk01_windows_compute_id" {
  description = "OCI Id for instance to attach the disk"
  default     = null
}

variable "disk01_attach_disks" {
  description = "Atach disk to a Linux instance"
  default     = true
}

variable "disk01_backup_policy_level" {
  description = "Backup policy level for ISCSI disks"
}

variable "disk01_vpus_per_gb" {
  default = 10
}

variable "disk01_is_winrm_configured_for_image" {
  description = "Defines if winrm is being used in this installation"
  default     = "true"
}


variable "disk01_is_winrm_configured_with_ssl" {
  description = "Use the https 5986 port for winrm by default. If that fails with a http response error: 401 - invalid content type, the SSL may not be configured correctly"
  default     = "true"
}

variable "disk01_partition_style" {
  description = "Describes Partition Style for the Disk"
  default     = "MBR"
}

variable "disk01_filesystem_format" {
  description = "Describes Filesystem format for the Disk"
  default     = "NTFS"
}

variable "disk01_iswin2008" {
  description = "Describes if the instance is Windows 2008 or not"
  default     = false

}

variable "disk01_userdata" {
  description = "Describes userdata placeholder variable"
  default     = "userdata"
}

variable "disk01_setup_ps1" {
  description = "Describes setup.ps1 powershell script placeholder variable"
  default     = "setup.ps1"
}

variable "disk01_format_disk_ps1" {
  description = "Describes format_disk.ps1 powershell script placeholder variable"
  default     = "format_disk.ps1"
}

variable "disk01_os_user" {
  description = "Defines default admin user for instance"
  default     = "opc"

}

variable "disk01_disk_label_map" {
  type        = map(any)
  description = "Mapping of Disk Letter plus it's mapping"
}
/************* Disk Variables *************/