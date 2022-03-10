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

output "qa01" {
  description = "qa01 Data"
  value       = module.qa01.compartment
}

output "qa01_artifacts" {
  description = "Artifact prd01 Data"
  value       = module.qa01_artifacts.compartment
}

output "qa01_network" {
  description = "Network qa01 Data"
  value       = module.qa01_network.compartment
}

output "hom01" {
  description = "hom01 Data"
  value       = module.hom01.compartment
}

output "hom01_artifacts" {
  description = "Artifact prd01 Data"
  value       = module.hom01_artifacts.compartment
}

output "hom01_network" {
  description = "Network hom01 Data"
  value       = module.hom01_network.compartment
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

output "sbx01" {
  description = "sbx01 Data"
  value       = module.sbx01.compartment
}

output "sbx01_artifacts" {
  description = "Artifact prd01 Data"
  value       = module.sbx01_artifacts.compartment
}

output "sbx01_network" {
  description = "Network sbx01 Data"
  value       = module.sbx01_network.compartment
}