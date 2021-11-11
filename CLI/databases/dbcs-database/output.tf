# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# output.tf
#
# Purpose: The following script defines the output for system created


output "DBNodesScanIPs" {
  description = "Nodes SCAN IPs"
  value       = module.dbcs01.db_nodes_scan_ips
}


output "DBNodesVIPInfo" {
  description = "VIP hostname-IP map"
  value       = module.dbcs01.db_nodes_vip_info
}

output "DBNodesInfo" {
  description = "DB Node hostname-IP map"
  value       = module.dbcs01.db_nodes_info
}

output "DBCSDBSystem" {
  description = "Database DB System instance"
  value       = module.dbcs01.dbcs_db_system
  sensitive   = true
}
