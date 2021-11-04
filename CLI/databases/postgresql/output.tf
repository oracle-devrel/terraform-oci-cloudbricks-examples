# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# output.tf
#
# Purpose: The following script defines the output for system created

output "MasterNode" {
  description = "Master Node Information"
  sensitive = true
  value = module.postgre01.PostgreSQL_Master
}

output "Username" {
  description = "Username for PostgreSQL"
  value = module.postgre01.PostgreSQL_Username
}