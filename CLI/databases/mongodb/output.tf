# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# output.tf
#
# Purpose: The following script defines the output for system created


output "ConfigNodes" {
  description = "MongoDB Config Server Instances"
  sensitive   = true
  value       = module.mongodb01.mongodb_config_servers
}

output "QueryNodes" {
  description = "MongoDB Query Server Instances"
  sensitive   = true
  value       = module.mongodb01.mongodb_query_servers
}

output "ShardNodes" {
  description = "MongoDB Shard Server Instances"
  sensitive   = true
  value       = module.mongodb01.mongodb_shard_servers
}
