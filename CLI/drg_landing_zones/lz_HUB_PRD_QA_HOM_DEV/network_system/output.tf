# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# output.tf
#
# Purpose: The following script defines the output for system created

output "hub01_network" {
  description = "VCN of hub01"
  value       = module.hub01_network.vcn
}

output "prd01_network" {
  description = "VCN of prd01"
  value       = module.prd01_network.vcn
}

output "qa01_network" {
  description = "VCN of qa01"
  value       = module.qa01_network.vcn
}

output "hom01_network" {
  description = "VCN of hom01"
  value       = module.hom01_network.vcn
}

output "dev01_network" {
  description = "VCN of dev01"
  value       = module.dev01_network.vcn
}

output "hub01_drg" {
  description = "Output of hub01 DRG"
  value       = module.hub01_network.dynamic_routing_gateway
}
