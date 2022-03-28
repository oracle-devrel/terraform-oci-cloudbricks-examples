# Copyright (c) 2022 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# output.tf
#
# Purpose: The following script defines the output for system created


output "mysql" {
  description = "Instance of MySQL database"
  sensitive   = true
  value       = module.mysql01.mysql_db_system
}

