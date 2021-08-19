# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# main.tf
#
# Purpose: Defines all the components related to environment


module "mainbizcomp" {

  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  providers = {
    oci.home = oci.home
  }
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## COMPARTMENT SPECIFIC VARIABLES ######################################
  is_root_parent          = var.mainbizcomp_is_root_parent
  root_compartment_ocid   = var.mainbizcomp_root_compartment_ocid
  compartment_name        = var.mainbizcomp_compartment_name
  compartment_description = var.mainbizcomp_compartment_description
  enable_delete           = var.mainbizcomp_enable_delete
  ######################################## COMPARTMENT SPECIFIC VARIABLES ######################################

}


module "hub01comp" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.mainbizcomp]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## COMPARTMENT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.mainbizcomp.compartment.name
  compartment_name        = var.hub01comp_compartment_name
  compartment_description = var.hub01comp_compartment_description
  enable_delete           = var.hub01comp_enable_delete
  ######################################## COMPARTMENT SPECIFIC VARIABLES ######################################

}

module "artifact_hub01comp" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.hub01comp]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.hub01comp.compartment.name
  compartment_name        = var.artifact_hub01comp_compartment_name
  compartment_description = var.artifact_hub01comp_compartment_description
  enable_delete           = var.artifact_hub01comp_enable_delete
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}

module "network_hub01comp" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.hub01comp]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.hub01comp.compartment.name
  compartment_name        = var.network_hub01comp_compartment_name
  compartment_description = var.network_hub01comp_compartment_description
  enable_delete           = var.network_hub01comp_enable_delete
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}


module "spoke01comp" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.hub01comp]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## COMPARTMENT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.mainbizcomp.compartment.name
  compartment_name        = var.spoke01comp_compartment_name
  compartment_description = var.spoke01comp_compartment_description
  enable_delete           = var.spoke01comp_enable_delete
  ######################################## COMPARTMENT SPECIFIC VARIABLES ######################################

}

module "artifact_spoke01comp" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.spoke01comp]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.spoke01comp.compartment.name
  compartment_name        = var.artifact_spoke01comp_compartment_name
  compartment_description = var.artifact_spoke01comp_compartment_description
  enable_delete           = var.artifact_spoke01comp_enable_delete
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}

module "network_spoke01comp" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.spoke01comp]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.spoke01comp.compartment.name
  compartment_name        = var.network_spoke01comp_compartment_name
  compartment_description = var.network_spoke01comp_compartment_description
  enable_delete           = var.network_spoke01comp_enable_delete
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################


}


module "spoke02comp" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.hub01comp]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## COMPARTMENT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.mainbizcomp.compartment.name
  compartment_name        = var.spoke02comp_compartment_name
  compartment_description = var.spoke02comp_compartment_description
  enable_delete           = var.spoke02comp_enable_delete
  ######################################## COMPARTMENT SPECIFIC VARIABLES ######################################

}

module "artifact_spoke02comp" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.spoke02comp]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.spoke02comp.compartment.name
  compartment_name        = var.artifact_spoke02comp_compartment_name
  compartment_description = var.artifact_spoke02comp_compartment_description
  enable_delete           = var.artifact_spoke02comp_enable_delete
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}

module "network_spoke02comp" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.spoke02comp]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.spoke02comp.compartment.name
  compartment_name        = var.network_spoke02comp_compartment_name
  compartment_description = var.network_spoke02comp_compartment_description
  enable_delete           = var.network_spoke02comp_enable_delete
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################


}