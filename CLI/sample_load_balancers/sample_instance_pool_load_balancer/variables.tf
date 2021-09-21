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
  description = "User OCID in tenancy."
}

variable "fingerprint" {
  description = "API Key Fingerprint for user_ocid derived from public API Key imported in OCI User config"
}

variable "private_key_path" {
  description = "Private Key Absolute path location where terraform is executed"

}
/********** Provider Variables NOT OVERLOADABLE **********/

/********** instancepool01 Variables **********/

variable "instancepool01_vcn_display_name" {
  description = "Name of the VCN where artifact is associated with"
}


variable "instancepool01_pool_size" {
  description = "Amount of instances to create"
}

variable "instancepool01_compute_display_name_base" {
  description = "Defines the compute and hostname Label for created compute"
}

variable "instancepool01_instance_config_shape" {
  description = "Defines the shape to be used on compute creation"
}

variable "instancepool01_primary_vnic_display_name" {
  description = "Defines the Primary VNIC Display Name"
  default     = "primaryvnic"
}

variable "instancepool01_assign_public_ip_flag" {
  description = "Defines either machine will have or not a Public IP assigned. All Pvt networks this variable must be false"
  default     = false
  type        = bool
}

variable "instancepool01_base_compute_image_ocid" {
  description = "Defines the OCID for the OS image to be used on artifact creation. Extract OCID from: https://docs.cloud.oracle.com/iaas/images/ or designated custom image OCID created by packer"
}

variable "instancepool01_private_ip" {
  description = "Describes the private IP required for machine"
  default     = null
}

variable "instancepool01_bkp_policy_boot_volume" {
  description = "Describes the backup policy attached to the boot volume"
  default     = "gold"
}


variable "instancepool01_is_compute_in_hub_dmz01" {
  description = "Defines if the compute is going to be created in Hub DMZ01 Subnet"
  default     = false
  type        = bool
}

variable "instancepool01_is_compute_in_hub_svc01" {
  description = "Defines if the compute is going to be created in the Hub SharedSvc01 Subnet"
  default     = false
  type        = bool
}

variable "instancepool01_linux_compute_instance_compartment_name" {
  description = "Defines the compartment name where the infrastructure will be created"
  default     = ""
}

variable "instancepool01_linux_compute_instance_compartment_id" {
  description = "Defines the compartment OCID where the infrastructure will be created"
  default     = ""
}

variable "instancepool01_linux_compute_network_compartment_name" {
  description = "Defines the compartment where the Network is currently located"
}

variable "instancepool01_launch_mode" {
  description = "Launch mode in which the image will be executed"
  default     = "NATIVE"

}

variable "instancepool01_instance_configuration_display_name" {
  description = "Display name for instance configuration"
}

variable "instancepool01_instance_display_name_base" {
  description = "Instance base display name"
}

variable "instancepool01_maintainance_action" {
  description = "Instance maintainence action"
  default     = "LIVE_MIGRATE"
}

variable "instancepool01_instance_shape_config_memory_in_gbs" {
  description = "Memory assigned to computes in pool"
  default     = ""
}

variable "instancepool01_instance_shape_config_ocpus" {
  description = "OCPU assigned computes in pool"
  default     = ""
}

variable "instancepool01_is_flex_shape" {
  description = "Boolean that describes if the shape is flex or not"
  default     = false
  type        = bool
}

variable "instancepool01_is_load_balancer_required" {
  description = "Boolean that determines if load balancer attachment is required or not"
  default     = false
  type        = bool
}

variable "instancepool01_fault_domain_list" {
  description = "Fault Domain List"
  type        = list(any)
  default     = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3"]

}

variable "instancepool01_network_type" {
  description = "Network type"
  default     = "PARAVIRTUALIZED"
}

variable "instancepool01_compute_availability_domain_map" {
  type        = map(any)
  description = "The name of the availability domain in which this node is placed"
}

/********** instancepool01 Variables **********/

/********** instancepool01 AutoScaling Config Variables **********/

variable "instancepool01_autoscaling_config_display_name" {
  description = "Configuration name for Autoscaling"
}

variable "instancepool01_is_autoscaling_enabled" {
  description = "Describes if autoscaling is enabled or not for this pool"
  default     = false
  type        = bool
}

variable "instancepool01_autoscaling_cooldown" {
  description = "Sets the cooldown between autoscaling operations"
  default     = 300
}

variable "instancepool01_schedule_is_scalein_enabled" {
  description = "Describes if scalein is enabled or not for this pool"
  default     = false
  type        = bool
}

variable "instancepool01_schedule_is_scaleout_enabled" {
  description = "Describes if scaleout is enabled or not for this pool"
  default     = false
  type        = bool
}

variable "instancepool01_schedule_scaleout_instance_number" {
  description = "Describes the number for instances during scale out for this pool"
  default     = ""
}

variable "instancepool01_autoscaling_is_schedule" {
  description = "Boolean that desribe if autoscaling is schedule based or not"
  default     = false
  type        = bool
}

variable "instancepool01_schedule_scalein_time_window" {
  description = "Describes time window scaling in UTC and cron format"
  default     = ""
}

variable "instancepool01_schedule_scaleout_time_window" {
  description = "Describes time window scaling out UTC and cron format"
  default     = ""
}

variable "instancepool01_max_autoscale_instance_number" {
  description = "Maximum number of instance that can be scaled to when using threshold scaling configurations"
  default     = ""
}

variable "instancepool01_min_autoscale_instance_number" {
  description = "Minimum number of instance that can be scaled to when using threshold scaling configurations"
  default     = ""
}

variable "instancepool01_autoscaling_is_cpu" {
  description = "Boolean that desribe if autoscaling is cpu based or not"
  default     = false
  type        = bool
}

variable "instancepool01_autoscaling_is_memory" {
  description = "Boolean that desribe if autoscaling is memory based or not"
  default     = false
  type        = bool
}

variable "instancepool01_threshold_scale_out" {
  description = "Threshold of CPU or memory utilization to cause a scale out"
  default     = ""
}

variable "instancepool01_threshold_scale_in" {
  description = "Threshold of CPU or memory utilization to cause a scale in"
  default     = ""
}

variable "instancepool01_scaleout_step" {
  description = "Number of instances to scale by in threshold confiogurations"
  default     = ""
}

variable "instancepool01_scalein_step" {
  description = "Number of instances to scale by in threshold confiogurations"
  default     = ""
}

/********** instancepool01 AutoScaling Config Variables **********/

/********** instancepool01 Datasource and Subnet Lookup related variables **********/

variable "instancepool01_network_subnet_name" {
  description = "Defines the specific Subnet to be used for this resource"
}
/********** instancepool01 Datasource related variables **********/

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