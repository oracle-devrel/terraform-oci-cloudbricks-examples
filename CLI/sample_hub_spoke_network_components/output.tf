# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# output.tf
#
# Purpose: The following script defines the output for system created

output "network_hub01" {
  description = "VCN of HUB01"
  value       = module.hub01network.vcn

}

output "network_spoke01" {
  description = "VCN of SPOKE01"
  value       = module.spoke01network.vcn

}

output "network_spoke02" {
  description = "VCN of SPOKE02"
  value       = module.spoke02network.vcn

}

output "lpg_hub01" {
  description = "Output of HUB01 LPGs"
  value       = module.hub01network.local_peering_gateways
}

output "lpg_spoke01" {
  description = "Output of SPOKE01 LPGs"
  value       = module.spoke01network.local_peering_gateways
}

output "lpg_spoke02" {
  description = "Output of SPOKE02 LPGs"
  value       = module.spoke02network.local_peering_gateways
}