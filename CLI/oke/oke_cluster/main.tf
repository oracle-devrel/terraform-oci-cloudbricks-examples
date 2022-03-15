# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# main.tf
#
# Purpose: Defines all the components related to environment


module "oke01" {
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-oke-cluster.git?ref=v1.0.2"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid       = var.tenancy_ocid
  region             = var.region
  user_ocid          = var.user_ocid
  fingerprint        = var.fingerprint
  private_key_path   = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  oke_instance_compartment_name         = var.oke01_instance_compartment_name
  oke_network_compartment_name          = var.oke01_network_compartment_name
  oke_vcn_display_name                  = var.oke01_vcn_display_name
  oke_lbaas_network_subnet_name         = var.oke01_lbaas_network_subnet_name
  oke_endpoint_subnet_name              = var.oke01_endpoint_subnet_name
  oke_availability_domain_map           = var.oke01_availability_domain_map
  cluster_name                          = var.oke01_cluster_name
  k8s_version                           = var.oke01_k8s_version
  k8s_dashboard_enabled                 = var.oke01_k8s_dashboard_enabled
  k8s_tiller_enabled                    = var.oke01_k8s_tiller_enabled
  oke_endpoint_is_public_ip_enabled     = var.oke01_endpoint_is_public_ip_enabled
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}
