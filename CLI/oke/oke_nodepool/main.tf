# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# main.tf
#
# Purpose: Defines all the components related to environment

module "node01" {
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-oke-nodepool.git?ref=v1.0.2"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  ssh_public_key                      = var.node01_ssh_public_key
  ssh_private_key                     = var.node01_ssh_private_key
  ssh_public_is_path                  = var.node01_ssh_public_is_path
  ssh_private_is_path                 = var.node01_ssh_private_is_path
  oke_cluster_compartment_name        = var.node01_oke_cluster_compartment_name
  oke_network_compartment_name        = var.node01_oke_network_compartment_name
  oke_availability_domain_map         = var.node01_oke_availability_domain_map
  oke_cluster_name                    = var.node01_oke_cluster_name
  oke_nodepool_network_subnet_name    = var.node01_oke_nodepool_network_subnet_name
  k8s_version                         = var.node01_k8s_version
  node_pool_name                      = var.node01_node_pool_name
  node_pool_shape                     = var.node01_node_pool_shape
  is_flex_shape                       = var.node01_is_flex_shape
  nodepool_shape_config_ocpus         = var.node01_nodepool_shape_config_ocpus
  nodepool_shape_config_memory_in_gbs = var.node01_nodepool_shape_config_memory_in_gbs
  number_of_nodes                     = var.node01_number_of_nodes
  k8s_label_map                       = var.node01_k8s_label_map
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}