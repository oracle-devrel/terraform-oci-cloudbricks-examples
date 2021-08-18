# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# variables.tf
#
# Purpose:The following script declares all variables used in this backend repository

/********** Provider Variables NOT OVERLOADABLE **********/
variable "region" {
  description = "Target region where artifacts are going to be created"
}

variable "tenancy_ocid" {
  description = "OCID of tenancy"
}

variable "user_ocid" {
  description = "User OCID in tenancy. Currently hardcoded to user denny.alquinta@oracle.com"
}

variable "fingerprint" {
  description = "API Key Fingerprint for user_ocid derived from public API Key imported in OCI User config"
}

variable "private_key_path" {
  description = "Private Key Absolute path location where terraform is executed"

}
/********** Provider Variables NOT OVERLOADABLE **********/


/************ HUB NETWORK VARIABLES **************/
/********** VCN Variables **********/
variable "hub01_network_vcn_cidr_blocks" {
  description = "The list of one or more IPv4 CIDR blocks for the VCN"
}

variable "hub01_network_vcn_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}

variable "hub01_network_vcn_network_compartment_name" {
  description = "Name of the compartment where the VCN will be created"
}
/********** VCN Variables **********/

/********** DHCP Options Variables **********/
variable "hub01_network_dhcp_options_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}

variable "hub01_network_custom_search_domain" {
  description = "A domain name where the custom option can be applied"

}
/********** DHCP Options Variables **********/

/********** Private Security List Variables **********/
variable "hub01_network_private_security_list_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}

variable "hub01_network_private_security_list_egress_security_rules_destination" {
  description = "(Required) (Updatable) Conceptually, this is the range of IP addresses that a packet originating from the instance can go to."
  default     = "0.0.0.0/0"
}

variable "hub01_network_private_security_list_egress_security_rules_protocol" {
  description = "(Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)."
  default     = "all"
}

variable "hub01_network_private_security_list_egress_security_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "All egress rule for all protocols and IP Addresses"
}

variable "hub01_network_private_security_list_egress_security_rules_destination_type" {
  description = "Optional) (Updatable) Type of destination for the rule. The default is CIDR_BLOCK"
  default     = "CIDR_BLOCK"
}

variable "hub01_network_private_security_list_egress_security_rules_stateless" {
  description = "(Optional) (Updatable) A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if egress traffic allows TCP destination port 80, there should be an ingress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic."
  default     = true
}

variable "hub01_network_private_security_list_ingress_security_rules_protocol" {
  description = "(Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)."
  default     = "all"
}

variable "hub01_network_private_security_list_ingress_security_rules_source" {
  description = "(Required) (Updatable) Conceptually, this is the range of IP addresses that a packet coming into the instance can come from."
  default     = "0.0.0.0/0"
}

variable "hub01_network_private_security_list_ingress_security_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "All traffic in for private security List"
}

variable "hub01_network_private_security_list_ingress_security_rules_source_type" {
  description = "Type of source for the rule."
  default     = "CIDR_BLOCK"
}

variable "hub01_network_private_security_list_ingress_security_rules_stateless" {
  description = " A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if ingress traffic allows TCP destination port 80, there should be an egress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic."
  default     = true
}

/********** Private Security List Variables **********/

/********** Public Security List Variables **********/
variable "hub01_network_public_security_list_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}

variable "hub01_network_public_security_list_egress_security_rules_destination" {
  description = "(Required) (Updatable) Conceptually, this is the range of IP addresses that a packet originating from the instance can go to."
  default     = "0.0.0.0/0"
}

variable "hub01_network_public_security_list_egress_security_rules_protocol" {
  description = "(Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)."
  default     = "all"
}

variable "hub01_network_public_security_list_egress_security_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "All egress rule for all protocols and IP Addresses"
}

variable "hub01_network_public_security_list_egress_security_rules_destination_type" {
  description = "Optional) (Updatable) Type of destination for the rule. The default is CIDR_BLOCK"
  default     = "CIDR_BLOCK"
}

variable "hub01_network_public_security_list_egress_security_rules_stateless" {
  description = "(Optional) (Updatable) A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if egress traffic allows TCP destination port 80, there should be an ingress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic."
  default     = true
}

variable "hub01_network_public_security_list_ingress_security_rules_protocol" {
  description = "(Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)."
  default     = "all"
}

variable "hub01_network_public_security_list_ingress_security_rules_source" {
  description = "(Required) (Updatable) Conceptually, this is the range of IP addresses that a packet coming into the instance can come from."
  default     = "0.0.0.0/0"
}

variable "hub01_network_public_security_list_ingress_security_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "All traffic in for Public Security List"
}

variable "hub01_network_public_security_list_ingress_security_rules_source_type" {
  description = "Type of source for the rule."
  default     = "CIDR_BLOCK"
}

variable "hub01_network_public_security_list_ingress_security_rules_stateless" {
  description = " A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if ingress traffic allows TCP destination port 80, there should be an egress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic."
  default     = true
}

/********** Public Security List Variables **********/


/********** Private Route Table Variables **********/
variable "hub01_network_private_route_table_display_name" {
  description = "Private Route Table Display Name."
}
/********** Private Route Table Variables **********/

/********** Public Route Table Variables **********/
variable "hub01_network_public_route_table_display_name" {
  description = "Public Route Table Display Name."
}
/********** Public Route Table Variables **********/



/********** Private Subnet Variables **********/
variable "hub01_network_private_subnet_cidr_block_map" {
  type        = map(any)
  description = "Map of CIDR Blocks associated to private subnets and it's corresponding names"
}

variable "hub01_network_is_private_subnet_private" {
  description = "Describes if the subnet is private or not"
  default     = true
}
/********** Private Subnet Variables **********/

/********** Public Subnet Variables **********/
variable "hub01_network_public_subnet_cidr_block_map" {
  type        = map(any)
  description = "Map of CIDR Blocks associated to private subnets and it's corresponding names"
}

variable "hub01_network_is_public_subnet_private" {
  description = "Describes if the subnet is private or not"
  default     = false
}
/********** Public Subnet Variables **********/

/********** NAT Gateway Variables **********/

variable "hub01_network_nat_gateway_display_name" {
  description = "NAT Gateway Display Name"
}
variable "hub01_network_private_route_table_nat_route_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "NAT Gateway default route"
}

variable "hub01_network_private_route_table_nat_route_rules_destination" {
  description = "private_route_table_route_rules_destination"
  default     = "0.0.0.0/0"
}

variable "hub01_network_private_route_table_nat_route_rules_destination_type" {
  description = "(Optional) (Updatable) Type of destination for the rule. Required if you provide a destination."
  default     = "CIDR_BLOCK"
}

/********** NAT Gateway Variables **********/

/********** Private Service Gateway Variables **********/
variable "hub01_network_service_gateway_display_name" {
  description = "Service Gateway Display Name"
}


variable "hub01_network_private_route_table_svc_route_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "Service Gateway default route"
}

variable "hub01_network_private_route_table_svc_route_rules_destination_type" {
  description = "(Optional) (Updatable) Type of destination for the rule. Required if you provide a destination."
  default     = "SERVICE_CIDR_BLOCK"
}
/********** Private Service Gateway Variables **********/

/********** Public Service Gateway Variables **********/

variable "hub01_network_public_route_table_svc_route_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "Service Gateway default route"
}

variable "hub01_network_public_route_table_svc_route_rules_destination_type" {
  description = "(Optional) (Updatable) Type of destination for the rule. Required if you provide a destination."
  default     = "SERVICE_CIDR_BLOCK"
}
/********** Public Service Gateway Variables **********/




/********** Public Internet Gateway Variables **********/
variable "hub01_network_internet_gateway_enabled" {
  description = "Describes if the Internet Gateway is enabled upon creation or not"
  default     = true
}

variable "hub01_network_internet_gateway_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}

variable "hub01_network_public_route_table_inet_route_rules_description" {
  description = "Description of Route Table Entry for Internet Gateway"
  default     = "Route entry for Internet Gateway"
}

variable "hub01_network_public_route_table_inet_route_rules_destination" {
  description = "private_route_table_route_rules_destination"
  default     = "0.0.0.0/0"
}

variable "hub01_network_public_route_table_inet_route_rules_destination_type" {
  description = "(Optional) (Updatable) Type of destination for the rule. Required if you provide a destination."
  default     = "CIDR_BLOCK"
}

/********** Public Internet Gateway Variables **********/

/********** Local Peering Gateway Variables **********/
variable "hub01_network_lpg_display_name_base" {
  description = "Local Peering Gateway Display Name Base"
}

variable "hub01_network_peered_lpg_display_name" {
  description = "Display name of peered network"
  default     = ""
}

variable "hub01_network_peered_vcn_network_compartment_name" {
  description = "Compartment name of origin VCN to peer"
  default     = ""
}

variable "hub01_network_lpg_count" {
  description = "Number of LPG to create"
  default     = 1

}

variable "hub01_network_is_spoke" {
  description = "Boolean that describes if the compartment is a spoke or not"
  default     = true
}
/********** Local Peering Gateway Variables **********/

/************ HUB NETWORK VARIABLES **************/

/************ prd01 NETWORK VARIABLES **************/
/********** VCN Variables **********/
variable "prd01_network_vcn_cidr_blocks" {
  description = "The list of one or more IPv4 CIDR blocks for the VCN"
}

variable "prd01_network_vcn_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}

variable "prd01_network_vcn_network_compartment_name" {
  description = "Name of the compartment where the VCN will be created"
}
/********** VCN Variables **********/

/********** DHCP Options Variables **********/
variable "prd01_network_dhcp_options_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}
/********** DHCP Options Variables **********/

/********** Private Security List Variables **********/
variable "prd01_network_private_security_list_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}

variable "prd01_network_custom_search_domain" {
  description = "A domain name where the custom option can be applied"

}

variable "prd01_network_private_security_list_egress_security_rules_destination" {
  description = "(Required) (Updatable) Conceptually, this is the range of IP addresses that a packet originating from the instance can go to."
  default     = "0.0.0.0/0"
}

variable "prd01_network_private_security_list_egress_security_rules_protocol" {
  description = "(Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)."
  default     = "all"
}

variable "prd01_network_private_security_list_egress_security_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "All egress rule for all protocols and IP Addresses"
}

variable "prd01_network_private_security_list_egress_security_rules_destination_type" {
  description = "Optional) (Updatable) Type of destination for the rule. The default is CIDR_BLOCK"
  default     = "CIDR_BLOCK"
}

variable "prd01_network_private_security_list_egress_security_rules_stateless" {
  description = "(Optional) (Updatable) A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if egress traffic allows TCP destination port 80, there should be an ingress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic."
  default     = true
}

variable "prd01_network_private_security_list_ingress_security_rules_protocol" {
  description = "(Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)."
  default     = "all"
}

variable "prd01_network_private_security_list_ingress_security_rules_source" {
  description = "(Required) (Updatable) Conceptually, this is the range of IP addresses that a packet coming into the instance can come from."
  default     = "0.0.0.0/0"
}

variable "prd01_network_private_security_list_ingress_security_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "All traffic in for private security List"
}

variable "prd01_network_private_security_list_ingress_security_rules_source_type" {
  description = "Type of source for the rule."
  default     = "CIDR_BLOCK"
}

variable "prd01_network_private_security_list_ingress_security_rules_stateless" {
  description = " A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if ingress traffic allows TCP destination port 80, there should be an egress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic."
  default     = true
}

/********** Private Security List Variables **********/

/********** Public Security List Variables **********/
variable "prd01_network_public_security_list_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}

variable "prd01_network_public_security_list_egress_security_rules_destination" {
  description = "(Required) (Updatable) Conceptually, this is the range of IP addresses that a packet originating from the instance can go to."
  default     = "0.0.0.0/0"
}

variable "prd01_network_public_security_list_egress_security_rules_protocol" {
  description = "(Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)."
  default     = "all"
}

variable "prd01_network_public_security_list_egress_security_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "All egress rule for all protocols and IP Addresses"
}

variable "prd01_network_public_security_list_egress_security_rules_destination_type" {
  description = "Optional) (Updatable) Type of destination for the rule. The default is CIDR_BLOCK"
  default     = "CIDR_BLOCK"
}

variable "prd01_network_public_security_list_egress_security_rules_stateless" {
  description = "(Optional) (Updatable) A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if egress traffic allows TCP destination port 80, there should be an ingress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic."
  default     = true
}

variable "prd01_network_public_security_list_ingress_security_rules_protocol" {
  description = "(Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)."
  default     = "all"
}

variable "prd01_network_public_security_list_ingress_security_rules_source" {
  description = "(Required) (Updatable) Conceptually, this is the range of IP addresses that a packet coming into the instance can come from."
  default     = "0.0.0.0/0"
}

variable "prd01_network_public_security_list_ingress_security_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "All traffic in for Public Security List"
}

variable "prd01_network_public_security_list_ingress_security_rules_source_type" {
  description = "Type of source for the rule."
  default     = "CIDR_BLOCK"
}

variable "prd01_network_public_security_list_ingress_security_rules_stateless" {
  description = " A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if ingress traffic allows TCP destination port 80, there should be an egress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic."
  default     = true
}

/********** Public Security List Variables **********/


/********** Private Route Table Variables **********/
variable "prd01_network_private_route_table_display_name" {
  description = "Private Route Table Display Name."
}
/********** Private Route Table Variables **********/

/********** Public Route Table Variables **********/
variable "prd01_network_public_route_table_display_name" {
  description = "Public Route Table Display Name."
}
/********** Public Route Table Variables **********/



/********** Private Subnet Variables **********/
variable "prd01_network_private_subnet_cidr_block_map" {
  type        = map(any)
  description = "Map of CIDR Blocks associated to private subnets and it's corresponding names"
}

variable "prd01_network_is_private_subnet_private" {
  description = "Describes if the subnet is private or not"
  default     = true
}
/********** Private Subnet Variables **********/

/********** Public Subnet Variables **********/
variable "prd01_network_public_subnet_cidr_block_map" {
  type        = map(any)
  description = "Map of CIDR Blocks associated to private subnets and it's corresponding names"
}

variable "prd01_network_is_public_subnet_private" {
  description = "Describes if the subnet is private or not"
  default     = false
}
/********** Public Subnet Variables **********/

/********** NAT Gateway Variables **********/

variable "prd01_network_nat_gateway_display_name" {
  description = "NAT Gateway Display Name"
}
variable "prd01_network_private_route_table_nat_route_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "NAT Gateway default route"
}

variable "prd01_network_private_route_table_nat_route_rules_destination" {
  description = "private_route_table_route_rules_destination"
  default     = "0.0.0.0/0"
}

variable "prd01_network_private_route_table_nat_route_rules_destination_type" {
  description = "(Optional) (Updatable) Type of destination for the rule. Required if you provide a destination."
  default     = "CIDR_BLOCK"
}

/********** NAT Gateway Variables **********/

/********** Private Service Gateway Variables **********/
variable "prd01_network_service_gateway_display_name" {
  description = "Service Gateway Display Name"
}


variable "prd01_network_private_route_table_svc_route_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "Service Gateway default route"
}

variable "prd01_network_private_route_table_svc_route_rules_destination_type" {
  description = "(Optional) (Updatable) Type of destination for the rule. Required if you provide a destination."
  default     = "SERVICE_CIDR_BLOCK"
}
/********** Private Service Gateway Variables **********/

/********** Public Service Gateway Variables **********/

variable "prd01_network_public_route_table_svc_route_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "Service Gateway default route"
}

variable "prd01_network_public_route_table_svc_route_rules_destination_type" {
  description = "(Optional) (Updatable) Type of destination for the rule. Required if you provide a destination."
  default     = "SERVICE_CIDR_BLOCK"
}
/********** Public Service Gateway Variables **********/




/********** Public Internet Gateway Variables **********/
variable "prd01_network_internet_gateway_enabled" {
  description = "Describes if the Internet Gateway is enabled upon creation or not"
  default     = true
}

variable "prd01_network_internet_gateway_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}

variable "prd01_network_public_route_table_inet_route_rules_description" {
  description = "Description of Route Table Entry for Internet Gateway"
  default     = "Route entry for Internet Gateway"
}

variable "prd01_network_public_route_table_inet_route_rules_destination" {
  description = "private_route_table_route_rules_destination"
  default     = "0.0.0.0/0"
}

variable "prd01_network_public_route_table_inet_route_rules_destination_type" {
  description = "(Optional) (Updatable) Type of destination for the rule. Required if you provide a destination."
  default     = "CIDR_BLOCK"
}

/********** Public Internet Gateway Variables **********/
/********** Local Peering Gateway Variables **********/
variable "prd01_network_lpg_display_name_base" {
  description = "Local Peering Gateway Display Name Base"
}

variable "prd01_network_peered_vcn_network_compartment_name" {
  description = "Compartment name of origin VCN to peer"
  default     = ""
}

variable "prd01_network_peered_lpg_display_name" {
  description = "Display name of peered network"
  default     = ""
}

variable "prd01_network_lpg_count" {
  description = "Number of LPG to create"
  default     = 1

}

variable "prd01_network_is_spoke" {
  description = "Boolean that describes if the compartment is a spoke or not"
  default     = true
}
/********** Local Peering Gateway Variables **********/
/************ prd01 NETWORK VARIABLES **************/

/************ qa01 NETWORK VARIABLES **************/
/********** VCN Variables **********/
variable "qa01_network_vcn_cidr_blocks" {
  description = "The list of one or more IPv4 CIDR blocks for the VCN"
}

variable "qa01_network_vcn_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}

variable "qa01_network_vcn_network_compartment_name" {
  description = "Name of the compartment where the VCN will be created"
}
/********** VCN Variables **********/

/********** DHCP Options Variables **********/
variable "qa01_network_dhcp_options_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}
/********** DHCP Options Variables **********/

/********** Private Security List Variables **********/
variable "qa01_network_private_security_list_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}

variable "qa01_network_custom_search_domain" {
  description = "A domain name where the custom option can be applied"

}

variable "qa01_network_private_security_list_egress_security_rules_destination" {
  description = "(Required) (Updatable) Conceptually, this is the range of IP addresses that a packet originating from the instance can go to."
  default     = "0.0.0.0/0"
}

variable "qa01_network_private_security_list_egress_security_rules_protocol" {
  description = "(Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)."
  default     = "all"
}

variable "qa01_network_private_security_list_egress_security_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "All egress rule for all protocols and IP Addresses"
}

variable "qa01_network_private_security_list_egress_security_rules_destination_type" {
  description = "Optional) (Updatable) Type of destination for the rule. The default is CIDR_BLOCK"
  default     = "CIDR_BLOCK"
}

variable "qa01_network_private_security_list_egress_security_rules_stateless" {
  description = "(Optional) (Updatable) A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if egress traffic allows TCP destination port 80, there should be an ingress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic."
  default     = true
}

variable "qa01_network_private_security_list_ingress_security_rules_protocol" {
  description = "(Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)."
  default     = "all"
}

variable "qa01_network_private_security_list_ingress_security_rules_source" {
  description = "(Required) (Updatable) Conceptually, this is the range of IP addresses that a packet coming into the instance can come from."
  default     = "0.0.0.0/0"
}

variable "qa01_network_private_security_list_ingress_security_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "All traffic in for private security List"
}

variable "qa01_network_private_security_list_ingress_security_rules_source_type" {
  description = "Type of source for the rule."
  default     = "CIDR_BLOCK"
}

variable "qa01_network_private_security_list_ingress_security_rules_stateless" {
  description = " A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if ingress traffic allows TCP destination port 80, there should be an egress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic."
  default     = true
}

/********** Private Security List Variables **********/

/********** Public Security List Variables **********/
variable "qa01_network_public_security_list_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}

variable "qa01_network_public_security_list_egress_security_rules_destination" {
  description = "(Required) (Updatable) Conceptually, this is the range of IP addresses that a packet originating from the instance can go to."
  default     = "0.0.0.0/0"
}

variable "qa01_network_public_security_list_egress_security_rules_protocol" {
  description = "(Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)."
  default     = "all"
}

variable "qa01_network_public_security_list_egress_security_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "All egress rule for all protocols and IP Addresses"
}

variable "qa01_network_public_security_list_egress_security_rules_destination_type" {
  description = "Optional) (Updatable) Type of destination for the rule. The default is CIDR_BLOCK"
  default     = "CIDR_BLOCK"
}

variable "qa01_network_public_security_list_egress_security_rules_stateless" {
  description = "(Optional) (Updatable) A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if egress traffic allows TCP destination port 80, there should be an ingress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic."
  default     = true
}

variable "qa01_network_public_security_list_ingress_security_rules_protocol" {
  description = "(Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)."
  default     = "all"
}

variable "qa01_network_public_security_list_ingress_security_rules_source" {
  description = "(Required) (Updatable) Conceptually, this is the range of IP addresses that a packet coming into the instance can come from."
  default     = "0.0.0.0/0"
}

variable "qa01_network_public_security_list_ingress_security_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "All traffic in for Public Security List"
}

variable "qa01_network_public_security_list_ingress_security_rules_source_type" {
  description = "Type of source for the rule."
  default     = "CIDR_BLOCK"
}

variable "qa01_network_public_security_list_ingress_security_rules_stateless" {
  description = " A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if ingress traffic allows TCP destination port 80, there should be an egress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic."
  default     = true
}

/********** Public Security List Variables **********/


/********** Private Route Table Variables **********/
variable "qa01_network_private_route_table_display_name" {
  description = "Private Route Table Display Name."
}
/********** Private Route Table Variables **********/

/********** Public Route Table Variables **********/
variable "qa01_network_public_route_table_display_name" {
  description = "Public Route Table Display Name."
}
/********** Public Route Table Variables **********/



/********** Private Subnet Variables **********/
variable "qa01_network_private_subnet_cidr_block_map" {
  type        = map(any)
  description = "Map of CIDR Blocks associated to private subnets and it's corresponding names"
}

variable "qa01_network_is_private_subnet_private" {
  description = "Describes if the subnet is private or not"
  default     = true
}
/********** Private Subnet Variables **********/

/********** Public Subnet Variables **********/
variable "qa01_network_public_subnet_cidr_block_map" {
  type        = map(any)
  description = "Map of CIDR Blocks associated to private subnets and it's corresponding names"
}

variable "qa01_network_is_public_subnet_private" {
  description = "Describes if the subnet is private or not"
  default     = false
}
/********** Public Subnet Variables **********/

/********** NAT Gateway Variables **********/

variable "qa01_network_nat_gateway_display_name" {
  description = "NAT Gateway Display Name"
}
variable "qa01_network_private_route_table_nat_route_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "NAT Gateway default route"
}

variable "qa01_network_private_route_table_nat_route_rules_destination" {
  description = "private_route_table_route_rules_destination"
  default     = "0.0.0.0/0"
}

variable "qa01_network_private_route_table_nat_route_rules_destination_type" {
  description = "(Optional) (Updatable) Type of destination for the rule. Required if you provide a destination."
  default     = "CIDR_BLOCK"
}

/********** NAT Gateway Variables **********/

/********** Private Service Gateway Variables **********/
variable "qa01_network_service_gateway_display_name" {
  description = "Service Gateway Display Name"
}


variable "qa01_network_private_route_table_svc_route_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "Service Gateway default route"
}

variable "qa01_network_private_route_table_svc_route_rules_destination_type" {
  description = "(Optional) (Updatable) Type of destination for the rule. Required if you provide a destination."
  default     = "SERVICE_CIDR_BLOCK"
}
/********** Private Service Gateway Variables **********/

/********** Public Service Gateway Variables **********/

variable "qa01_network_public_route_table_svc_route_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "Service Gateway default route"
}

variable "qa01_network_public_route_table_svc_route_rules_destination_type" {
  description = "(Optional) (Updatable) Type of destination for the rule. Required if you provide a destination."
  default     = "SERVICE_CIDR_BLOCK"
}
/********** Public Service Gateway Variables **********/




/********** Public Internet Gateway Variables **********/
variable "qa01_network_internet_gateway_enabled" {
  description = "Describes if the Internet Gateway is enabled upon creation or not"
  default     = true
}

variable "qa01_network_internet_gateway_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}

variable "qa01_network_public_route_table_inet_route_rules_description" {
  description = "Description of Route Table Entry for Internet Gateway"
  default     = "Route entry for Internet Gateway"
}

variable "qa01_network_public_route_table_inet_route_rules_destination" {
  description = "private_route_table_route_rules_destination"
  default     = "0.0.0.0/0"
}

variable "qa01_network_public_route_table_inet_route_rules_destination_type" {
  description = "(Optional) (Updatable) Type of destination for the rule. Required if you provide a destination."
  default     = "CIDR_BLOCK"
}

/********** Public Internet Gateway Variables **********/
/********** Local Peering Gateway Variables **********/
variable "qa01_network_lpg_display_name_base" {
  description = "Local Peering Gateway Display Name Base"
}

variable "qa01_network_peered_vcn_network_compartment_name" {
  description = "Compartment name of origin VCN to peer"
  default     = ""
}

variable "qa01_network_peered_lpg_display_name" {
  description = "Display name of peered network"
  default     = ""
}

variable "qa01_network_lpg_count" {
  description = "Number of LPG to create"
  default     = 1

}

variable "qa01_network_is_spoke" {
  description = "Boolean that describes if the compartment is a spoke or not"
  default     = true
}
/********** Local Peering Gateway Variables **********/
/************ qa01 NETWORK VARIABLES **************/

/************ hom01 NETWORK VARIABLES **************/
/********** VCN Variables **********/
variable "hom01_network_vcn_cidr_blocks" {
  description = "The list of one or more IPv4 CIDR blocks for the VCN"
}

variable "hom01_network_vcn_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}

variable "hom01_network_vcn_network_compartment_name" {
  description = "Name of the compartment where the VCN will be created"
}
/********** VCN Variables **********/

/********** DHCP Options Variables **********/
variable "hom01_network_dhcp_options_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}
/********** DHCP Options Variables **********/

/********** Private Security List Variables **********/
variable "hom01_network_private_security_list_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}

variable "hom01_network_custom_search_domain" {
  description = "A domain name where the custom option can be applied"

}

variable "hom01_network_private_security_list_egress_security_rules_destination" {
  description = "(Required) (Updatable) Conceptually, this is the range of IP addresses that a packet originating from the instance can go to."
  default     = "0.0.0.0/0"
}

variable "hom01_network_private_security_list_egress_security_rules_protocol" {
  description = "(Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)."
  default     = "all"
}

variable "hom01_network_private_security_list_egress_security_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "All egress rule for all protocols and IP Addresses"
}

variable "hom01_network_private_security_list_egress_security_rules_destination_type" {
  description = "Optional) (Updatable) Type of destination for the rule. The default is CIDR_BLOCK"
  default     = "CIDR_BLOCK"
}

variable "hom01_network_private_security_list_egress_security_rules_stateless" {
  description = "(Optional) (Updatable) A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if egress traffic allows TCP destination port 80, there should be an ingress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic."
  default     = true
}

variable "hom01_network_private_security_list_ingress_security_rules_protocol" {
  description = "(Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)."
  default     = "all"
}

variable "hom01_network_private_security_list_ingress_security_rules_source" {
  description = "(Required) (Updatable) Conceptually, this is the range of IP addresses that a packet coming into the instance can come from."
  default     = "0.0.0.0/0"
}

variable "hom01_network_private_security_list_ingress_security_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "All traffic in for private security List"
}

variable "hom01_network_private_security_list_ingress_security_rules_source_type" {
  description = "Type of source for the rule."
  default     = "CIDR_BLOCK"
}

variable "hom01_network_private_security_list_ingress_security_rules_stateless" {
  description = " A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if ingress traffic allows TCP destination port 80, there should be an egress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic."
  default     = true
}

/********** Private Security List Variables **********/

/********** Public Security List Variables **********/
variable "hom01_network_public_security_list_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}

variable "hom01_network_public_security_list_egress_security_rules_destination" {
  description = "(Required) (Updatable) Conceptually, this is the range of IP addresses that a packet originating from the instance can go to."
  default     = "0.0.0.0/0"
}

variable "hom01_network_public_security_list_egress_security_rules_protocol" {
  description = "(Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)."
  default     = "all"
}

variable "hom01_network_public_security_list_egress_security_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "All egress rule for all protocols and IP Addresses"
}

variable "hom01_network_public_security_list_egress_security_rules_destination_type" {
  description = "Optional) (Updatable) Type of destination for the rule. The default is CIDR_BLOCK"
  default     = "CIDR_BLOCK"
}

variable "hom01_network_public_security_list_egress_security_rules_stateless" {
  description = "(Optional) (Updatable) A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if egress traffic allows TCP destination port 80, there should be an ingress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic."
  default     = true
}

variable "hom01_network_public_security_list_ingress_security_rules_protocol" {
  description = "(Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)."
  default     = "all"
}

variable "hom01_network_public_security_list_ingress_security_rules_source" {
  description = "(Required) (Updatable) Conceptually, this is the range of IP addresses that a packet coming into the instance can come from."
  default     = "0.0.0.0/0"
}

variable "hom01_network_public_security_list_ingress_security_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "All traffic in for Public Security List"
}

variable "hom01_network_public_security_list_ingress_security_rules_source_type" {
  description = "Type of source for the rule."
  default     = "CIDR_BLOCK"
}

variable "hom01_network_public_security_list_ingress_security_rules_stateless" {
  description = " A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if ingress traffic allows TCP destination port 80, there should be an egress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic."
  default     = true
}

/********** Public Security List Variables **********/


/********** Private Route Table Variables **********/
variable "hom01_network_private_route_table_display_name" {
  description = "Private Route Table Display Name."
}
/********** Private Route Table Variables **********/

/********** Public Route Table Variables **********/
variable "hom01_network_public_route_table_display_name" {
  description = "Public Route Table Display Name."
}
/********** Public Route Table Variables **********/



/********** Private Subnet Variables **********/
variable "hom01_network_private_subnet_cidr_block_map" {
  type        = map(any)
  description = "Map of CIDR Blocks associated to private subnets and it's corresponding names"
}

variable "hom01_network_is_private_subnet_private" {
  description = "Describes if the subnet is private or not"
  default     = true
}
/********** Private Subnet Variables **********/

/********** Public Subnet Variables **********/
variable "hom01_network_public_subnet_cidr_block_map" {
  type        = map(any)
  description = "Map of CIDR Blocks associated to private subnets and it's corresponding names"
}

variable "hom01_network_is_public_subnet_private" {
  description = "Describes if the subnet is private or not"
  default     = false
}
/********** Public Subnet Variables **********/

/********** NAT Gateway Variables **********/

variable "hom01_network_nat_gateway_display_name" {
  description = "NAT Gateway Display Name"
}
variable "hom01_network_private_route_table_nat_route_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "NAT Gateway default route"
}

variable "hom01_network_private_route_table_nat_route_rules_destination" {
  description = "private_route_table_route_rules_destination"
  default     = "0.0.0.0/0"
}

variable "hom01_network_private_route_table_nat_route_rules_destination_type" {
  description = "(Optional) (Updatable) Type of destination for the rule. Required if you provide a destination."
  default     = "CIDR_BLOCK"
}

/********** NAT Gateway Variables **********/

/********** Private Service Gateway Variables **********/
variable "hom01_network_service_gateway_display_name" {
  description = "Service Gateway Display Name"
}


variable "hom01_network_private_route_table_svc_route_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "Service Gateway default route"
}

variable "hom01_network_private_route_table_svc_route_rules_destination_type" {
  description = "(Optional) (Updatable) Type of destination for the rule. Required if you provide a destination."
  default     = "SERVICE_CIDR_BLOCK"
}
/********** Private Service Gateway Variables **********/

/********** Public Service Gateway Variables **********/

variable "hom01_network_public_route_table_svc_route_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "Service Gateway default route"
}

variable "hom01_network_public_route_table_svc_route_rules_destination_type" {
  description = "(Optional) (Updatable) Type of destination for the rule. Required if you provide a destination."
  default     = "SERVICE_CIDR_BLOCK"
}
/********** Public Service Gateway Variables **********/




/********** Public Internet Gateway Variables **********/
variable "hom01_network_internet_gateway_enabled" {
  description = "Describes if the Internet Gateway is enabled upon creation or not"
  default     = true
}

variable "hom01_network_internet_gateway_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}

variable "hom01_network_public_route_table_inet_route_rules_description" {
  description = "Description of Route Table Entry for Internet Gateway"
  default     = "Route entry for Internet Gateway"
}

variable "hom01_network_public_route_table_inet_route_rules_destination" {
  description = "private_route_table_route_rules_destination"
  default     = "0.0.0.0/0"
}

variable "hom01_network_public_route_table_inet_route_rules_destination_type" {
  description = "(Optional) (Updatable) Type of destination for the rule. Required if you provide a destination."
  default     = "CIDR_BLOCK"
}

/********** Public Internet Gateway Variables **********/
/********** Local Peering Gateway Variables **********/
variable "hom01_network_lpg_display_name_base" {
  description = "Local Peering Gateway Display Name Base"
}

variable "hom01_network_peered_vcn_network_compartment_name" {
  description = "Compartment name of origin VCN to peer"
  default     = ""
}

variable "hom01_network_peered_lpg_display_name" {
  description = "Display name of peered network"
  default     = ""
}

variable "hom01_network_lpg_count" {
  description = "Number of LPG to create"
  default     = 1

}

variable "hom01_network_is_spoke" {
  description = "Boolean that describes if the compartment is a spoke or not"
  default     = true
}
/********** Local Peering Gateway Variables **********/
/************ hom01 NETWORK VARIABLES **************/


/************ dev01 NETWORK VARIABLES **************/
/********** VCN Variables **********/
variable "dev01_network_vcn_cidr_blocks" {
  description = "The list of one or more IPv4 CIDR blocks for the VCN"
}

variable "dev01_network_vcn_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}

variable "dev01_network_vcn_network_compartment_name" {
  description = "Name of the compartment where the VCN will be created"
}

/********** VCN Variables **********/

/********** DHCP Options Variables **********/
variable "dev01_network_dhcp_options_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}

variable "dev01_network_custom_search_domain" {
  description = "A domain name where the custom option can be applied"

}
/********** DHCP Options Variables **********/

/********** Private Security List Variables **********/
variable "dev01_network_private_security_list_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}

variable "dev01_network_private_security_list_egress_security_rules_destination" {
  description = "(Required) (Updatable) Conceptually, this is the range of IP addresses that a packet originating from the instance can go to."
  default     = "0.0.0.0/0"
}

variable "dev01_network_private_security_list_egress_security_rules_protocol" {
  description = "(Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)."
  default     = "all"
}

variable "dev01_network_private_security_list_egress_security_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "All egress rule for all protocols and IP Addresses"
}

variable "dev01_network_private_security_list_egress_security_rules_destination_type" {
  description = "Optional) (Updatable) Type of destination for the rule. The default is CIDR_BLOCK"
  default     = "CIDR_BLOCK"
}

variable "dev01_network_private_security_list_egress_security_rules_stateless" {
  description = "(Optional) (Updatable) A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if egress traffic allows TCP destination port 80, there should be an ingress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic."
  default     = true
}

variable "dev01_network_private_security_list_ingress_security_rules_protocol" {
  description = "(Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)."
  default     = "all"
}

variable "dev01_network_private_security_list_ingress_security_rules_source" {
  description = "(Required) (Updatable) Conceptually, this is the range of IP addresses that a packet coming into the instance can come from."
  default     = "0.0.0.0/0"
}

variable "dev01_network_private_security_list_ingress_security_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "All traffic in for private security List"
}

variable "dev01_network_private_security_list_ingress_security_rules_source_type" {
  description = "Type of source for the rule."
  default     = "CIDR_BLOCK"
}

variable "dev01_network_private_security_list_ingress_security_rules_stateless" {
  description = " A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if ingress traffic allows TCP destination port 80, there should be an egress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic."
  default     = true
}

/********** Private Security List Variables **********/

/********** Public Security List Variables **********/
variable "dev01_network_public_security_list_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}

variable "dev01_network_public_security_list_egress_security_rules_destination" {
  description = "(Required) (Updatable) Conceptually, this is the range of IP addresses that a packet originating from the instance can go to."
  default     = "0.0.0.0/0"
}

variable "dev01_network_public_security_list_egress_security_rules_protocol" {
  description = "(Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)."
  default     = "all"
}

variable "dev01_network_public_security_list_egress_security_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "All egress rule for all protocols and IP Addresses"
}

variable "dev01_network_public_security_list_egress_security_rules_destination_type" {
  description = "Optional) (Updatable) Type of destination for the rule. The default is CIDR_BLOCK"
  default     = "CIDR_BLOCK"
}

variable "dev01_network_public_security_list_egress_security_rules_stateless" {
  description = "(Optional) (Updatable) A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if egress traffic allows TCP destination port 80, there should be an ingress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic."
  default     = true
}

variable "dev01_network_public_security_list_ingress_security_rules_protocol" {
  description = "(Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58)."
  default     = "all"
}

variable "dev01_network_public_security_list_ingress_security_rules_source" {
  description = "(Required) (Updatable) Conceptually, this is the range of IP addresses that a packet coming into the instance can come from."
  default     = "0.0.0.0/0"
}

variable "dev01_network_public_security_list_ingress_security_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "All traffic in for Public Security List"
}

variable "dev01_network_public_security_list_ingress_security_rules_source_type" {
  description = "Type of source for the rule."
  default     = "CIDR_BLOCK"
}

variable "dev01_network_public_security_list_ingress_security_rules_stateless" {
  description = " A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if ingress traffic allows TCP destination port 80, there should be an egress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic."
  default     = true
}

/********** Public Security List Variables **********/


/********** Private Route Table Variables **********/
variable "dev01_network_private_route_table_display_name" {
  description = "Private Route Table Display Name."
}
/********** Private Route Table Variables **********/

/********** Public Route Table Variables **********/
variable "dev01_network_public_route_table_display_name" {
  description = "Public Route Table Display Name."
}
/********** Public Route Table Variables **********/



/********** Private Subnet Variables **********/
variable "dev01_network_private_subnet_cidr_block_map" {
  type        = map(any)
  description = "Map of CIDR Blocks associated to private subnets and it's corresponding names"
}

variable "dev01_network_is_private_subnet_private" {
  description = "Describes if the subnet is private or not"
  default     = true
}
/********** Private Subnet Variables **********/

/********** Public Subnet Variables **********/
variable "dev01_network_public_subnet_cidr_block_map" {
  type        = map(any)
  description = "Map of CIDR Blocks associated to private subnets and it's corresponding names"
}

variable "dev01_network_is_public_subnet_private" {
  description = "Describes if the subnet is private or not"
  default     = false
}
/********** Public Subnet Variables **********/

/********** NAT Gateway Variables **********/

variable "dev01_network_nat_gateway_display_name" {
  description = "NAT Gateway Display Name"
}
variable "dev01_network_private_route_table_nat_route_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "NAT Gateway default route"
}

variable "dev01_network_private_route_table_nat_route_rules_destination" {
  description = "private_route_table_route_rules_destination"
  default     = "0.0.0.0/0"
}

variable "dev01_network_private_route_table_nat_route_rules_destination_type" {
  description = "(Optional) (Updatable) Type of destination for the rule. Required if you provide a destination."
  default     = "CIDR_BLOCK"
}

/********** NAT Gateway Variables **********/

/********** Private Service Gateway Variables **********/
variable "dev01_network_service_gateway_display_name" {
  description = "Service Gateway Display Name"
}


variable "dev01_network_private_route_table_svc_route_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "Service Gateway default route"
}

variable "dev01_network_private_route_table_svc_route_rules_destination_type" {
  description = "(Optional) (Updatable) Type of destination for the rule. Required if you provide a destination."
  default     = "SERVICE_CIDR_BLOCK"
}
/********** Private Service Gateway Variables **********/

/********** Public Service Gateway Variables **********/

variable "dev01_network_public_route_table_svc_route_rules_description" {
  description = "(Optional) (Updatable) An optional description of your choice for the rule."
  default     = "Service Gateway default route"
}

variable "dev01_network_public_route_table_svc_route_rules_destination_type" {
  description = "(Optional) (Updatable) Type of destination for the rule. Required if you provide a destination."
  default     = "SERVICE_CIDR_BLOCK"
}
/********** Public Service Gateway Variables **********/




/********** Public Internet Gateway Variables **********/
variable "dev01_network_internet_gateway_enabled" {
  description = "Describes if the Internet Gateway is enabled upon creation or not"
  default     = true
}

variable "dev01_network_internet_gateway_display_name" {
  description = "(Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information."
}

variable "dev01_network_public_route_table_inet_route_rules_description" {
  description = "Description of Route Table Entry for Internet Gateway"
  default     = "Route entry for Internet Gateway"
}

variable "dev01_network_public_route_table_inet_route_rules_destination" {
  description = "private_route_table_route_rules_destination"
  default     = "0.0.0.0/0"
}

variable "dev01_network_public_route_table_inet_route_rules_destination_type" {
  description = "(Optional) (Updatable) Type of destination for the rule. Required if you provide a destination."
  default     = "CIDR_BLOCK"
}

/********** Public Internet Gateway Variables **********/
/********** Local Peering Gateway Variables **********/

variable "dev01_network_lpg_display_name_base" {
  description = "Local Peering Gateway Display Name Base"
}

variable "dev01_network_peered_vcn_network_compartment_name" {
  description = "Compartment name of origin VCN to peer"
  default     = ""
}

variable "dev01_network_peered_lpg_display_name" {
  description = "Display name of peered network"
  default     = ""
}

variable "dev01_network_lpg_count" {
  description = "Number of LPG to create"
  default     = 1

}

variable "dev01_network_is_spoke" {
  description = "Boolean that describes if the compartment is a spoke or not"
  default     = true
}

/********** Local Peering Gateway Variables **********/
/************ dev01 NETWORK VARIABLES **************/



