/* backend.tf
Author: DALQUINT - denny.alquinta@oracle.com
Purpose: Handles the storage of tfstate file in backend bucket
Copyright (c) 2017, 2021, Oracle and/or its affiliates. All rights reserved. */

terraform {
  backend "s3" {
    bucket   = "tfstate_bucket"
    key      = "Samples/sample_hub_spoke_compartment_with_parent.tfstate"
    region   = "sa-santiago-1"
    endpoint = "https://idhkis4m3p5e.compat.objectstorage.sa-santiago-1.oraclecloud.com"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}