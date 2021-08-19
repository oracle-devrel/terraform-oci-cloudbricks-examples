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


module "hub01" {
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
  compartment_name        = var.hub01_compartment_name
  compartment_description = var.hub01_compartment_description
  enable_delete           = var.hub01_enable_delete
  ######################################## COMPARTMENT SPECIFIC VARIABLES ######################################

}

module "hub01_artifacts" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.hub01]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.hub01.compartment.name
  compartment_name        = var.hub01_artifacts_compartment_name
  compartment_description = var.hub01_artifacts_compartment_description
  enable_delete           = var.hub01_artifacts_enable_delete
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}

module "hub01_network" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.hub01]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.hub01.compartment.name
  compartment_name        = var.hub01_network_compartment_name
  compartment_description = var.hub01_network_compartment_description
  enable_delete           = var.hub01_network_enable_delete
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}


module "prd01" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.hub01]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## COMPARTMENT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.mainbizcomp.compartment.name
  compartment_name        = var.prd01_compartment_name
  compartment_description = var.prd01_compartment_description
  enable_delete           = var.prd01_enable_delete
  ######################################## COMPARTMENT SPECIFIC VARIABLES ######################################

}

module "prd01_artifacts" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.prd01]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.prd01.compartment.name
  compartment_name        = var.prd01_artifacts_compartment_name
  compartment_description = var.prd01_artifacts_compartment_description
  enable_delete           = var.prd01_artifacts_enable_delete
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}

module "prd01_network" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.prd01]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.prd01.compartment.name
  compartment_name        = var.prd01_network_compartment_name
  compartment_description = var.prd01_network_compartment_description
  enable_delete           = var.prd01_network_enable_delete
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################


}


module "qa01" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.hub01]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## COMPARTMENT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.mainbizcomp.compartment.name
  compartment_name        = var.qa01_compartment_name
  compartment_description = var.qa01_compartment_description
  enable_delete           = var.qa01_enable_delete
  ######################################## COMPARTMENT SPECIFIC VARIABLES ######################################

}

module "qa01_artifacts" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.qa01]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.qa01.compartment.name
  compartment_name        = var.qa01_artifacts_compartment_name
  compartment_description = var.qa01_artifacts_compartment_description
  enable_delete           = var.qa01_artifacts_enable_delete
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}

module "qa01_network" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.qa01]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.qa01.compartment.name
  compartment_name        = var.qa01_network_compartment_name
  compartment_description = var.qa01_network_compartment_description
  enable_delete           = var.qa01_network_enable_delete
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################


}

module "hom01" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.hub01]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## COMPARTMENT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.mainbizcomp.compartment.name
  compartment_name        = var.hom01_compartment_name
  compartment_description = var.hom01_compartment_description
  enable_delete           = var.hom01_enable_delete
  ######################################## COMPARTMENT SPECIFIC VARIABLES ######################################

}

module "hom01_artifacts" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.hom01]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.hom01.compartment.name
  compartment_name        = var.hom01_artifacts_compartment_name
  compartment_description = var.hom01_artifacts_compartment_description
  enable_delete           = var.hom01_artifacts_enable_delete
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}

module "hom01_network" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.hom01]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.hom01.compartment.name
  compartment_name        = var.hom01_network_compartment_name
  compartment_description = var.hom01_network_compartment_description
  enable_delete           = var.hom01_network_enable_delete
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}

module "dev01" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.hub01]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## COMPARTMENT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.mainbizcomp.compartment.name
  compartment_name        = var.dev01_compartment_name
  compartment_description = var.dev01_compartment_description
  enable_delete           = var.dev01_enable_delete
  ######################################## COMPARTMENT SPECIFIC VARIABLES ######################################

}

module "dev01_artifacts" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.dev01]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.dev01.compartment.name
  compartment_name        = var.dev01_artifacts_compartment_name
  compartment_description = var.dev01_artifacts_compartment_description
  enable_delete           = var.dev01_artifacts_enable_delete
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}

module "dev01_network" {
  providers = {
    oci.home = oci.home
  }
  source     = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git?ref=v1.0.1"
  depends_on = [module.dev01]
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  parent_compartment_name = module.dev01.compartment.name
  compartment_name        = var.dev01_network_compartment_name
  compartment_description = var.dev01_network_compartment_description
  enable_delete           = var.dev01_network_enable_delete
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################


}