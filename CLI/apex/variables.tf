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



/********** Brick Variables **********/

/********** Compute SSH Key Variables **********/
variable "apex01_ssh_public_is_path" {
  description = "Describes if SSH Public Key is located on file or inside code"
  default     = false
}

variable "apex01_ssh_private_is_path" {
  description = "Describes if SSH Private Key is located on file or inside code"
  default     = false
}

variable "apex01_ssh_public_key" {
  description = "Defines SSH Public Key to be used in order to remotely connect to compute instance"
  type        = string

}

variable "apex01_ssh_private_key" {
  description = "Private key to log into machine"

}
/********** Compute SSH Key Variables **********/

/********** Compute Variables **********/
variable "apex01_num_instances" {
  description = "Amount of instances to create"
  default     = 0
}

variable "apex01_label_zs" {
  type        = list(any)
  description = "Auxiliary variable to concatenate with compute number"
  default     = ["0", ""]
}


variable "apex01_compute_display_name_base" {
  description = "Defines the compute and hostname Label for created compute"
}

variable "apex01_instance_shape" {
  description = "Defines the shape to be used on compute creation"
}

variable "apex01_fault_domain_name" {
  type        = list(any)
  description = "Describes the fault domain to be used by machine"
  default     = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3"]

}


variable "apex01_assign_public_ip_flag" {
  description = "Defines either machine will have or not a Public IP assigned. All Pvt networks this variable must be false"
  default     = false
}

variable "apex01_bkp_policy_boot_volume" {
  description = "Describes the backup policy attached to the boot volume"
  default     = "gold"
}


variable "apex01_linux_compute_instance_compartment_name" {
  description = "Defines the compartment name where the infrastructure will be created"
}

variable "apex01_linux_compute_network_compartment_name" {
  description = "Defines the compartment where the Network is currently located"
}


variable "apex01_instance_shape_config_memory_in_gbs" {
  description = "(Updatable) The total amount of memory available to the instance, in gigabytes."
  default     = ""
}

variable "apex01_instance_shape_config_ocpus" {
  description = "(Updatable) The total number of OCPUs available to the instance."
  default     = ""
}

variable "apex01_is_flex_shape" {
  description = "Boolean that describes if the shape is flex or not"
  default     = false
  type        = bool

}

/********** Compute Variables **********/

/********** Compute Datasource and Subnet Lookup related variables **********/
variable "apex01_compute_availability_domain_list" {
  type        = list(any)
  description = "Defines the availability domain list where OCI artifact will be created. This is a numeric value greater than 0"
}

variable "apex01_vcn_display_name" {
  description = "VCN Display name to execute lookup"
}

variable "apex01_compute_network_subnet_cidr_block" {
  description = "CIDR Block of the subnet where the computes are located at"
}
/********** Compute Datasource related variables **********/

variable "apex01_lbaas_display_name" {
  description = "Display Name for Load Balancer"

}

variable "apex01_lbaas_subnet_cidr_block" {
  description = "CIDR Block of the subnet where the LBaaS is located at"
}

variable "apex01_lbaas_ca_cert_is_path" {
  description = "Declared if the certificate LBaaS is in a path or if it is string"
  default     = true

}

variable "apex01_lbaas_pvt_key_is_path" {
  description = "Declares if the Private Key of LBaaS is in a path or string"
  default     = true

}

variable "apex01_lbaas_ssl_cert_is_path" {
  description = "Declares if the public certificate is in a path or string"
  default     = true

}

variable "apex01_certificate_bundle_display_name" {
  description = "Display name of certificate associated to LBaaS"
  default     = "certificate"

}

variable "apex01_lbaas_ca_cert" {
  description = "Load Balancer ca certificate"
  default     = null
}

variable "apex01_certificate_private_key" {
  description = "Load Balancer Private Key"
  default     = null

}

variable "apex01_lbaas_ssl_cert" {
  description = "Load Balancer Public Certificate"
  default     = null
}

variable "apex01_verify_peer_certificate" {
  description = "Defines if peer verification is enabled"
  default     = true

}
variable "apex01_ATP_password" {}
variable "availability_domain" {
  default = ""
}
variable "apex01_availability_domain_name" {
  default = ""
}

variable "apex01_compute_network_subnet_name" {
  description = "Compute Subnet Name"

}

variable "apex01_lbaas_network_subnet_name" {
  description = "LBaaS Subnet Name"

}

variable "apex01_ATP_network_subnet_name" {
  description = "ATP Subnet Name"

}


variable "apex01_lb_shape" {
  default = "flexible"
}

variable "apex01_flex_lb_min_shape" {
  default = "10"
}

variable "apex01_flex_lb_max_shape" {
  default = "100"
}

# OS Images
variable "apex01_instance_os" {
  description = "Operating system for compute instances"
  default     = "Oracle Linux"
}

variable "apex01_linux_os_version" {
  description = "Operating system version for all Linux instances"
  default     = "7.9"
}

variable "apex01_ATP_private_endpoint" {
  default = true
}

variable "apex01_ATP_database_cpu_core_count" {
  default = 1
}

variable "apex01_ATP_database_data_storage_size_in_tbs" {
  default = 1
}

variable "apex01_ATP_database_db_name" {
  default = "aTFdb"
}

variable "apex01_ATP_database_db_version" {
  default = "19c"
}

variable "apex01_ATP_database_defined_tags_value" {
  default = "value"
}

variable "apex01_ATP_database_display_name" {
  default = "ATP"
}

variable "apex01_ATP_database_freeform_tags" {
  default = {
    "Owner" = "ATP"
  }
}

variable "apex01_ATP_database_license_model" {
  default = "LICENSE_INCLUDED"
}

variable "apex01_ATP_tde_wallet_zip_file" {
  default = "tde_wallet_aTFdb.zip"
}

variable "apex01_ATP_private_endpoint_label" {
  default = "ATPPrivateEndpoint"
}

variable "apex01_ATP_data_guard_enabled" {
  default = false
}

variable "apex01_ATP_instance_compartment_name" {
  description = "Defines the compartment name where the ATP infrastructure will be created"
}

variable "apex01_apex_version" {
  description = "Defines the current static content version of apex"
  default     = "21.1.2"

}

/********** Brick Variables **********/