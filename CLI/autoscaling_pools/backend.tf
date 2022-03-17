# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# backend.tf
#
# Purpose:Handles the storage of tfstate file in backend bucket


/*terraform {
  backend "s3" {
    bucket   = "tfstate_bucket"
    key      = "Samples/oke_cluster.tfstate"
    region   = "re-region-1"
    endpoint = "https://Tenancy_ObjectStorage_namespace.compat.objectstorage.re-region-1.oraclecloud.com"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}*/

terraform {
  backend "s3" {
    bucket   = "npier-nested-bucket-20220309-0801"
    key      = "Samples/auto1.tfstate"
    region   = "uk-london-1"
    endpoint = "https://idhkis4m3p5e.compat.objectstorage.uk-london-1.oraclecloud.com"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}
