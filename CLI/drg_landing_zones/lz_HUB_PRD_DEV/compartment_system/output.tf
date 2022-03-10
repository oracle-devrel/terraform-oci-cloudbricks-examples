# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# output.tf
#
# Purpose: The following script defines the output for system created


output "hub01" {
  description = "hub01 Data"
  value       = module.hub01.compartment
}

output "prd01" {
  description = "prd01 Data"
  value       = module.prd01.compartment
}

output "prd01_artifacts" {
  description = "Artifact prd01 Data"
  value       = module.prd01_artifacts.compartment
}

output "prd01_network" {
  description = "Network prd01 Data"
  value       = module.prd01_network.compartment
}

output "dev01" {
  description = "dev01 Data"
  value       = module.dev01.compartment
}

output "dev01_artifacts" {
  description = "Artifact prd01 Data"
  value       = module.dev01_artifacts.compartment
}

output "dev01_network" {
  description = "Network dev01 Data"
  value       = module.dev01_network.compartment
}