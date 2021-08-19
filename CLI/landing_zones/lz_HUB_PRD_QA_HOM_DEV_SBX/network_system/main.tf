# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# main.tf
#
# Purpose: Defines all the components related to environment

module "hub01_network" {
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-network-artifacts.git?ref=v1.0.1"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  vcn_network_compartment_name        = var.hub01_network_vcn_network_compartment_name
  vcn_cidr_blocks                     = var.hub01_network_vcn_cidr_blocks
  private_subnet_cidr_block_map       = var.hub01_network_private_subnet_cidr_block_map
  public_subnet_cidr_block_map        = var.hub01_network_public_subnet_cidr_block_map
  vcn_display_name                    = var.hub01_network_vcn_display_name
  dhcp_options_display_name           = var.hub01_network_dhcp_options_display_name
  custom_search_domain                = var.hub01_network_custom_search_domain
  private_route_table_display_name    = var.hub01_network_private_route_table_display_name
  public_route_table_display_name     = var.hub01_network_public_route_table_display_name
  private_security_list_display_name  = var.hub01_network_private_security_list_display_name
  public_security_list_display_name   = var.hub01_network_public_security_list_display_name
  service_gateway_display_name        = var.hub01_network_service_gateway_display_name
  nat_gateway_display_name            = var.hub01_network_nat_gateway_display_name
  internet_gateway_display_name       = var.hub01_network_internet_gateway_display_name
  lpg_count                           = var.hub01_network_lpg_count
  lpg_display_name_base               = var.hub01_network_lpg_display_name_base
  peered_vcn_network_compartment_name = var.hub01_network_peered_vcn_network_compartment_name
  peered_lpg_display_name             = var.hub01_network_peered_lpg_display_name
  is_spoke                            = var.hub01_network_is_spoke
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}

module "prd01_network" {
  depends_on = [module.hub01_network]
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-network-artifacts.git?ref=v1.0.1"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  vcn_network_compartment_name        = var.prd01_network_vcn_network_compartment_name
  vcn_cidr_blocks                     = var.prd01_network_vcn_cidr_blocks
  private_subnet_cidr_block_map       = var.prd01_network_private_subnet_cidr_block_map
  public_subnet_cidr_block_map        = var.prd01_network_public_subnet_cidr_block_map
  vcn_display_name                    = var.prd01_network_vcn_display_name
  dhcp_options_display_name           = var.prd01_network_dhcp_options_display_name
  custom_search_domain                = var.prd01_network_custom_search_domain
  private_route_table_display_name    = var.prd01_network_private_route_table_display_name
  public_route_table_display_name     = var.prd01_network_public_route_table_display_name
  private_security_list_display_name  = var.prd01_network_private_security_list_display_name
  public_security_list_display_name   = var.prd01_network_public_security_list_display_name
  service_gateway_display_name        = var.prd01_network_service_gateway_display_name
  nat_gateway_display_name            = var.prd01_network_nat_gateway_display_name
  internet_gateway_display_name       = var.prd01_network_internet_gateway_display_name
  lpg_count                           = var.prd01_network_lpg_count
  lpg_display_name_base               = var.prd01_network_lpg_display_name_base
  peered_vcn_display_name             = module.hub01_network.vcn.display_name
  peered_vcn_network_compartment_name = var.prd01_network_peered_vcn_network_compartment_name
  peered_lpg_display_name             = var.prd01_network_peered_lpg_display_name
  is_spoke                            = var.prd01_network_is_spoke
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}

module "qa01_network" {
  depends_on = [module.hub01_network]
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-network-artifacts.git?ref=v1.0.1"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  vcn_network_compartment_name        = var.qa01_network_vcn_network_compartment_name
  vcn_cidr_blocks                     = var.qa01_network_vcn_cidr_blocks
  private_subnet_cidr_block_map       = var.qa01_network_private_subnet_cidr_block_map
  public_subnet_cidr_block_map        = var.qa01_network_public_subnet_cidr_block_map
  vcn_display_name                    = var.qa01_network_vcn_display_name
  dhcp_options_display_name           = var.qa01_network_dhcp_options_display_name
  custom_search_domain                = var.qa01_network_custom_search_domain
  private_route_table_display_name    = var.qa01_network_private_route_table_display_name
  public_route_table_display_name     = var.qa01_network_public_route_table_display_name
  private_security_list_display_name  = var.qa01_network_private_security_list_display_name
  public_security_list_display_name   = var.qa01_network_public_security_list_display_name
  service_gateway_display_name        = var.qa01_network_service_gateway_display_name
  nat_gateway_display_name            = var.qa01_network_nat_gateway_display_name
  internet_gateway_display_name       = var.qa01_network_internet_gateway_display_name
  lpg_count                           = var.qa01_network_lpg_count
  lpg_display_name_base               = var.qa01_network_lpg_display_name_base
  peered_vcn_display_name             = module.hub01_network.vcn.display_name
  peered_vcn_network_compartment_name = var.qa01_network_peered_vcn_network_compartment_name
  peered_lpg_display_name             = var.qa01_network_peered_lpg_display_name
  is_spoke                            = var.qa01_network_is_spoke
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}

module "dev01_network" {
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-network-artifacts.git?ref=v1.0.1"
  depends_on = [module.hub01_network]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  vcn_network_compartment_name        = var.dev01_network_vcn_network_compartment_name
  vcn_cidr_blocks                     = var.dev01_network_vcn_cidr_blocks
  private_subnet_cidr_block_map       = var.dev01_network_private_subnet_cidr_block_map
  public_subnet_cidr_block_map        = var.dev01_network_public_subnet_cidr_block_map
  vcn_display_name                    = var.dev01_network_vcn_display_name
  dhcp_options_display_name           = var.dev01_network_dhcp_options_display_name
  custom_search_domain                = var.dev01_network_custom_search_domain
  private_route_table_display_name    = var.dev01_network_private_route_table_display_name
  public_route_table_display_name     = var.dev01_network_public_route_table_display_name
  private_security_list_display_name  = var.dev01_network_private_security_list_display_name
  public_security_list_display_name   = var.dev01_network_public_security_list_display_name
  service_gateway_display_name        = var.dev01_network_service_gateway_display_name
  nat_gateway_display_name            = var.dev01_network_nat_gateway_display_name
  internet_gateway_display_name       = var.dev01_network_internet_gateway_display_name
  lpg_count                           = var.dev01_network_lpg_count
  lpg_display_name_base               = var.dev01_network_lpg_display_name_base
  peered_vcn_display_name             = module.hub01_network.vcn.display_name
  peered_vcn_network_compartment_name = var.dev01_network_peered_vcn_network_compartment_name
  peered_lpg_display_name             = var.dev01_network_peered_lpg_display_name
  is_spoke                            = var.dev01_network_is_spoke
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}

module "hom01_network" {
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-network-artifacts.git?ref=v1.0.1"
  depends_on = [module.hub01_network]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  vcn_network_compartment_name        = var.hom01_network_vcn_network_compartment_name
  vcn_cidr_blocks                     = var.hom01_network_vcn_cidr_blocks
  private_subnet_cidr_block_map       = var.hom01_network_private_subnet_cidr_block_map
  public_subnet_cidr_block_map        = var.hom01_network_public_subnet_cidr_block_map
  vcn_display_name                    = var.hom01_network_vcn_display_name
  dhcp_options_display_name           = var.hom01_network_dhcp_options_display_name
  custom_search_domain                = var.hom01_network_custom_search_domain
  private_route_table_display_name    = var.hom01_network_private_route_table_display_name
  public_route_table_display_name     = var.hom01_network_public_route_table_display_name
  private_security_list_display_name  = var.hom01_network_private_security_list_display_name
  public_security_list_display_name   = var.hom01_network_public_security_list_display_name
  service_gateway_display_name        = var.hom01_network_service_gateway_display_name
  nat_gateway_display_name            = var.hom01_network_nat_gateway_display_name
  internet_gateway_display_name       = var.hom01_network_internet_gateway_display_name
  lpg_count                           = var.hom01_network_lpg_count
  lpg_display_name_base               = var.hom01_network_lpg_display_name_base
  peered_vcn_display_name             = module.hub01_network.vcn.display_name
  peered_vcn_network_compartment_name = var.hom01_network_peered_vcn_network_compartment_name
  peered_lpg_display_name             = var.hom01_network_peered_lpg_display_name
  is_spoke                            = var.hom01_network_is_spoke
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}

module "sbx01_network" {
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-network-artifacts.git?ref=v1.0.1"
  depends_on = [module.hub01_network]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  vcn_network_compartment_name        = var.sbx01_network_vcn_network_compartment_name
  vcn_cidr_blocks                     = var.sbx01_network_vcn_cidr_blocks
  private_subnet_cidr_block_map       = var.sbx01_network_private_subnet_cidr_block_map
  public_subnet_cidr_block_map        = var.sbx01_network_public_subnet_cidr_block_map
  vcn_display_name                    = var.sbx01_network_vcn_display_name
  dhcp_options_display_name           = var.sbx01_network_dhcp_options_display_name
  custom_search_domain                = var.sbx01_network_custom_search_domain
  private_route_table_display_name    = var.sbx01_network_private_route_table_display_name
  public_route_table_display_name     = var.sbx01_network_public_route_table_display_name
  private_security_list_display_name  = var.sbx01_network_private_security_list_display_name
  public_security_list_display_name   = var.sbx01_network_public_security_list_display_name
  service_gateway_display_name        = var.sbx01_network_service_gateway_display_name
  nat_gateway_display_name            = var.sbx01_network_nat_gateway_display_name
  internet_gateway_display_name       = var.sbx01_network_internet_gateway_display_name
  lpg_count                           = var.sbx01_network_lpg_count
  lpg_display_name_base               = var.sbx01_network_lpg_display_name_base
  peered_vcn_display_name             = module.hub01_network.vcn.display_name
  peered_vcn_network_compartment_name = var.sbx01_network_peered_vcn_network_compartment_name
  peered_lpg_display_name             = var.sbx01_network_peered_lpg_display_name
  is_spoke                            = var.sbx01_network_is_spoke
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}

module "lpg_route_pvt_hub_to_prd01" {
  depends_on = [
    module.hub01_network,
    module.prd01_network
  ]
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git?ref=v1.0.2"

  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  from_network_compartment_name = var.hub01_network_vcn_network_compartment_name
  from_vcn_display_name         = var.hub01_network_vcn_display_name
  from_route_table_display_name = var.hub01_network_private_route_table_display_name
  from_lpg_display_name         = module.hub01_network.local_peering_gateways[0].display_name

  to_vcn_display_name         = var.prd01_network_vcn_display_name
  to_network_compartment_name = var.prd01_network_vcn_network_compartment_name
  to_lpg_display_name         = module.prd01_network.local_peering_gateways[0].display_name
  to_route_table_display_name = var.prd01_network_private_route_table_display_name
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}

module "lpg_route_pub_hub_to_prd01" {
  depends_on = [
    module.hub01_network,
    module.prd01_network
  ]
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git?ref=v1.0.2"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  from_network_compartment_name = var.hub01_network_vcn_network_compartment_name
  from_vcn_display_name         = var.hub01_network_vcn_display_name
  from_route_table_display_name = var.hub01_network_public_route_table_display_name
  from_lpg_display_name         = module.hub01_network.local_peering_gateways[0].display_name

  to_vcn_display_name         = var.prd01_network_vcn_display_name
  to_network_compartment_name = var.prd01_network_vcn_network_compartment_name
  to_lpg_display_name         = module.prd01_network.local_peering_gateways[0].display_name
  to_route_table_display_name = var.prd01_network_public_route_table_display_name
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}

module "lpg_route_pvt_hub_to_qa01" {
  depends_on = [
    module.hub01_network,
    module.qa01_network
  ]
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git?ref=v1.0.2"

  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  from_network_compartment_name = var.hub01_network_vcn_network_compartment_name
  from_vcn_display_name         = var.hub01_network_vcn_display_name
  from_route_table_display_name = var.hub01_network_private_route_table_display_name
  from_lpg_display_name         = module.hub01_network.local_peering_gateways[1].display_name

  to_vcn_display_name         = var.qa01_network_vcn_display_name
  to_network_compartment_name = var.qa01_network_vcn_network_compartment_name
  to_lpg_display_name         = module.qa01_network.local_peering_gateways[0].display_name
  to_route_table_display_name = var.qa01_network_private_route_table_display_name
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}

module "lpg_route_pub_hub_to_qa01" {
  depends_on = [
    module.hub01_network,
    module.qa01_network
  ]
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git?ref=v1.0.2"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  from_network_compartment_name = var.hub01_network_vcn_network_compartment_name
  from_vcn_display_name         = var.hub01_network_vcn_display_name
  from_route_table_display_name = var.hub01_network_public_route_table_display_name
  from_lpg_display_name         = module.hub01_network.local_peering_gateways[1].display_name

  to_vcn_display_name         = var.qa01_network_vcn_display_name
  to_network_compartment_name = var.qa01_network_vcn_network_compartment_name
  to_lpg_display_name         = module.qa01_network.local_peering_gateways[0].display_name
  to_route_table_display_name = var.qa01_network_public_route_table_display_name
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}

module "lpg_route_pvt_hub_to_hom01" {
  depends_on = [
    module.hub01_network,
    module.hom01_network
  ]
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git?ref=v1.0.2"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  from_network_compartment_name = var.hub01_network_vcn_network_compartment_name
  from_vcn_display_name         = var.hub01_network_vcn_display_name
  from_route_table_display_name = var.hub01_network_private_route_table_display_name
  from_lpg_display_name         = module.hub01_network.local_peering_gateways[2].display_name

  to_vcn_display_name         = var.hom01_network_vcn_display_name
  to_network_compartment_name = var.hom01_network_vcn_network_compartment_name
  to_lpg_display_name         = module.hom01_network.local_peering_gateways[0].display_name
  to_route_table_display_name = var.hom01_network_private_route_table_display_name
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}

module "lpg_route_pub_hub_to_hom01" {
  depends_on = [
    module.hub01_network,
    module.hom01_network
  ]
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git?ref=v1.0.2"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  from_network_compartment_name = var.hub01_network_vcn_network_compartment_name
  from_vcn_display_name         = var.hub01_network_vcn_display_name
  from_route_table_display_name = var.hub01_network_public_route_table_display_name
  from_lpg_display_name         = module.hub01_network.local_peering_gateways[2].display_name

  to_vcn_display_name         = var.hom01_network_vcn_display_name
  to_network_compartment_name = var.hom01_network_vcn_network_compartment_name
  to_lpg_display_name         = module.hom01_network.local_peering_gateways[0].display_name
  to_route_table_display_name = var.hom01_network_public_route_table_display_name
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}


module "lpg_route_pvt_hub_to_dev01" {
  depends_on = [
    module.hub01_network,
    module.dev01_network
  ]
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git?ref=v1.0.2"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  from_network_compartment_name = var.hub01_network_vcn_network_compartment_name
  from_vcn_display_name         = var.hub01_network_vcn_display_name
  from_route_table_display_name = var.hub01_network_private_route_table_display_name
  from_lpg_display_name         = module.hub01_network.local_peering_gateways[3].display_name

  to_vcn_display_name         = var.dev01_network_vcn_display_name
  to_network_compartment_name = var.dev01_network_vcn_network_compartment_name
  to_lpg_display_name         = module.dev01_network.local_peering_gateways[0].display_name
  to_route_table_display_name = var.dev01_network_private_route_table_display_name
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}

module "lpg_route_pub_hub_to_dev01" {
  depends_on = [
    module.hub01_network,
    module.dev01_network
  ]
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git?ref=v1.0.2"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  from_network_compartment_name = var.hub01_network_vcn_network_compartment_name
  from_vcn_display_name         = var.hub01_network_vcn_display_name
  from_route_table_display_name = var.hub01_network_public_route_table_display_name
  from_lpg_display_name         = module.hub01_network.local_peering_gateways[3].display_name

  to_vcn_display_name         = var.dev01_network_vcn_display_name
  to_network_compartment_name = var.dev01_network_vcn_network_compartment_name
  to_lpg_display_name         = module.dev01_network.local_peering_gateways[0].display_name
  to_route_table_display_name = var.dev01_network_public_route_table_display_name
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}

module "lpg_route_pvt_hub_to_sbx01" {
  depends_on = [
    module.hub01_network,
    module.sbx01_network
  ]
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git?ref=v1.0.2"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  from_network_compartment_name = var.hub01_network_vcn_network_compartment_name
  from_vcn_display_name         = var.hub01_network_vcn_display_name
  from_route_table_display_name = var.hub01_network_private_route_table_display_name
  from_lpg_display_name         = module.hub01_network.local_peering_gateways[4].display_name

  to_vcn_display_name         = var.sbx01_network_vcn_display_name
  to_network_compartment_name = var.sbx01_network_vcn_network_compartment_name
  to_lpg_display_name         = module.sbx01_network.local_peering_gateways[0].display_name
  to_route_table_display_name = var.sbx01_network_private_route_table_display_name
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}

module "lpg_route_pub_hub_to_sbx01" {
  depends_on = [
    module.hub01_network,
    module.sbx01_network
  ]
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git?ref=v1.0.2"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  from_network_compartment_name = var.hub01_network_vcn_network_compartment_name
  from_vcn_display_name         = var.hub01_network_vcn_display_name
  from_route_table_display_name = var.hub01_network_public_route_table_display_name
  from_lpg_display_name         = module.hub01_network.local_peering_gateways[4].display_name

  to_vcn_display_name         = var.sbx01_network_vcn_display_name
  to_network_compartment_name = var.sbx01_network_vcn_network_compartment_name
  to_lpg_display_name         = module.sbx01_network.local_peering_gateways[0].display_name
  to_route_table_display_name = var.sbx01_network_public_route_table_display_name
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}