# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# main.tf
#
# Purpose: Defines all the components related to environment


module "compute01" {
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-linux-compute?ref=v1.0.2"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  ssh_public_key                          = var.compute01_ssh_public_key
  ssh_private_key                         = var.compute01_ssh_private_key
  ssh_public_is_path                      = var.compute01_ssh_public_is_path
  ssh_private_is_path                     = var.compute01_ssh_private_is_path
  compute_availability_domain_list        = var.compute01_compute_availability_domain_list
  network_subnet_name                     = var.compute01_network_subnet_name
  assign_public_ip_flag                   = var.compute01_assign_public_ip_flag
  fault_domain_name                       = var.compute01_fault_domain_name
  bkp_policy_boot_volume                  = var.compute01_bkp_policy_boot_volume
  linux_compute_instance_compartment_name = var.compute01_linux_compute_instance_compartment_name
  linux_compute_network_compartment_name  = var.compute01_linux_compute_network_compartment_name
  vcn_display_name                        = var.compute01_vcn_display_name
  num_instances                           = var.compute01_num_instances
  is_nsg_required                         = var.compute01_is_nsg_required
  compute_nsg_name                        = var.compute01_compute_nsg_name
  compute_display_name_base               = var.compute01_compute_display_name_base
  instance_image_ocid                     = var.compute01_instance_image_ocid
  instance_shape                          = var.compute01_instance_shape
  is_flex_shape                           = var.compute01_is_flex_shape
  instance_shape_config_ocpus             = var.compute01_instance_shape_config_ocpus
  instance_shape_config_memory_in_gbs     = var.compute01_instance_shape_config_memory_in_gbs
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}


module "bastion_service01" {
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-bastionservice?ref=v1.0.0"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  bastion_service_instance_compartment_name = var.bastion_service01_bastion_service_instance_compartment_name
  bastion_service_network_compartment_name  = var.bastion_service01_bastion_service_network_compartment_name
  private_network_subnet_name               = var.bastion_service01_private_network_subnet_name
  vcn_display_name                          = var.bastion_service01_vcn_display_name
  bastion_service_name                      = var.bastion_service01_bastion_service_name
  allowed_client_cidr                       = var.bastion_service01_allowed_client_cidr
  bastion_max_session_ttl_in_seconds        = var.bastion_service01_bastion_max_session_ttl_in_seconds
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}


module "bastion_session01" {
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-bastionservice-sessions?ref=v1.0.0"
  count = length(var.bastion_session01_bastion_session_compute_list)
  depends_on = [
    module.bastion_service01,
    module.compute01
  ]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  ssh_public_key                            = var.bastion_session01_ssh_public_key
  bastion_service_name                      = var.bastion_session01_bastion_service_name
  bastion_service_instance_compartment_name = var.bastion_session01_bastion_service_instance_compartment_name

  bastion_session_compute_list = [{
    "displayname" = var.bastion_session01_bastion_session_compute_list[count.index]["displayname"]
    "id" = module.compute01.instance[count.index].id
    "type" = var.bastion_session01_bastion_session_compute_list[count.index]["type"]
    "username" = try(var.bastion_session01_bastion_session_compute_list[count.index]["username"], null)
    "port" = try(var.bastion_session01_bastion_session_compute_list[count.index]["port"], null)
    "ttl" = var.bastion_session01_bastion_session_compute_list[count.index]["ttl"]
  }]
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}
