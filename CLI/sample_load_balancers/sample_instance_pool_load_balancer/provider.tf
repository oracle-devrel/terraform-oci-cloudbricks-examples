# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# provider.tf
#
# Purpose: The following file defines the providers used in this implementation

terraform {
  required_version = ">= 0.13.5"
  required_providers {
    oci = {
      source                = "hashicorp/oci"
      version               = ">= 4.36.0"
      configuration_aliases = [oci.home]
    }
  }
}

provider "oci" {
  region               = var.region
  tenancy_ocid         = var.tenancy_ocid
  user_ocid            = var.user_ocid
  fingerprint          = var.fingerprint
  private_key_path     = var.private_key_path
  disable_auto_retries = "true"
}


provider "oci" {
  alias                = "home"
  region               = data.oci_identity_region_subscriptions.home_region_subscriptions.region_subscriptions[0].region_name
  tenancy_ocid         = var.tenancy_ocid
  user_ocid            = var.user_ocid
  fingerprint          = var.fingerprint
  private_key_path     = var.private_key_path
  disable_auto_retries = "true"
}
