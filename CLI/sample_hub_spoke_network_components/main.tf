# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# main.tf
#
# Purpose: Defines all the components related to environment

module "hub01network" {
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-network-artifacts.git?ref=v1.0.1"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  vcn_network_compartment_name        = var.hub01network_vcn_network_compartment_name
  vcn_cidr_blocks                     = var.hub01network_vcn_cidr_blocks
  private_subnet_cidr_block_map       = var.hub01network_private_subnet_cidr_block_map
  public_subnet_cidr_block_map        = var.hub01network_public_subnet_cidr_block_map
  vcn_display_name                    = var.hub01network_vcn_display_name
  dhcp_options_display_name           = var.hub01network_dhcp_options_display_name
  custom_search_domain                = var.hub01network_custom_search_domain
  private_route_table_display_name    = var.hub01network_private_route_table_display_name
  public_route_table_display_name     = var.hub01network_public_route_table_display_name
  private_security_list_display_name  = var.hub01network_private_security_list_display_name
  public_security_list_display_name   = var.hub01network_public_security_list_display_name
  service_gateway_display_name        = var.hub01network_service_gateway_display_name
  nat_gateway_display_name            = var.hub01network_nat_gateway_display_name
  internet_gateway_display_name       = var.hub01network_internet_gateway_display_name
  lpg_count                           = var.hub01network_lpg_count
  lpg_display_name_base               = var.hub01network_lpg_display_name_base
  peered_vcn_network_compartment_name = var.hub01network_peered_vcn_network_compartment_name
  peered_lpg_display_name             = var.hub01network_peered_lpg_display_name
  is_spoke                            = var.hub01network_is_spoke
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}

module "spoke01network" {
  depends_on = [module.hub01network]
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-network-artifacts.git?ref=v1.0.1"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  vcn_network_compartment_name        = var.spoke01network_vcn_network_compartment_name
  vcn_cidr_blocks                     = var.spoke01network_vcn_cidr_blocks
  private_subnet_cidr_block_map       = var.spoke01network_private_subnet_cidr_block_map
  public_subnet_cidr_block_map        = var.spoke01network_public_subnet_cidr_block_map
  vcn_display_name                    = var.spoke01network_vcn_display_name
  dhcp_options_display_name           = var.spoke01network_dhcp_options_display_name
  custom_search_domain                = var.spoke01network_custom_search_domain
  private_route_table_display_name    = var.spoke01network_private_route_table_display_name
  public_route_table_display_name     = var.spoke01network_public_route_table_display_name
  private_security_list_display_name  = var.spoke01network_private_security_list_display_name
  public_security_list_display_name   = var.spoke01network_public_security_list_display_name
  service_gateway_display_name        = var.spoke01network_service_gateway_display_name
  nat_gateway_display_name            = var.spoke01network_nat_gateway_display_name
  internet_gateway_display_name       = var.spoke01network_internet_gateway_display_name
  lpg_count                           = var.spoke01network_lpg_count
  lpg_display_name_base               = var.spoke01network_lpg_display_name_base
  peered_vcn_display_name             = module.hub01network.vcn.display_name
  peered_vcn_network_compartment_name = var.spoke01network_peered_vcn_network_compartment_name
  peered_lpg_display_name             = var.spoke01network_peered_lpg_display_name
  is_spoke                            = var.spoke01network_is_spoke
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}


module "spoke02network" {
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-network-artifacts.git?ref=v1.0.1"
  depends_on = [module.hub01network]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  vcn_network_compartment_name        = var.spoke02network_vcn_network_compartment_name
  vcn_cidr_blocks                     = var.spoke02network_vcn_cidr_blocks
  private_subnet_cidr_block_map       = var.spoke02network_private_subnet_cidr_block_map
  public_subnet_cidr_block_map        = var.spoke02network_public_subnet_cidr_block_map
  vcn_display_name                    = var.spoke02network_vcn_display_name
  dhcp_options_display_name           = var.spoke02network_dhcp_options_display_name
  custom_search_domain                = var.spoke02network_custom_search_domain
  private_route_table_display_name    = var.spoke02network_private_route_table_display_name
  public_route_table_display_name     = var.spoke02network_public_route_table_display_name
  private_security_list_display_name  = var.spoke02network_private_security_list_display_name
  public_security_list_display_name   = var.spoke02network_public_security_list_display_name
  service_gateway_display_name        = var.spoke02network_service_gateway_display_name
  nat_gateway_display_name            = var.spoke02network_nat_gateway_display_name
  internet_gateway_display_name       = var.spoke02network_internet_gateway_display_name
  lpg_count                           = var.spoke02network_lpg_count
  lpg_display_name_base               = var.spoke02network_lpg_display_name_base
  peered_vcn_display_name             = module.hub01network.vcn.display_name
  peered_vcn_network_compartment_name = var.spoke02network_peered_vcn_network_compartment_name
  peered_lpg_display_name             = var.spoke02network_peered_lpg_display_name
  is_spoke                            = var.spoke02network_is_spoke
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}

module "lpg_route_pvt_hub_to_spoke01" {
  depends_on = [
    module.hub01network,
    module.spoke01network
  ]
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git?ref=v1.0.1"

  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  from_network_compartment_name = var.hub01network_vcn_network_compartment_name
  from_vcn_display_name         = var.hub01network_vcn_display_name
  from_route_table_display_name = var.hub01network_private_route_table_display_name
  from_lpg_display_name         = module.hub01network.local_peering_gateways[0].display_name

  to_vcn_display_name         = var.spoke01network_vcn_display_name
  to_network_compartment_name = var.spoke01network_vcn_network_compartment_name
  to_lpg_display_name         = module.spoke01network.local_peering_gateways[0].display_name
  to_route_table_display_name = var.spoke01network_private_route_table_display_name
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}

module "lpg_route_pub_hub_to_spoke01" {
  depends_on = [
    module.hub01network,
    module.spoke01network
  ]
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git?ref=v1.0.1"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  from_network_compartment_name = var.hub01network_vcn_network_compartment_name
  from_vcn_display_name         = var.hub01network_vcn_display_name
  from_route_table_display_name = var.hub01network_public_route_table_display_name
  from_lpg_display_name         = module.hub01network.local_peering_gateways[0].display_name

  to_vcn_display_name         = var.spoke01network_vcn_display_name
  to_network_compartment_name = var.spoke01network_vcn_network_compartment_name
  to_lpg_display_name         = module.spoke01network.local_peering_gateways[0].display_name
  to_route_table_display_name = var.spoke01network_public_route_table_display_name
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}


module "lpg_route_pvt_hub_to_spoke02" {
  depends_on = [
    module.hub01network,
    module.spoke02network
  ]
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git?ref=v1.0.1"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  from_network_compartment_name = var.hub01network_vcn_network_compartment_name
  from_vcn_display_name         = var.hub01network_vcn_display_name
  from_route_table_display_name = var.hub01network_private_route_table_display_name
  from_lpg_display_name         = module.hub01network.local_peering_gateways[1].display_name

  to_vcn_display_name         = var.spoke02network_vcn_display_name
  to_network_compartment_name = var.spoke02network_vcn_network_compartment_name
  to_lpg_display_name         = module.spoke02network.local_peering_gateways[0].display_name
  to_route_table_display_name = var.spoke02network_private_route_table_display_name
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}

module "lpg_route_pub_hub_to_spoke02" {
  depends_on = [
    module.hub01network,
    module.spoke02network
  ]
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git?ref=v1.0.1"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  from_network_compartment_name = var.hub01network_vcn_network_compartment_name
  from_vcn_display_name         = var.hub01network_vcn_display_name
  from_route_table_display_name = var.hub01network_public_route_table_display_name
  from_lpg_display_name         = module.hub01network.local_peering_gateways[1].display_name

  to_vcn_display_name         = var.spoke02network_vcn_display_name
  to_network_compartment_name = var.spoke02network_vcn_network_compartment_name
  to_lpg_display_name         = module.spoke02network.local_peering_gateways[0].display_name
  to_route_table_display_name = var.spoke02network_public_route_table_display_name
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}

