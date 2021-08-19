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
hub01network_vcn_cidr_blocks                     = ["10.0.0.0/16"]
hub01network_private_subnet_cidr_block_map       = { "HUB01_pvtsn01" : "10.0.0.0/23", "HUB01_pvtsn02" : "10.0.2.0/23", "HUB01_pvtsn03" : "10.0.4.0/23" }
hub01network_public_subnet_cidr_block_map        = { "HUB01_pubsn01" : "10.0.6.0/23", "HUB01_pubsn02" : "10.0.8.0/23", "HUB01_pubsn03" : "10.0.10.0/23" }
hub01network_vcn_display_name                    = "HUB01_VCN_Terraform"
hub01network_vcn_network_compartment_name        = "TF_NETWORK_hub01comp"
hub01network_dhcp_options_display_name           = "HUB01_DHCP_Options"
hub01network_custom_search_domain                = "test.com"
hub01network_private_route_table_display_name    = "HUB01_pvt_hub_rt"
hub01network_public_route_table_display_name     = "HUB01_pub_hub_rt"
hub01network_private_security_list_display_name  = "HUB01_pvt_hub_sl"
hub01network_public_security_list_display_name   = "HUB01_pub_hub_sl"
hub01network_service_gateway_display_name        = "HUB01_SVC_GW"
hub01network_nat_gateway_display_name            = "HUB01_NAT_GW"
hub01network_internet_gateway_display_name       = "HUB01_INET_GW"
hub01network_lpg_count                           = 2
hub01network_lpg_display_name_base               = "HUB01_LPG"
hub01network_peered_vcn_network_compartment_name = ""
hub01network_peered_lpg_display_name             = ""
hub01network_is_spoke                            = false


######################################## HUB NETWORK SPECIFIC VARIABLES SPECIFIC VARIABLES ######################################


######################################## SPOKE01 NETWORK SPECIFIC VARIABLES ######################################
spoke01network_vcn_cidr_blocks                     = ["11.0.0.0/16"]
spoke01network_private_subnet_cidr_block_map       = { "SPOKE01_pvtsn01" : "11.0.0.0/23", "SPOKE01_pvtsn02" : "11.0.2.0/23", "SPOKE01_pvtsn03" : "11.0.4.0/23" }
spoke01network_public_subnet_cidr_block_map        = { "SPOKE01_pubsn01" : "11.0.6.0/23", "SPOKE01_pubsn02" : "11.0.8.0/23", "SPOKE01_pubsn03" : "11.0.10.0/23" }
spoke01network_vcn_display_name                    = "SPOKE01_VCN_Terraform"
spoke01network_vcn_network_compartment_name        = "TF_NETWORK_spoke01comp"
spoke01network_dhcp_options_display_name           = "SPOKE01_DHCP_Options"
spoke01network_custom_search_domain                = "test.com"
spoke01network_private_route_table_display_name    = "SPOKE01_pvt_hub_rt"
spoke01network_public_route_table_display_name     = "SPOKE01_pub_hub_rt"
spoke01network_private_security_list_display_name  = "SPOKE01_pvt_hub_sl"
spoke01network_public_security_list_display_name   = "SPOKE01_pub_hub_sl"
spoke01network_service_gateway_display_name        = "SPOKE01_SVC_GW"
spoke01network_nat_gateway_display_name            = "SPOKE01_NAT_GW"
spoke01network_internet_gateway_display_name       = "INET_GW"
spoke01network_lpg_count                           = 1
spoke01network_lpg_display_name_base               = "SPOKE01_LPG"
spoke01network_peered_vcn_network_compartment_name = "TF_NETWORK_hub01comp"
spoke01network_peered_lpg_display_name             = "HUB01_LPG01"
spoke01network_is_spoke                            = true
######################################## SPOKE01 NETWORK SPECIFIC VARIABLES SPECIFIC VARIABLES ######################################


######################################## SPOKE02 NETWORK SPECIFIC VARIABLES ######################################
spoke02network_vcn_cidr_blocks                     = ["12.0.0.0/16"]
spoke02network_private_subnet_cidr_block_map       = { "SPOKE02_pvtsn01" : "12.0.0.0/23", "SPOKE02_pvtsn02" : "12.0.2.0/23", "SPOKE02_pvtsn03" : "12.0.4.0/23" }
spoke02network_public_subnet_cidr_block_map        = { "SPOKE02_pubsn01" : "12.0.6.0/23", "SPOKE02_pubsn02" : "12.0.8.0/23", "SPOKE02_pubsn03" : "12.0.10.0/23" }
spoke02network_vcn_display_name                    = "SPOKE02_VCN_Terraform"
spoke02network_vcn_network_compartment_name        = "TF_NETWORK_spoke02comp"
spoke02network_dhcp_options_display_name           = "SPOKE02_DHCP_Options"
spoke02network_custom_search_domain                = "test.com"
spoke02network_private_route_table_display_name    = "SPOKE02_pvt_hub_rt"
spoke02network_public_route_table_display_name     = "SPOKE02_pub_hub_rt"
spoke02network_private_security_list_display_name  = "SPOKE02_pvt_hub_sl"
spoke02network_public_security_list_display_name   = "SPOKE02_pub_hub_sl"
spoke02network_service_gateway_display_name        = "SPOKE02_SVC_GW"
spoke02network_nat_gateway_display_name            = "SPOKE02_NAT_GW"
spoke02network_internet_gateway_display_name       = "SPOKE02_INET_GW"
spoke02network_lpg_count                           = 1
spoke02network_lpg_display_name_base               = "SPOKE02_LPG"
spoke02network_peered_vcn_network_compartment_name = "TF_NETWORK_hub01comp"
spoke02network_peered_lpg_display_name             = "HUB01_LPG02"
spoke02network_is_spoke                            = true
######################################## SPOKE01 NETWORK SPECIFIC VARIABLES SPECIFIC VARIABLES ###################
