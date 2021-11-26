# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# output.tf
#
# Purpose: The following script defines the output for system created


output "BastionService" {
  description = "The Bastion Service Details"
  value = module.bastion_service01.bastionservice
}

output "BastionSessions" {
  description = "A list of the provisioned Bastion Sessions"
  value = module.bastion_session01.*.bastionsessions
}

output "Computes" {
  description = "A list of the provisioned computes"
  value = module.compute01.instance
}
