# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# output.tf
#
# Purpose: The following script defines the output for system created

output "instance01" {
  description = "Compute Instances"
  value       = module.instance01.instance
}

output "fssdisk01" {
  description = "File Storage System"
  value       = module.fssdisk01.*.FSS
}

output "MasterNode" {
  description = "Master Node Information"
  value       = module.postgre01.PostgreSQL_Master
}

output "Username" {
  description = "Username for PostgreSQL"
  value       = module.postgre01.PostgreSQL_Username
}

output "loadbalancer01" {
  description = "loadbalancer01 data"
  value       = module.loadbalancer01.app_lbaas_instance
}

output "backendset01" {
  description = "backendset01 data"
  value       = module.backendset01.application_bes_instance
}