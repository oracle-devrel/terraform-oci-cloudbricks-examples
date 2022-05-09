# Copyright (c) 2022 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# main.tf
#
# Purpose: Defines all the components related to environment


module "mysql01" {
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-mysql-database?ref=v1.0.4.1"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  region           = var.region
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  mysql_instance_compartment_name                 = var.mysql01_mysql_instance_compartment_name
  mysql_network_compartment_name                  = var.mysql01_mysql_network_compartment_name
  vcn_display_name                                = var.mysql01_vcn_display_name
  network_subnet_name                             = var.mysql01_network_subnet_name
  mysql_db_system_admin_username                  = var.mysql01_mysql_db_system_admin_username
  mysql_db_system_admin_password                  = var.mysql01_mysql_db_system_admin_password
  mysql_db_system_availability_domain             = var.mysql01_mysql_db_system_availability_domain
  mysql_shape_name                                = var.mysql01_mysql_shape_name
  mysql_db_system_backup_policy_is_enabled        = var.mysql01_mysql_db_system_backup_policy_is_enabled
  mysql_db_system_backup_policy_retention_in_days = var.mysql01_mysql_db_system_backup_policy_retention_in_days
  mysql_db_system_backup_policy_window_start_time = var.mysql01_mysql_db_system_backup_policy_window_start_time
  mysql_db_system_data_storage_size_in_gb         = var.mysql01_mysql_db_system_data_storage_size_in_gb
  mysql_db_system_description                     = var.mysql01_mysql_db_system_description
  mysql_db_system_display_name                    = var.mysql01_mysql_db_system_display_name
  mysql_db_system_fault_domain                    = var.mysql01_mysql_db_system_fault_domain
  mysql_db_system_hostname_label                  = var.mysql01_mysql_db_system_hostname_label
  mysql_db_system_is_highly_available             = var.mysql01_mysql_db_system_is_highly_available
  mysql_db_system_maintenance_window_start_time   = var.mysql01_mysql_db_system_maintenance_window_start_time
  mysql_db_system_port                            = var.mysql01_mysql_db_system_port
  mysql_db_system_port_x                          = var.mysql01_mysql_db_system_port_x
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  ######################################## HEATWAVE SPECIFIC VARIABLES ######################################
  mysql_heatwave_enabled                          = var.mysql01_mysql_heatwave_enabled
  mysql_heatwave_cluster_size                     = var.mysql01_mysql_heatwave_cluster_size
  mysql_heatwave_shape                            = var.mysql01_mysql_heatwave_shape
  ######################################## HEATWAVE SPECIFIC VARIABLES ######################################
}
