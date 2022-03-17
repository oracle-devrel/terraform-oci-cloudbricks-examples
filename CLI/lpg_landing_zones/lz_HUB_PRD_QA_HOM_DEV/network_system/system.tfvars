# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# system.tfvars
#
# Purpose: The following script defines the system particular variables to provision environment


######################################## PROVIDER SPECIFIC VARIABLES ######################################
tenancy_ocid     = "ocid1.tenancy.oc1..foobarbar"
region           = "re-region-1"
user_ocid        = "ocid1.user.oc1..foobarbar"
fingerprint      = "fo:oo:ba:ar:ba:ar"
private_key_path = "/foo/bar/path/oci_api_key.pem"
######################################## PROVIDER SPECIFIC VARIABLES ######################################

######################################## HUB NETWORK SPECIFIC VARIABLES ######################################
hub01_network_vcn_cidr_blocks                     = ["10.0.0.0/16"]
hub01_network_private_subnet_cidr_block_map       = { "hub01_pvtsn01" : "10.0.0.0/23", "hub01_pvtsn02" : "10.0.2.0/23", "hub01_pvtsn03" : "10.0.4.0/23" }
hub01_network_public_subnet_cidr_block_map        = { "hub01_pubsn01" : "10.0.6.0/23", "hub01_pubsn02" : "10.0.8.0/23", "hub01_pubsn03" : "10.0.10.0/23" }
hub01_network_vcn_display_name                    = "HUB01_VCN"
hub01_network_vcn_network_compartment_name        = "HUB01_NETWORK_03"
hub01_network_dhcp_options_display_name           = "hub01_DHCP_Options"
hub01_network_custom_search_domain                = "test.com"
hub01_network_private_route_table_display_name    = "hub01_pvt_hub_rt"
hub01_network_public_route_table_display_name     = "hub01_pub_hub_rt"
hub01_network_private_security_list_display_name  = "hub01_pvt_hub_sl"
hub01_network_public_security_list_display_name   = "hub01_pub_hub_sl"
hub01_network_service_gateway_display_name        = "hub01_SVC_GW"
hub01_network_nat_gateway_display_name            = "hub01_NAT_GW"
hub01_network_internet_gateway_display_name       = "hub01_INET_GW"
hub01_network_lpg_count                           = 4
hub01_network_lpg_display_name_base               = "hub01_LPG"
hub01_network_peered_vcn_network_compartment_name = ""
hub01_network_peered_lpg_display_name             = ""
hub01_network_is_spoke                            = false


######################################## HUB NETWORK SPECIFIC VARIABLES SPECIFIC VARIABLES ######################################


######################################## prd01 NETWORK SPECIFIC VARIABLES ######################################
prd01_network_vcn_cidr_blocks                     = ["11.0.0.0/16"]
prd01_network_private_subnet_cidr_block_map       = { "prd01_pvtsn01" : "11.0.0.0/23", "prd01_pvtsn02" : "11.0.2.0/23", "prd01_pvtsn03" : "11.0.4.0/23" }
prd01_network_public_subnet_cidr_block_map        = { "prd01_pubsn01" : "11.0.6.0/23", "prd01_pubsn02" : "11.0.8.0/23", "prd01_pubsn03" : "11.0.10.0/23" }
prd01_network_vcn_display_name                    = "PRD01_VCN"
prd01_network_vcn_network_compartment_name        = "PRD01_NETWORK_03"
prd01_network_dhcp_options_display_name           = "prd01_DHCP_Options"
prd01_network_custom_search_domain                = "test.com"
prd01_network_private_route_table_display_name    = "prd01_pvt_hub_rt"
prd01_network_public_route_table_display_name     = "prd01_pub_hub_rt"
prd01_network_private_security_list_display_name  = "prd01_pvt_hub_sl"
prd01_network_public_security_list_display_name   = "prd01_pub_hub_sl"
prd01_network_service_gateway_display_name        = "prd01_SVC_GW"
prd01_network_nat_gateway_display_name            = "prd01_NAT_GW"
prd01_network_internet_gateway_display_name       = "INET_GW"
prd01_network_lpg_count                           = 1
prd01_network_lpg_display_name_base               = "prd01_LPG"
prd01_network_peered_vcn_network_compartment_name = "HUB01_NETWORK_03"
prd01_network_peered_lpg_display_name             = "hub01_LPG01"
prd01_network_is_spoke                            = true
######################################## prd01 NETWORK SPECIFIC VARIABLES SPECIFIC VARIABLES ######################################

######################################## qa01 NETWORK SPECIFIC VARIABLES ######################################
qa01_network_vcn_cidr_blocks                     = ["12.0.0.0/16"]
qa01_network_private_subnet_cidr_block_map       = { "qa01_pvtsn01" : "12.0.0.0/23", "qa01_pvtsn02" : "12.0.2.0/23", "qa01_pvtsn03" : "12.0.4.0/23" }
qa01_network_public_subnet_cidr_block_map        = { "qa01_pubsn01" : "12.0.6.0/23", "qa01_pubsn02" : "12.0.8.0/23", "qa01_pubsn03" : "12.0.10.0/23" }
qa01_network_vcn_display_name                    = "QA01_VCN"
qa01_network_vcn_network_compartment_name        = "QA01_NETWORK_03"
qa01_network_dhcp_options_display_name           = "qa01_DHCP_Options"
qa01_network_custom_search_domain                = "test.com"
qa01_network_private_route_table_display_name    = "qa01_pvt_hub_rt"
qa01_network_public_route_table_display_name     = "qa01_pub_hub_rt"
qa01_network_private_security_list_display_name  = "qa01_pvt_hub_sl"
qa01_network_public_security_list_display_name   = "qa01_pub_hub_sl"
qa01_network_service_gateway_display_name        = "qa01_SVC_GW"
qa01_network_nat_gateway_display_name            = "qa01_NAT_GW"
qa01_network_internet_gateway_display_name       = "INET_GW"
qa01_network_lpg_count                           = 1
qa01_network_lpg_display_name_base               = "qa01_LPG"
qa01_network_peered_vcn_network_compartment_name = "HUB01_NETWORK_03"
qa01_network_peered_lpg_display_name             = "hub01_LPG02"
qa01_network_is_spoke                            = true
######################################## qa01 NETWORK SPECIFIC VARIABLES SPECIFIC VARIABLES ######################################

######################################## hom01 NETWORK SPECIFIC VARIABLES ######################################
hom01_network_vcn_cidr_blocks                     = ["13.0.0.0/16"]
hom01_network_private_subnet_cidr_block_map       = { "hom01_pvtsn01" : "13.0.0.0/23", "hom01_pvtsn02" : "13.0.2.0/23", "hom01_pvtsn03" : "13.0.4.0/23" }
hom01_network_public_subnet_cidr_block_map        = { "hom01_pubsn01" : "13.0.6.0/23", "hom01_pubsn02" : "13.0.8.0/23", "hom01_pubsn03" : "13.0.10.0/23" }
hom01_network_vcn_display_name                    = "HOM01_VCN"
hom01_network_vcn_network_compartment_name        = "HOM01_NETWORK_03"
hom01_network_dhcp_options_display_name           = "hom01_DHCP_Options"
hom01_network_custom_search_domain                = "test.com"
hom01_network_private_route_table_display_name    = "hom01_pvt_hub_rt"
hom01_network_public_route_table_display_name     = "hom01_pub_hub_rt"
hom01_network_private_security_list_display_name  = "hom01_pvt_hub_sl"
hom01_network_public_security_list_display_name   = "hom01_pub_hub_sl"
hom01_network_service_gateway_display_name        = "hom01_SVC_GW"
hom01_network_nat_gateway_display_name            = "hom01_NAT_GW"
hom01_network_internet_gateway_display_name       = "hom01_INET_GW"
hom01_network_lpg_count                           = 1
hom01_network_lpg_display_name_base               = "hom01_LPG"
hom01_network_peered_vcn_network_compartment_name = "HUB01_NETWORK_03"
hom01_network_peered_lpg_display_name             = "hub01_LPG03"
hom01_network_is_spoke                            = true
######################################## hom01 NETWORK SPECIFIC VARIABLES SPECIFIC VARIABLES ###################

######################################## dev01 NETWORK SPECIFIC VARIABLES ######################################
dev01_network_vcn_cidr_blocks                     = ["14.0.0.0/16"]
dev01_network_private_subnet_cidr_block_map       = { "dev01_pvtsn01" : "14.0.0.0/23", "dev01_pvtsn02" : "14.0.2.0/23", "dev01_pvtsn03" : "14.0.4.0/23" }
dev01_network_public_subnet_cidr_block_map        = { "dev01_pubsn01" : "14.0.6.0/23", "dev01_pubsn02" : "14.0.8.0/23", "dev01_pubsn03" : "14.0.10.0/23" }
dev01_network_vcn_display_name                    = "DEV01_VCN"
dev01_network_vcn_network_compartment_name        = "DEV01_NETWORK_03"
dev01_network_dhcp_options_display_name           = "dev01_DHCP_Options"
dev01_network_custom_search_domain                = "test.com"
dev01_network_private_route_table_display_name    = "dev01_pvt_hub_rt"
dev01_network_public_route_table_display_name     = "dev01_pub_hub_rt"
dev01_network_private_security_list_display_name  = "dev01_pvt_hub_sl"
dev01_network_public_security_list_display_name   = "dev01_pub_hub_sl"
dev01_network_service_gateway_display_name        = "dev01_SVC_GW"
dev01_network_nat_gateway_display_name            = "dev01_NAT_GW"
dev01_network_internet_gateway_display_name       = "dev01_INET_GW"
dev01_network_lpg_count                           = 1
dev01_network_lpg_display_name_base               = "dev01_LPG"
dev01_network_peered_vcn_network_compartment_name = "HUB01_NETWORK_03"
dev01_network_peered_lpg_display_name             = "hub01_LPG04"
dev01_network_is_spoke                            = true
######################################## dev01 NETWORK SPECIFIC VARIABLES SPECIFIC VARIABLES ###################