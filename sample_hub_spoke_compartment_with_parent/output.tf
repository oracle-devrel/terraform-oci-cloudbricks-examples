# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# output.tf
#
# Purpose: The following script defines the output for system created


output "hub01comp" {
  description = "hub01comp Data"
  value       = module.hub01comp.compartment
}

output "spoke01comp" {
  description = "spoke01comp Data"
  value       = module.spoke01comp.compartment
}

output "artifact_spoke01comp" {
  description = "Artifact spoke01comp Data"
  value       = module.artifact_spoke01comp.compartment
}

output "network_spoke01comp" {
  description = "Network spoke01comp Data"
  value       = module.network_spoke01comp.compartment
}

output "spoke02comp" {
  description = "spoke02comp Data"
  value       = module.spoke02comp.compartment
}

output "artifact_spoke02comp" {
  description = "Artifact spoke01comp Data"
  value       = module.artifact_spoke02comp.compartment
}

output "network_spoke02comp" {
  description = "Network spoke02comp Data"
  value       = module.network_spoke02comp.compartment
}