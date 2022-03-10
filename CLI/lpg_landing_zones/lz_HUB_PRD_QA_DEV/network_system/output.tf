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

output "dev01_network" {
  description = "VCN of dev01"
  value       = module.dev01_network.vcn

}

output "lpg_hub01" {
  description = "Output of hub01 LPGs"
  value       = module.hub01_network.local_peering_gateways
}

output "lpg_prd01" {
  description = "Output of prd01 LPGs"
  value       = module.prd01_network.local_peering_gateways
}

output "lpg_qa01" {
  description = "Output of dev01 LPGs"
  value       = module.qa01_network.local_peering_gateways
}

output "lpg_dev01" {
  description = "Output of dev01 LPGs"
  value       = module.dev01_network.local_peering_gateways
}