# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# output.tf
#
# Purpose: The following script defines the output for system created

output "MasterNode" {
  description = "Redis Master Instance"
  sensitive   = true
  value       = module.redis01.redis_master_server
}

output "ReplicaNodes" {
  description = "Redis Replica Instances"
  sensitive   = true
  value       = module.redis01.redis_replica_servers
}
