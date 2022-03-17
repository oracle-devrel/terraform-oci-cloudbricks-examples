# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# variables.tf 
#
# Purpose: The following file declares all variables used in this backend repository


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

/********** Instance Pool Variables **********/
variable "instancepool01_vcn_display_name" {
  description = "Name of the VCN where artifact is associated with"
}


variable "instancepool01_pool_size" {
  description = "Amount of instances to create"
}

variable "instancepool01_label_zs" {
  type    = list(any)
  default = ["0", ""]
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

/********** Instance Pool Variables **********/



/********** AutoScaling Config Variables **********/
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
  default = 300
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


/********** AutoScaling Config Variables **********/

/********** Datasource and Subnet Lookup related variables **********/

variable "instancepool01_network_subnet_name" {
  description = "Defines the specific Subnet to be used for this resource"
}
/********** Datasource related variables **********/

/*********** LBaaS related variables ***************/
variable "instancepool01_lbaas_bes_name" {
  description = "LBaaS Back end set name"
  default     = ""
}

variable "instancepool01_load_balancer_ocid" {
  description = "LBaaS OCID"
  default     = ""
}

variable "instancepool01_lbaas_bes_checkport" {
  description = "Port where BES Healthcheck and where Load balancer listener is configured"
  default     = ""
}

/*********** LBaaS related variables ***************/

/********** Brick Variables **********/