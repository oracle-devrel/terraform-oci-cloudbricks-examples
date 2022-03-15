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

/********** Brick Variables **********/

/********** OKE Cluster Variables **********/
variable "oke01_k8s_version" {
  description = "Declares K8 Version"
}

variable "oke01_cluster_name" {
  description = "Defines the K8 Cluster Name"
}

variable "oke01_k8s_dashboard_enabled" {
  description = "Defines if Kubernetes Dashboard is enabled for cluster"
  default     = false
}

variable "oke01_k8s_tiller_enabled" {
  description = "Defines if Helm (Tiller) is enabled in cluster"
  default     = false

}

variable "oke01_availability_domain_map" {
  type        = map(any)
  description = "The name of the availability domain in which this node is placed"
}

variable "oke01_vcn_display_name" {
  description = "Defines the display name of the VCN where cluster will allocate LBaaS Ingress Controller components"

}

variable "oke01_lbaas_network_subnet_name" {
  description = "Describes the display name of the subnet where LBaaS Components will be alocated by resource orchestrator"
}

variable "oke01_endpoint_is_public_ip_enabled" {
  description = "Determines if OKE Control Plane is located on public or private subnet"

}
variable "oke01_endpoint_subnet_name" {
  description = "Determines the subnet where the control plane API will be located at"
  # default     = ""

}

/********** OKE Cluster Variables **********/

/********** OKE Cluster Datasource and Subnet Lookup related variables **********/
variable "oke01_instance_compartment_name" {
  description = "Defines the compartment name where the infrastructure will be created"
  default     = ""
}
variable "oke01_instance_compartment_id" {
  description = "Defines the compartment OCID where the infrastructure will be created"
  default     = ""
}

variable "oke01_network_compartment_name" {
  description = "Defines the compartment where the Network is currently located"
}
/********** OKE Cluster Datasource and Subnet Lookup related variables **********/

/********** Brick Variables **********/

