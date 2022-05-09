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

/********** POSTGRESQL Variables **********/

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

/********** POSTGRESQL Variables **********/


/********** backendset01 LBaaS Single Backend Set Variables **********/

variable "backendset01_lbaas_bes_single_instance_compartment_name" {
  description = "LBaaS Backend Set Artifact Compartment Location"
}

variable "backendset01_lbaas_bes_single_network_compartment_name" {
  description = "LBaaS Backend Set Network Compartment Location"
}

variable "backendset01_backend_set_name" {
  description = "LBaaS Backend Set Name to be provided on provisioning time"
}

variable "backendset01_is_app_bes" {
  description = "Boolean that determines if an application backend set should be provisioned or not"
  default     = false
  type        = bool
}

variable "backendset01_is_network_bes" {
  description = "Boolean that determines if a network backend set should be provisioned or not"
  default     = false
  type        = bool
}

variable "backendset01_is_instancepool_bes" {
  description = "Boolean that determines if an instancepool backend set should be provisioned or not"
  default     = false
  type        = bool
}

variable "backendset01_lbaas_policy" {
  description = "Load balancing policy chosen"
}

variable "backendset01_backend_set_is_preserve_source" {
  description = "If this optional parameter is enabled, then the network load balancer preserves the source IP of the packet when it is forwarded to backends. Backends see the original source IP. If the isPreserveSourceDestination parameter is enabled for the network load balancer resource, then this parameter cannot be disabled. The value is true by default."
  default     = false
  type        = bool
}

variable "backendset01_checkport" {
  description = "Port where the healthcheck will be performed"
}

variable "backendset01_check_protocol" {
  description = "Protocol to be used on healthcheck"
}

variable "backendset01_balanced_artifact" {
  description = "Integration variable which encapsulates any generic resource that may be balanced by this LBaaS"
  default     = ""
}

variable "backendset01_backend_port" {
  description = "The port used to interact with the backend instances"
}

variable "backendset01_listener_name" {
  description = "Name of the listener attached to the backend LBaaS and points to backends"
  default     = ""
}

variable "backendset01_session_persistance_cookie_name" {
  description = "Name of the cookie related to maintain session persistance for balanced application"
  default     = ""
}

variable "backendset01_listen_port" {
  description = "Port where listener will receive communication"
  default     = ""
}

variable "backendset01_listen_protocol" {
  description = "Protocol where Listener will receive communication"
  default     = ""
}


variable "backendset01_routing_policy_condition_language_version" {
  description = "Version used to parse routing policy language"
  default     = ""
}

variable "backendset01_routing_policy_name" {
  description = "Routing Policy name to be provided when provisioning"
  default     = ""
}

variable "backendset01_routing_policy_conditions" {
  description = "Map of routing policy rule names to routing policy conditions"
  default     = ""
}

variable "backendset01_routing_policy_actions_name" {
  description = "Actions to take place when conditons are met"
  default     = ""
}

variable "backendset01_lbaas_cert_is_path" {
  description = "Describes if LbaaS certificate is located on file or inside code"
  default     = true
}

variable "backendset01_lbaas_pvt_key_is_path" {
  description = "Describes if LbaaS certificate private key is located on file or inside code"
  default     = true
}

variable "backendset01_lbaas_pub_cert_is_path" {
  description = "Describes if LbaaS public certificate is located on file or inside code"
  default     = true
}

variable "backendset01_lbaas_ca_cert" {
  description = "The Certificate Authority certificate, or any interim certificate, that you received from your SSL certificate provider."
  default     = ""
}

variable "backendset01_lbaas_public_cert" {
  description = "The SSL public certificate, in PEM format."
  default     = ""
}

variable "backendset01_certificate_passphrase" {
  description = "A passphrase for encrypted private keys. This is needed only if you created your certificate with a passphrase."
  default     = ""
}

variable "backendset01_certificate_private_key" {
  description = "The SSL private key for your certificate, in PEM format."
  default     = ""
}

variable "backendset01_certificate_name" {
  description = "A friendly name for the certificate bundle. It must be unique and it cannot be changed. Valid certificate bundle names include only alphanumeric characters, dashes, and underscores. Certificate bundle names cannot contain spaces. Avoid entering confidential information."
  default     = ""
}

variable "backendset01_verify_peer_certificate" {
  description = "Whether the load balancer listener should verify peer certificates"
  default     = false
}

/********** backendset01 LBaaS Single Backend Set Variables **********/



/********** backendset01 Datasource and Subnet Lookup related variables **********/

variable "backendset01_network_subnet_name" {
  description = "Defines the subnet display name where this resource will be created at"
}

variable "backendset01_vcn_display_name" {
  description = "VCN Display name to execute lookup"
}

/********** backendset01 Datasource related variables **********/

/********** loadbalancer01 LBaaS Variables **********/

variable "loadbalancer01_lbaas_shape" {
  description = "A template that determines the total pre-provisioned bandwidth (ingress plus egress). To get a list of available shapes, use the ListShapes operation. Example: 100Mbps"
  default     = "flexible"
}

variable "loadbalancer01_lbaas_display_name" {
  description = "A user-friendly name. It does not have to be unique, and it is changeable. Avoid entering confidential information. Example: example_load_balancer"
}

variable "loadbalancer01_is_private" {
  description = "Whether the load balancer has a VCN-local (private) IP address."
  default     = true
  type        = bool
}

variable "loadbalancer01_lb_nsg_name" {
  description = "Display Name of an optional Network Security Group"
  default     = ""
}

variable "loadbalancer01_lbaas_instance_compartment_name" {
  description = "Defines the compartment name where the infrastructure will be created"
}

variable "loadbalancer01_lbaas_network_compartment_name" {
  description = "Defines the compartment where the Network is currently located"
}

variable "loadbalancer01_is_reserved_ip" {
  description = "Boolean that determines if reserved ip should be used"
  default     = false
  type        = bool
}

variable "loadbalancer01_reserved_ip_id" {
  description = "Resereved ip address OCID"
  default     = ""
}

variable "loadbalancer01_lbaas_shape_max_bw_mbps" {
  description = "Bandwidth in Mbps that determines the maximum bandwidth (ingress plus egress) that the load balancer can achieve. This bandwidth cannot always guaranteed. For a guaranteed bandwidth use the minimumBandwidthInMbps parameter. The values must be between minimumBandwidthInMbps and the highest limit available in multiples of 10. The highest limit available is defined in Service Limits. Example: 1500"
  default     = "10"
}

variable "loadbalancer01_lbaas_shape_min_bw_mbps" {
  description = "Bandwidth in Mbps that determines the total pre-provisioned bandwidth (ingress plus egress). The values must be between 0 and the maximumBandwidthInMbps in multiples of 10. The current allowed maximum value is defined in Service Limits. Example: 150"
  default     = "10"
}

variable "loadbalancer01_is_preserve_source_destination" {
  description = "This optional parameter can be enabled only if backends are compute OCIDs. When enabled, the skipSourceDestinationCheck parameter is automatically enabled on the load balancer VNIC, and packets are sent to the backend with the entire IP header intact."
  default     = false
  type        = bool
}

variable "loadbalancer01_is_app_lbaas" {
  description = "Determines whether load balancer is an application load balancer, setting this to false will generate a network load balancer"
  default     = true
  type        = bool
}

/********** loadbalancer01 LBaaS Variables **********/

/********** loadbalancer01 Datasource and Subnet Lookup related variables **********/

variable "loadbalancer01_network_subnet_name" {
  description = "Defines the specific Subnet to be used for this resource"
}

variable "loadbalancer01_vcn_display_name" {
  description = "VCN Display name to execute lookup"
}

/********** loadbalancer01 Datasource related variables **********/

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