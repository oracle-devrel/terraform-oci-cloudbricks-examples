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

/********** compute01 Variables **********/

/********** Compute SSH Key Variables **********/
variable "compute01_ssh_public_is_path" {
  description = "Describes if SSH Public Key is located on file or inside code"
  default     = false
}

variable "compute01_ssh_private_is_path" {
  description = "Describes if SSH Private Key is located on file or inside code"
  default     = false
}

variable "compute01_ssh_public_key" {
  description = "Defines SSH Public Key to be used in order to remotely connect to compute instance"
  type        = string

}

variable "compute01_ssh_private_key" {
  description = "Private key to log into machine"

}
/********** Compute SSH Key Variables **********/

/********** Compute Variables **********/
variable "compute01_num_instances" {
  description = "Amount of instances to create"
  default     = 0
}

variable "compute01_label_zs" {
  type        = list(any)
  description = "Auxiliary variable to concatenate with compute number"
  default     = ["0", ""]
}


variable "compute01_compute_display_name_base" {
  description = "Defines the compute and hostname Label for created compute"
}

variable "compute01_instance_shape" {
  description = "Defines the shape to be used on compute creation"
}

variable "compute01_primary_vnic_display_name" {
  description = "Defines the Primary VNIC Display Name"
  default     = "primaryvnic"
}

variable "compute01_assign_public_ip_flag" {
  description = "Defines either machine will have or not a Public IP assigned. All Pvt networks this variable must be false"
  default     = false
}

variable "compute01_fault_domain_name" {
  type        = list(any)
  description = "Describes the fault domain to be used by machine"
  default     = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3"]

}

variable "compute01_instance_image_ocid" {
  description = "Defines the OCID for the OS image to be used on artifact creation. Extract OCID from: https://docs.cloud.oracle.com/iaas/images/ or designated custom image OCID created by packer"
}

variable "compute01_private_ip" {
  description = "Describes the private IP required for machine"
  default     = null
}

variable "compute01_bkp_policy_boot_volume" {
  description = "Describes the backup policy attached to the boot volume"
  default     = "gold"
}


variable "compute01_linux_compute_instance_compartment_name" {
  description = "Defines the compartment name where the infrastructure will be created"
}

variable "compute01_linux_compute_network_compartment_name" {
  description = "Defines the compartment where the Network is currently located"
}

variable "compute01_compute_nsg_name" {
  description = "Name of the NSG associated to the compute"
}

variable "compute01_instance_shape_config_memory_in_gbs" {
  description = "(Updatable) The total amount of memory available to the instance, in gigabytes."
  default     = ""
}

variable "compute01_instance_shape_config_ocpus" {
  description = "(Updatable) The total number of OCPUs available to the instance."
  default     = ""
}

variable "compute01_is_flex_shape" {
  description = "Boolean that describes if the shape is flex or not"
  default     = false
  type        = bool

}

variable "compute01_is_nsg_required" {
  description = "Boolean that describes if an NSG is associated to the machine"
  default     = false
  type        = bool

}
/********** Compute Variables **********/

/********** Compute Datasource and Subnet Lookup related variables **********/
variable "compute01_compute_availability_domain_list" {
  type        = list(any)
  description = "Defines the availability domain list where OCI artifact will be created. This is a numeric value greater than 0"
}

variable "compute01_network_subnet_name" {
  description = "Defines the subnet display name where this resource will be created at"
}

variable "compute01_vcn_display_name" {
  description = "VCN Display name to execute lookup"
}
/********** Compute Datasource related variables **********/

/********** compute01 Variables **********/


/********** bastion_service01 Variables **********/

variable "bastion_service01_bastion_service_instance_compartment_name" {
  description = "Defines the compartment name where the infrastructure will be created"
  default     = ""
}

variable "bastion_service01_bastion_service_network_compartment_name" {
  description = "Defines the compartment where the Network is currently located"
  default     = ""
}

variable "bastion_service01_vcn_display_name" {
  description = "VCN Display name to execute lookup"
  default     = ""
}

variable "bastion_service01_private_network_subnet_name" {
  description = "Defines the subnet display name where this resource will be created at"
  default     = ""
}

variable "bastion_service01_bastion_service_name" {
  description = "Name of the Bastion Service"
  default     = "bastionservice"

}
variable "bastion_service01_bastion_service_type" {
  description = "The type of bastion"
  default     = "STANDARD"

}

variable "bastion_service01_allowed_client_cidr" {
  description = "A list of address ranges in CIDR notation that you want to allow to connect to sessions hosted by this bastion"
  default     = ["0.0.0.0/0"]

}

variable "bastion_service01_bastion_max_session_ttl_in_seconds" {
  description = "The maximum TTL for a session initiated from the bastion"
  default     = 3600
}

/********** bastion_service01 Variables **********/


/********** bastion_session01 Variables **********/

variable "bastion_session01_ssh_public_key" {
  description = "Defines SSH Public Key to be used for the Bastion Session"
}

variable "bastion_session01_bastion_service_name" {
  description = "Defines the Bastion Service name to attach the session to"
}

variable "bastion_session01_bastion_service_instance_compartment_name" {
  description = "Defines where the Bastion Service has already been provisioned"
}

variable "bastion_session01_bastion_session_compute_list" {
  description = "A list of objects that contains the display name, id, type, ttl and either the username or port, depending on which session type is used."
}

/********** bastion_session01 Variables **********/



/********** Brick Variables **********/
