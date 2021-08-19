# OCI Cloud Bricks: Sample Landing Zone - HUB PRD DEV

[![License: UPL](https://img.shields.io/badge/license-UPL-green)](https://img.shields.io/badge/license-UPL-green) [![Quality gate](https://sonarcloud.io/api/project_badges/quality_gate?project=oracle-devrel_terraform-oci-cloudbricks-examples)](https://sonarcloud.io/dashboard?id=oracle-devrel_terraform-oci-cloudbricks-examples)

## Introduction
The following collection of systems provision a full landing zone containing both compartment and network structure. The following is the reference architecture for both systems:

![Reference Architecture](./images/Bricks_Architectures-lz_HUB_PRD_DEV.jpeg)

## Getting Started
For details in how the Oracle CloudBricks Framework works, refer to the [following file](../README.md)

### Prerequisites
- A Pre-Created Object Storage Bucket to store tfstate files
- a Pre-Installed Executor with CLI installed. For instructions in how to install CLI, go to the [following link](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliinstall.htm)
- A Pre-Configured .oci/config file with API Keys. For details in how to do this step, go to the [following link](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/apisigningkey.htm). File should look similar to this: 
  
```shell
[DEFAULT]
user=ocid1.user.oc1..aaaaaaaafoobarfoobarfoobar
fingerprint=9a:9e:13:cf:94:6e:2c:b9:54:D1:60:0d:e4:14:8b:5e
tenancy=ocid1.tenancy.oc1..aaaaaaaaoqdyfoobarfoobarfoobar
region=re-region-1
key_file=/full/path/to/api/key/my_api_key.pem
```

- A Pre-Configured .aws/credentials file with values from pre-created Customer Secret Keys. File should look similar to this: 

```shell
[default]
aws_access_key_id=202ad26f6546c71cc8990c821eece00a6b543ss114144a21231
aws_secret_access_key=xgYpRAiel5Yxrc9G67MGddaskjdhalsdiujlewiH3Nx884784X4ZMe4=
```

For instructions in how to create Customer Secret Keys, go to the [following link](https://docs.oracle.com/en-us/iaas/Content/Identity/Tasks/managingcredentials.htm#To4)

## System Creation

In order to create the systems, execute as follows: 

0. Update the system's corresponding `system.tfvars`file to specific needs. Example included complies with reference architecture diagram
   - For Compartment System: 

```shell
# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# system.tfvars
#
# Purpose: The following script defines the system particular variables to provision environment


######################################## PROVIDER SPECIFIC VARIABLES ######################################
tenancy_ocid     = "ocid1.tenancy.oc1..foobarbar"
region           = "re-region-1"
user_ocid        = "ocid1.user.oc1..foobarbar"
fingerprint      = "fo:oo:ba:ar:ba:ar"
private_key_path = "/foo/bar/path/oci_api_key.pem"
######################################## PROVIDER SPECIFIC VARIABLES ######################################


######################################## mainbizcomp SPECIFIC VARIABLES ######################################
mainbizcomp_is_root_parent          = true
mainbizcomp_root_compartment_ocid   = "ocid1.tenancy.oc1..foobar"
mainbizcomp_compartment_name        = "MAIN_COMPARTMENT_04"
mainbizcomp_compartment_description = "Terraform created Main Business Compartment"
mainbizcomp_enable_delete           = true
######################################## mainbizcomp SPECIFIC VARIABLES ######################################


######################################## hub01 SPECIFIC VARIABLES ######################################
hub01_compartment_name        = "HUB01_04"
hub01_compartment_description = "Terraform created HUB Compartment"
hub01_enable_delete           = true
######################################## hub01 SPECIFIC VARIABLES ######################################
######################################## hub01 Artifact SPECIFIC VARIABLES ######################################
hub01_artifacts_compartment_name        = "HUB01_ARTIFACTS_04"
hub01_artifacts_compartment_description = "Terraform created HUB Artifact Compartment"
hub01_artifacts_enable_delete           = true
######################################## hub01 Artifact SPECIFIC VARIABLES ######################################
######################################## hub01 Network SPECIFIC VARIABLES ######################################
hub01_network_compartment_name        = "HUB01_NETWORK_04"
hub01_network_compartment_description = "Terraform created HUB Network Compartment"
hub01_network_enable_delete           = true
######################################## hub01 Network SPECIFIC VARIABLES ######################################

######################################## prd01 SPECIFIC VARIABLES ######################################
prd01_compartment_name        = "PRD01_04"
prd01_compartment_description = "Terraform created prd01 Compartment"
prd01_enable_delete           = true
######################################## prd01 SPECIFIC VARIABLES ######################################
######################################## prd01 Artifact SPECIFIC VARIABLES ######################################
prd01_artifacts_compartment_name        = "PRD01_ARTIFACTS_04"
prd01_artifacts_compartment_description = "Terraform created prd01 Artifact Compartment"
prd01_artifacts_enable_delete           = true
######################################## prd01 Artifact SPECIFIC VARIABLES ######################################
######################################## prd01 Network SPECIFIC VARIABLES ######################################
prd01_network_compartment_name        = "PRD01_NETWORK_04"
prd01_network_compartment_description = "Terraform created prd01 Network Compartment"
prd01_network_enable_delete           = true
######################################## prd01 Network SPECIFIC VARIABLES ######################################

######################################## qa01 SPECIFIC VARIABLES ######################################
qa01_compartment_name        = "QA01_04"
qa01_compartment_description = "Terraform created qa01 Compartment"
qa01_enable_delete           = true
######################################## qa01 SPECIFIC VARIABLES ######################################
######################################## qa01 Artifact SPECIFIC VARIABLES ######################################
qa01_artifacts_compartment_name        = "QA01_ARTIFACTS_04"
qa01_artifacts_compartment_description = "Terraform created qa01 Artifact Compartment"
qa01_artifacts_enable_delete           = true
######################################## qa01 Artifact SPECIFIC VARIABLES ######################################
######################################## qa01 Network SPECIFIC VARIABLES ######################################
qa01_network_compartment_name        = "QA01_NETWORK_04"
qa01_network_compartment_description = "Terraform created qa01 Network Compartment"
qa01_network_enable_delete           = true
######################################## qa01 Network SPECIFIC VARIABLES ######################################

######################################## hom01 SPECIFIC VARIABLES ######################################
hom01_compartment_name        = "HOM01_04"
hom01_compartment_description = "Terraform created hom01 Compartment"
hom01_enable_delete           = true
######################################## hom01 SPECIFIC VARIABLES ######################################
######################################## hom01 Artifact SPECIFIC VARIABLES ######################################
hom01_artifacts_compartment_name        = "HOM01_ARTIFACTS_04"
hom01_artifacts_compartment_description = "Terraform created hom01 Artifact Compartment"
hom01_artifacts_enable_delete           = true
######################################## hom01 Artifact SPECIFIC VARIABLES ######################################
######################################## hom01 Network SPECIFIC VARIABLES ######################################
hom01_network_compartment_name        = "HOM01_NETWORK_04"
hom01_network_compartment_description = "Terraform created hom01 Network Compartment"
hom01_network_enable_delete           = true
######################################## hom01 Network SPECIFIC VARIABLES ######################################

######################################## dev01 SPECIFIC VARIABLES ######################################
dev01_compartment_name        = "DEV01_04"
dev01_compartment_description = "Terraform created dev01 Compartment"
dev01_enable_delete           = true
######################################## dev01 SPECIFIC VARIABLES ######################################
######################################## dev01 Artifact SPECIFIC VARIABLES ######################################
dev01_artifacts_compartment_name        = "DEV01_ARTIFACTS_04"
dev01_artifacts_compartment_description = "Terraform created dev01 Artifact Compartment"
dev01_artifacts_enable_delete           = true
######################################## dev01 Artifact SPECIFIC VARIABLES ######################################
######################################## dev01 Network SPECIFIC VARIABLES ######################################
dev01_network_compartment_name        = "DEV01_NETWORK_04"
dev01_network_compartment_description = "Terraform created dev01 Network Compartment"
dev01_network_enable_delete           = true
######################################## dev01 Network SPECIFIC VARIABLES ######################################

######################################## sbx01 SPECIFIC VARIABLES ######################################
sbx01_compartment_name        = "SBX01_04"
sbx01_compartment_description = "Terraform created sbx01 Compartment"
sbx01_enable_delete           = true
######################################## sbx01 SPECIFIC VARIABLES ######################################
######################################## sbx01 Artifact SPECIFIC VARIABLES ######################################
sbx01_artifacts_compartment_name        = "SBX01_ARTIFACTS_04"
sbx01_artifacts_compartment_description = "Terraform created sbx01 Artifact Compartment"
sbx01_artifacts_enable_delete           = true
######################################## sbx01 Artifact SPECIFIC VARIABLES ######################################
######################################## sbx01 Network SPECIFIC VARIABLES ######################################
sbx01_network_compartment_name        = "SBX01_NETWORK_04"
sbx01_network_compartment_description = "Terraform created sbx01 Network Compartment"
sbx01_network_enable_delete           = true
######################################## sbx01 Network SPECIFIC VARIABLES ######################################
```

- For Network System

```shell
# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# system.tfvars
#
# Purpose: The following script defines the system particular variables to provision environment


######################################## PROVIDER SPECIFIC VARIABLES ######################################
tenancy_ocid     = "ocid1.tenancy.oc1..foobarbar"
region           = "re-region-1"
user_ocid        = "ocid1.user.oc1..foobarbar"
fingerprint      = "fo:oo:ba:ar:ba:ar"
private_key_path = "/foo/bar/path/oci_api_key.pem"
######################################## PROVIDER SPECIFIC VARIABLES ######################################


######################################## HUB NETWORK SPECIFIC VARIABLES ######################################
hub01_network_vcn_cidr_blocks                     = ["10.0.0.0/16"]
hub01_network_private_subnet_cidr_block_map       = { "hub01_pvtsn01" : "10.0.0.0/23", "hub01_pvtsn02" : "10.0.2.0/23", "hub01_pvtsn03" : "10.0.4.0/23" }
hub01_network_public_subnet_cidr_block_map        = { "hub01_pubsn01" : "10.0.6.0/23", "hub01_pubsn02" : "10.0.8.0/23", "hub01_pubsn03" : "10.0.10.0/23" }
hub01_network_vcn_display_name                    = "HUB01_VCN"
hub01_network_vcn_network_compartment_name        = "HUB01_NETWORK_04"
hub01_network_dhcp_options_display_name           = "hub01_DHCP_Options"
hub01_network_custom_search_domain                = "test.com"
hub01_network_private_route_table_display_name    = "hub01_pvt_hub_rt"
hub01_network_public_route_table_display_name     = "hub01_pub_hub_rt"
hub01_network_private_security_list_display_name  = "hub01_pvt_hub_sl"
hub01_network_public_security_list_display_name   = "hub01_pub_hub_sl"
hub01_network_service_gateway_display_name        = "hub01_SVC_GW"
hub01_network_nat_gateway_display_name            = "hub01_NAT_GW"
hub01_network_internet_gateway_display_name       = "hub01_INET_GW"
hub01_network_lpg_count                           = 5
hub01_network_lpg_display_name_base               = "hub01_LPG"
hub01_network_peered_vcn_network_compartment_name = ""
hub01_network_peered_lpg_display_name             = ""
hub01_network_is_spoke                            = false
######################################## HUB NETWORK SPECIFIC VARIABLES SPECIFIC VARIABLES ######################################


######################################## prd01 NETWORK SPECIFIC VARIABLES ######################################
prd01_network_vcn_cidr_blocks                     = ["11.0.0.0/16"]
prd01_network_private_subnet_cidr_block_map       = { "prd01_pvtsn01" : "11.0.0.0/23", "prd01_pvtsn02" : "11.0.2.0/23", "prd01_pvtsn03" : "11.0.4.0/23" }
prd01_network_public_subnet_cidr_block_map        = { "prd01_pubsn01" : "11.0.6.0/23", "prd01_pubsn02" : "11.0.8.0/23", "prd01_pubsn03" : "11.0.10.0/23" }
prd01_network_vcn_display_name                    = "PRD01_VCN"
prd01_network_vcn_network_compartment_name        = "PRD01_NETWORK_04"
prd01_network_dhcp_options_display_name           = "prd01_DHCP_Options"
prd01_network_custom_search_domain                = "test.com"
prd01_network_private_route_table_display_name    = "prd01_pvt_hub_rt"
prd01_network_public_route_table_display_name     = "prd01_pub_hub_rt"
prd01_network_private_security_list_display_name  = "prd01_pvt_hub_sl"
prd01_network_public_security_list_display_name   = "prd01_pub_hub_sl"
prd01_network_service_gateway_display_name        = "prd01_SVC_GW"
prd01_network_nat_gateway_display_name            = "prd01_NAT_GW"
prd01_network_internet_gateway_display_name       = "INET_GW"
prd01_network_lpg_count                           = 1
prd01_network_lpg_display_name_base               = "prd01_LPG"
prd01_network_peered_vcn_network_compartment_name = "HUB01_NETWORK_04"
prd01_network_peered_lpg_display_name             = "hub01_LPG01"
prd01_network_is_spoke                            = true
######################################## prd01 NETWORK SPECIFIC VARIABLES SPECIFIC VARIABLES ######################################

######################################## qa01 NETWORK SPECIFIC VARIABLES ######################################
qa01_network_vcn_cidr_blocks                     = ["12.0.0.0/16"]
qa01_network_private_subnet_cidr_block_map       = { "qa01_pvtsn01" : "12.0.0.0/23", "qa01_pvtsn02" : "12.0.2.0/23", "qa01_pvtsn03" : "12.0.4.0/23" }
qa01_network_public_subnet_cidr_block_map        = { "qa01_pubsn01" : "12.0.6.0/23", "qa01_pubsn02" : "12.0.8.0/23", "qa01_pubsn03" : "12.0.10.0/23" }
qa01_network_vcn_display_name                    = "QA01_VCN"
qa01_network_vcn_network_compartment_name        = "QA01_NETWORK_04"
qa01_network_dhcp_options_display_name           = "qa01_DHCP_Options"
qa01_network_custom_search_domain                = "test.com"
qa01_network_private_route_table_display_name    = "qa01_pvt_hub_rt"
qa01_network_public_route_table_display_name     = "qa01_pub_hub_rt"
qa01_network_private_security_list_display_name  = "qa01_pvt_hub_sl"
qa01_network_public_security_list_display_name   = "qa01_pub_hub_sl"
qa01_network_service_gateway_display_name        = "qa01_SVC_GW"
qa01_network_nat_gateway_display_name            = "qa01_NAT_GW"
qa01_network_internet_gateway_display_name       = "INET_GW"
qa01_network_lpg_count                           = 1
qa01_network_lpg_display_name_base               = "qa01_LPG"
qa01_network_peered_vcn_network_compartment_name = "HUB01_NETWORK_04"
qa01_network_peered_lpg_display_name             = "hub01_LPG02"
qa01_network_is_spoke                            = true
######################################## qa01 NETWORK SPECIFIC VARIABLES SPECIFIC VARIABLES ######################################

######################################## hom01 NETWORK SPECIFIC VARIABLES ######################################
hom01_network_vcn_cidr_blocks                     = ["13.0.0.0/16"]
hom01_network_private_subnet_cidr_block_map       = { "hom01_pvtsn01" : "13.0.0.0/23", "hom01_pvtsn02" : "13.0.2.0/23", "hom01_pvtsn03" : "13.0.4.0/23" }
hom01_network_public_subnet_cidr_block_map        = { "hom01_pubsn01" : "13.0.6.0/23", "hom01_pubsn02" : "13.0.8.0/23", "hom01_pubsn03" : "13.0.10.0/23" }
hom01_network_vcn_display_name                    = "HOM01_VCN"
hom01_network_vcn_network_compartment_name        = "HOM01_NETWORK_04"
hom01_network_dhcp_options_display_name           = "hom01_DHCP_Options"
hom01_network_custom_search_domain                = "test.com"
hom01_network_private_route_table_display_name    = "hom01_pvt_hub_rt"
hom01_network_public_route_table_display_name     = "hom01_pub_hub_rt"
hom01_network_private_security_list_display_name  = "hom01_pvt_hub_sl"
hom01_network_public_security_list_display_name   = "hom01_pub_hub_sl"
hom01_network_service_gateway_display_name        = "hom01_SVC_GW"
hom01_network_nat_gateway_display_name            = "hom01_NAT_GW"
hom01_network_internet_gateway_display_name       = "hom01_INET_GW"
hom01_network_lpg_count                           = 1
hom01_network_lpg_display_name_base               = "hom01_LPG"
hom01_network_peered_vcn_network_compartment_name = "HUB01_NETWORK_04"
hom01_network_peered_lpg_display_name             = "hub01_LPG03"
hom01_network_is_spoke                            = true
######################################## prd01 NETWORK SPECIFIC VARIABLES SPECIFIC VARIABLES ###################

######################################## dev01 NETWORK SPECIFIC VARIABLES ######################################
dev01_network_vcn_cidr_blocks                     = ["14.0.0.0/16"]
dev01_network_private_subnet_cidr_block_map       = { "dev01_pvtsn01" : "14.0.0.0/23", "dev01_pvtsn02" : "14.0.2.0/23", "dev01_pvtsn03" : "14.0.4.0/23" }
dev01_network_public_subnet_cidr_block_map        = { "dev01_pubsn01" : "14.0.6.0/23", "dev01_pubsn02" : "14.0.8.0/23", "dev01_pubsn03" : "14.0.10.0/23" }
dev01_network_vcn_display_name                    = "DEV01_VCN"
dev01_network_vcn_network_compartment_name        = "DEV01_NETWORK_04"
dev01_network_dhcp_options_display_name           = "dev01_DHCP_Options"
dev01_network_custom_search_domain                = "test.com"
dev01_network_private_route_table_display_name    = "dev01_pvt_hub_rt"
dev01_network_public_route_table_display_name     = "dev01_pub_hub_rt"
dev01_network_private_security_list_display_name  = "dev01_pvt_hub_sl"
dev01_network_public_security_list_display_name   = "dev01_pub_hub_sl"
dev01_network_service_gateway_display_name        = "dev01_SVC_GW"
dev01_network_nat_gateway_display_name            = "dev01_NAT_GW"
dev01_network_internet_gateway_display_name       = "dev01_INET_GW"
dev01_network_lpg_count                           = 1
dev01_network_lpg_display_name_base               = "dev01_LPG"
dev01_network_peered_vcn_network_compartment_name = "HUB01_NETWORK_04"
dev01_network_peered_lpg_display_name             = "hub01_LPG04"
dev01_network_is_spoke                            = true
######################################## prd01 NETWORK SPECIFIC VARIABLES SPECIFIC VARIABLES ###################

######################################## sbx01 NETWORK SPECIFIC VARIABLES ######################################
sbx01_network_vcn_cidr_blocks                     = ["15.0.0.0/16"]
sbx01_network_private_subnet_cidr_block_map       = { "sbx01_pvtsn01" : "15.0.0.0/23", "sbx01_pvtsn02" : "15.0.2.0/23", "sbx01_pvtsn03" : "15.0.4.0/23" }
sbx01_network_public_subnet_cidr_block_map        = { "sbx01_pubsn01" : "15.0.6.0/23", "sbx01_pubsn02" : "15.0.8.0/23", "sbx01_pubsn03" : "15.0.10.0/23" }
sbx01_network_vcn_display_name                    = "SBX01_VCN"
sbx01_network_vcn_network_compartment_name        = "SBX01_NETWORK_04"
sbx01_network_dhcp_options_display_name           = "sbx01_DHCP_Options"
sbx01_network_custom_search_domain                = "test.com"
sbx01_network_private_route_table_display_name    = "sbx01_pvt_hub_rt"
sbx01_network_public_route_table_display_name     = "sbx01_pub_hub_rt"
sbx01_network_private_security_list_display_name  = "sbx01_pvt_hub_sl"
sbx01_network_public_security_list_display_name   = "sbx01_pub_hub_sl"
sbx01_network_service_gateway_display_name        = "sbx01_SVC_GW"
sbx01_network_nat_gateway_display_name            = "sbx01_NAT_GW"
sbx01_network_internet_gateway_display_name       = "sbx01_INET_GW"
sbx01_network_lpg_count                           = 1
sbx01_network_lpg_display_name_base               = "sbx01_LPG"
sbx01_network_peered_vcn_network_compartment_name = "HUB01_NETWORK_04"
sbx01_network_peered_lpg_display_name             = "hub01_LPG05"
sbx01_network_is_spoke                            = true
######################################## prd01 NETWORK SPECIFIC VARIABLES SPECIFIC VARIABLES ###################
```

1. Create Compartment System
   - Run: `./provisionInfra.sh sample_landing_zones/lz_HUB_PRD_DEV/network_system/`
   - A dialog as follows will appear: 

```shell
[opc@dalquintdevhubscl terraform-oci-cloudbricks-examples]$ ./provisionInfra.sh sample_landing_zones/lz_HUB_PRD_DEV/compartment_system/
Sourcing environment variables
**************************************************************************  WARNING  *********************************************************************************
*   The following script will provision infrastructure. Type 'yes' and hit enter, if you want to continue. Neglecting something here may drop entire infrastructure  *
**************************************************************************  WARNING  *********************************************************************************
```
   - Type in `yes`
   - Compartment System will initiate its creation

2. Create Network System
   - Run: `./provisionInfra.sh sample_landing_zones/lz_HUB_PRD_DEV/network_system/`
   - A dialog as follows will appear: 

```shell
[opc@dalquintdevhubscl terraform-oci-cloudbricks-examples]$ ./provisionInfra.sh sample_landing_zones/lz_HUB_PRD_DEV/network_system/
Sourcing environment variables
**************************************************************************  WARNING  *********************************************************************************
*   The following script will provision infrastructure. Type 'yes' and hit enter, if you want to continue. Neglecting something here may drop entire infrastructure  *
**************************************************************************  WARNING  *********************************************************************************
```
   - Type in `yes`
   - Network System will initiate its creation

## Components
Each system contains the following components: 

### [backend.tf](./backend.tf)

This file defines the S3 compatibility API integration to store .tfstate file into an OCI Bucket. It's content is the following: 

```go
terraform {
  backend "s3" {
    bucket   = "Precreated_bucket_to_store_tfstate_files_name"
    key      = "Samples/system_name.tfstate"
    region   = "re-region-1"
    endpoint = "https://Tenancy_ObjectStorage_namespace.compat.objectstorage.re-region-1.oraclecloud.com"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}
```

*Considerations*

- The `bucket` variable, requires the display name of the bucket where tfstate files will be stored
- The `key` variable, supports a structure of your choice, by providing `/`as separators. Name of the file should always be `system_name.tfstate`
- The `region` variable contains the name id of the region where the system is being deployed at
- The `endpoint` variable contains the concatenation of the tenancy namespace and the region as depicted on above example. For instructions in how to determine the Tenancy Object Storage namespace, refer to the [following documentation](https://docs.oracle.com/en-us/iaas/Content/Object/Tasks/understandingnamespaces.htm)
- The rest of *variables* require to be set as is. **Do not change nor update these values**


### [datasource.tf](./datasource.tf)
This file defines the datasources required for internal tracking lookup on Open Source Project. Do not alter this file

### [main.tf](./main.tf) 
This file defines the main orchestration of module. 

For compartment System, the following structure is expected

```go
module "ModuleName" {
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-network-artifacts.git?ref=v1.0.0"
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
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  vcn_network_compartment_name        = var.ModuleName_vcn_network_compartment_name
  vcn_cidr_blocks                     = var.ModuleName_vcn_cidr_blocks
  private_subnet_cidr_block_map       = var.ModuleName_private_subnet_cidr_block_map
  public_subnet_cidr_block_map        = var.ModuleName_public_subnet_cidr_block_map
  vcn_display_name                    = var.ModuleName_vcn_display_name
  dhcp_options_display_name           = var.ModuleName_dhcp_options_display_name
  custom_search_domain                = var.ModuleName_custom_search_domain
  private_route_table_display_name    = var.ModuleName_private_route_table_display_name
  public_route_table_display_name     = var.ModuleName_public_route_table_display_name
  private_security_list_display_name  = var.ModuleName_private_security_list_display_name
  public_security_list_display_name   = var.ModuleName_public_security_list_display_name
  service_gateway_display_name        = var.ModuleName_service_gateway_display_name
  nat_gateway_display_name            = var.ModuleName_nat_gateway_display_name
  internet_gateway_display_name       = var.ModuleName_internet_gateway_display_name
  lpg_count                           = var.ModuleName_lpg_count
  lpg_display_name_base               = var.ModuleName_lpg_display_name_base
  peered_vcn_network_compartment_name = var.ModuleName_peered_vcn_network_compartment_name
  peered_lpg_display_name             = var.ModuleName_peered_lpg_display_name
  is_spoke                            = var.ModuleName_is_spoke
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}
```

For Network System, the following structure is expected

```shell
module "ModuleName_network" {
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-network-artifacts.git?ref=v1.0.1"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  vcn_network_compartment_name        = var.ModuleName_network_vcn_network_compartment_name
  vcn_cidr_blocks                     = var.ModuleName_network_vcn_cidr_blocks
  private_subnet_cidr_block_map       = var.ModuleName_network_private_subnet_cidr_block_map
  public_subnet_cidr_block_map        = var.ModuleName_network_public_subnet_cidr_block_map
  vcn_display_name                    = var.ModuleName_network_vcn_display_name
  dhcp_options_display_name           = var.ModuleName_network_dhcp_options_display_name
  custom_search_domain                = var.ModuleName_network_custom_search_domain
  private_route_table_display_name    = var.ModuleName_network_private_route_table_display_name
  public_route_table_display_name     = var.ModuleName_network_public_route_table_display_name
  private_security_list_display_name  = var.ModuleName_network_private_security_list_display_name
  public_security_list_display_name   = var.ModuleName_network_public_security_list_display_name
  service_gateway_display_name        = var.ModuleName_network_service_gateway_display_name
  nat_gateway_display_name            = var.ModuleName_network_nat_gateway_display_name
  internet_gateway_display_name       = var.ModuleName_network_internet_gateway_display_name
  lpg_count                           = var.ModuleName_network_lpg_count
  lpg_display_name_base               = var.ModuleName_network_lpg_display_name_base
  peered_vcn_network_compartment_name = var.ModuleName_network_peered_vcn_network_compartment_name
  peered_lpg_display_name             = var.ModuleName_network_peered_lpg_display_name
  is_spoke                            = var.ModuleName_network_is_spoke
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
}

module "lpg_route_pub_hub_to_ModuleName" {
  depends_on = [
    module.hub01_network,
    module.ModuleName_network
  ]
  source = "git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git?ref=v1.0.2"
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  ######################################## PROVIDER SPECIFIC VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  from_network_compartment_name = var.hub01_network_vcn_network_compartment_name
  from_vcn_display_name         = var.hub01_network_vcn_display_name
  from_route_table_display_name = var.hub01_network_public_route_table_display_name
  from_lpg_display_name         = module.hub01_network.local_peering_gateways[0].display_name

  to_vcn_display_name         = var.ModuleName_network_vcn_display_name
  to_network_compartment_name = var.ModuleName_network_vcn_network_compartment_name
  to_lpg_display_name         = module.ModuleName_network.local_peering_gateways[0].display_name
  to_route_table_display_name = var.ModuleName_network_public_route_table_display_name
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################

}
```


*Considerations*
- Whereas needed, apply variable and module overloading
- For module specifics, refer to module documentation: 
  - [terraform-oci-cloudbricks-compartment](https://github.com/oracle-devrel/terraform-oci-cloudbricks-compartment/blob/main/README.md)
  - [terraform-oci-cloudbricks-network-artifacts](https://github.com/oracle-devrel/terraform-oci-cloudbricks-network-artifacts/blob/main/README.md)  
  - [terraform-oci-cloudbricks-lpg-config](https://github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config/blob/main/README.md)
- For variable usage, refer to section *Variable Documentation*
- When using module - [terraform-oci-cloudbricks-lpg-config](https://github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config) this will take as parameters runtime information of currently in creation resources. For each new VCN that's added as spoke, be sure to increase the number of variable 'from_lpg_display_name' in 1 as the following example: 
  
  ```shell
  from_lpg_display_name         = module.hub01_network.local_peering_gateways[0].display_name
  from_lpg_display_name         = module.hub01_network.local_peering_gateways[1].display_name
  ...
  from_lpg_display_name         = module.hub01_network.local_peering_gateways[N].display_name
  ```
- This progression can be observed in module orchestrator [main.tf](network_system/main.tf) in lines 126 and 181 for prd01 environment subnets

### [output.tf](./output.tf)
The following file defines the output of system, for future forward integration use with Configuration Management Tools

### [README.md](./README.md)
This file

### [system.tfvars](./system.tfvars)
The following file defines the specific variables customized using variable overloading. Please refer to backend brick module documentation for details in how to fill.
For module specifics, refer to module documentation: 
  - [terraform-oci-cloudbricks-compartment](https://github.com/oracle-devrel/terraform-oci-cloudbricks-compartment/blob/main/README.md)
  - [terraform-oci-cloudbricks-network-artifacts](https://github.com/oracle-devrel/terraform-oci-cloudbricks-network-artifacts/blob/main/README.md)  
  - [terraform-oci-cloudbricks-lpg-config](https://github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config/blob/main/README.md)

### [variables.tf](./variables.tf)
The following file defines all the variables used in this system. For details on it's content, refer to section *Variable Documentation*

---
## Variable Documentation

### Compartment System
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.5 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | >= 4.36.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | >= 4.36.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dev01"></a> [dev01](#module\_dev01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git | v1.0.1 |
| <a name="module_dev01_artifacts"></a> [dev01\_artifacts](#module\_dev01\_artifacts) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git | v1.0.1 |
| <a name="module_dev01_network"></a> [dev01\_network](#module\_dev01\_network) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git | v1.0.1 |
| <a name="module_hom01"></a> [hom01](#module\_hom01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git | v1.0.1 |
| <a name="module_hom01_artifacts"></a> [hom01\_artifacts](#module\_hom01\_artifacts) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git | v1.0.1 |
| <a name="module_hom01_network"></a> [hom01\_network](#module\_hom01\_network) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git | v1.0.1 |
| <a name="module_hub01"></a> [hub01](#module\_hub01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git | v1.0.1 |
| <a name="module_hub01_artifacts"></a> [hub01\_artifacts](#module\_hub01\_artifacts) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git | v1.0.1 |
| <a name="module_hub01_network"></a> [hub01\_network](#module\_hub01\_network) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git | v1.0.1 |
| <a name="module_mainbizcomp"></a> [mainbizcomp](#module\_mainbizcomp) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git | v1.0.1 |
| <a name="module_prd01"></a> [prd01](#module\_prd01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git | v1.0.1 |
| <a name="module_prd01_artifacts"></a> [prd01\_artifacts](#module\_prd01\_artifacts) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git | v1.0.1 |
| <a name="module_prd01_network"></a> [prd01\_network](#module\_prd01\_network) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git | v1.0.1 |
| <a name="module_qa01"></a> [qa01](#module\_qa01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git | v1.0.1 |
| <a name="module_qa01_artifacts"></a> [qa01\_artifacts](#module\_qa01\_artifacts) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git | v1.0.1 |
| <a name="module_qa01_network"></a> [qa01\_network](#module\_qa01\_network) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git | v1.0.1 |
| <a name="module_sbx01"></a> [sbx01](#module\_sbx01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git | v1.0.1 |
| <a name="module_sbx01_artifacts"></a> [sbx01\_artifacts](#module\_sbx01\_artifacts) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git | v1.0.1 |
| <a name="module_sbx01_network"></a> [sbx01\_network](#module\_sbx01\_network) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-compartment.git | v1.0.1 |

## Resources

| Name | Type |
|------|------|
| [oci_identity_region_subscriptions.home_region_subscriptions](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_region_subscriptions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dev01_artifacts_compartment_description"></a> [dev01\_artifacts\_compartment\_description](#input\_dev01\_artifacts\_compartment\_description) | Compartment Description | `any` | n/a | yes |
| <a name="input_dev01_artifacts_compartment_name"></a> [dev01\_artifacts\_compartment\_name](#input\_dev01\_artifacts\_compartment\_name) | Compartment Display Name | `any` | n/a | yes |
| <a name="input_dev01_artifacts_enable_delete"></a> [dev01\_artifacts\_enable\_delete](#input\_dev01\_artifacts\_enable\_delete) | Defines if this compartment can be programatically deleted by terraform destroy | `any` | n/a | yes |
| <a name="input_dev01_compartment_description"></a> [dev01\_compartment\_description](#input\_dev01\_compartment\_description) | Enters a description of the compartment | `any` | n/a | yes |
| <a name="input_dev01_compartment_name"></a> [dev01\_compartment\_name](#input\_dev01\_compartment\_name) | Defines the display name of compartment | `any` | n/a | yes |
| <a name="input_dev01_enable_delete"></a> [dev01\_enable\_delete](#input\_dev01\_enable\_delete) | Defines if this compartment can be programatically deleted by terraform destroy | `any` | n/a | yes |
| <a name="input_dev01_network_compartment_description"></a> [dev01\_network\_compartment\_description](#input\_dev01\_network\_compartment\_description) | Compartment Description | `any` | n/a | yes |
| <a name="input_dev01_network_compartment_name"></a> [dev01\_network\_compartment\_name](#input\_dev01\_network\_compartment\_name) | Compartment Display Name | `any` | n/a | yes |
| <a name="input_dev01_network_enable_delete"></a> [dev01\_network\_enable\_delete](#input\_dev01\_network\_enable\_delete) | Defines if this compartment can be programatically deleted by terraform destroy | `any` | n/a | yes |
| <a name="input_fingerprint"></a> [fingerprint](#input\_fingerprint) | API Key Fingerprint for user\_ocid derived from public API Key imported in OCI User config | `any` | n/a | yes |
| <a name="input_hom01_artifacts_compartment_description"></a> [hom01\_artifacts\_compartment\_description](#input\_hom01\_artifacts\_compartment\_description) | Compartment Description | `any` | n/a | yes |
| <a name="input_hom01_artifacts_compartment_name"></a> [hom01\_artifacts\_compartment\_name](#input\_hom01\_artifacts\_compartment\_name) | Compartment Display Name | `any` | n/a | yes |
| <a name="input_hom01_artifacts_enable_delete"></a> [hom01\_artifacts\_enable\_delete](#input\_hom01\_artifacts\_enable\_delete) | Defines if this compartment can be programatically deleted by terraform destroy | `any` | n/a | yes |
| <a name="input_hom01_compartment_description"></a> [hom01\_compartment\_description](#input\_hom01\_compartment\_description) | Enters a description of the compartment | `any` | n/a | yes |
| <a name="input_hom01_compartment_name"></a> [hom01\_compartment\_name](#input\_hom01\_compartment\_name) | Defines the display name of compartment | `any` | n/a | yes |
| <a name="input_hom01_enable_delete"></a> [hom01\_enable\_delete](#input\_hom01\_enable\_delete) | Defines if this compartment can be programatically deleted by terraform destroy | `any` | n/a | yes |
| <a name="input_hom01_network_compartment_description"></a> [hom01\_network\_compartment\_description](#input\_hom01\_network\_compartment\_description) | Compartment Description | `any` | n/a | yes |
| <a name="input_hom01_network_compartment_name"></a> [hom01\_network\_compartment\_name](#input\_hom01\_network\_compartment\_name) | Compartment Display Name | `any` | n/a | yes |
| <a name="input_hom01_network_enable_delete"></a> [hom01\_network\_enable\_delete](#input\_hom01\_network\_enable\_delete) | Defines if this compartment can be programatically deleted by terraform destroy | `any` | n/a | yes |
| <a name="input_hub01_artifacts_compartment_description"></a> [hub01\_artifacts\_compartment\_description](#input\_hub01\_artifacts\_compartment\_description) | Compartment Description | `any` | n/a | yes |
| <a name="input_hub01_artifacts_compartment_name"></a> [hub01\_artifacts\_compartment\_name](#input\_hub01\_artifacts\_compartment\_name) | Compartment Display Name | `any` | n/a | yes |
| <a name="input_hub01_artifacts_enable_delete"></a> [hub01\_artifacts\_enable\_delete](#input\_hub01\_artifacts\_enable\_delete) | Defines if this compartment can be programatically deleted by terraform destroy | `any` | n/a | yes |
| <a name="input_hub01_compartment_description"></a> [hub01\_compartment\_description](#input\_hub01\_compartment\_description) | Enters a description of the compartment | `any` | n/a | yes |
| <a name="input_hub01_compartment_name"></a> [hub01\_compartment\_name](#input\_hub01\_compartment\_name) | Defines the display name of compartment | `any` | n/a | yes |
| <a name="input_hub01_enable_delete"></a> [hub01\_enable\_delete](#input\_hub01\_enable\_delete) | Defines if this compartment can be programatically deleted by terraform destroy | `any` | n/a | yes |
| <a name="input_hub01_network_compartment_description"></a> [hub01\_network\_compartment\_description](#input\_hub01\_network\_compartment\_description) | Compartment Description | `any` | n/a | yes |
| <a name="input_hub01_network_compartment_name"></a> [hub01\_network\_compartment\_name](#input\_hub01\_network\_compartment\_name) | Compartment Display Name | `any` | n/a | yes |
| <a name="input_hub01_network_enable_delete"></a> [hub01\_network\_enable\_delete](#input\_hub01\_network\_enable\_delete) | Defines if this compartment can be programatically deleted by terraform destroy | `any` | n/a | yes |
| <a name="input_mainbizcomp_compartment_description"></a> [mainbizcomp\_compartment\_description](#input\_mainbizcomp\_compartment\_description) | Enters a description of the compartment | `any` | n/a | yes |
| <a name="input_mainbizcomp_compartment_name"></a> [mainbizcomp\_compartment\_name](#input\_mainbizcomp\_compartment\_name) | Defines the display name of compartment | `any` | n/a | yes |
| <a name="input_mainbizcomp_enable_delete"></a> [mainbizcomp\_enable\_delete](#input\_mainbizcomp\_enable\_delete) | Defines if this compartment can be programatically deleted by terraform destroy | `any` | n/a | yes |
| <a name="input_mainbizcomp_is_root_parent"></a> [mainbizcomp\_is\_root\_parent](#input\_mainbizcomp\_is\_root\_parent) | The following variable describes if Root compartment is the parent of this | `any` | n/a | yes |
| <a name="input_mainbizcomp_root_compartment_ocid"></a> [mainbizcomp\_root\_compartment\_ocid](#input\_mainbizcomp\_root\_compartment\_ocid) | Defines the OCID of the root compartment | `any` | n/a | yes |
| <a name="input_prd01_artifacts_compartment_description"></a> [prd01\_artifacts\_compartment\_description](#input\_prd01\_artifacts\_compartment\_description) | Compartment Description | `any` | n/a | yes |
| <a name="input_prd01_artifacts_compartment_name"></a> [prd01\_artifacts\_compartment\_name](#input\_prd01\_artifacts\_compartment\_name) | Compartment Display Name | `any` | n/a | yes |
| <a name="input_prd01_artifacts_enable_delete"></a> [prd01\_artifacts\_enable\_delete](#input\_prd01\_artifacts\_enable\_delete) | Defines if this compartment can be programatically deleted by terraform destroy | `any` | n/a | yes |
| <a name="input_prd01_compartment_description"></a> [prd01\_compartment\_description](#input\_prd01\_compartment\_description) | Enters a description of the compartment | `any` | n/a | yes |
| <a name="input_prd01_compartment_name"></a> [prd01\_compartment\_name](#input\_prd01\_compartment\_name) | Defines the display name of compartment | `any` | n/a | yes |
| <a name="input_prd01_enable_delete"></a> [prd01\_enable\_delete](#input\_prd01\_enable\_delete) | Defines if this compartment can be programatically deleted by terraform destroy | `any` | n/a | yes |
| <a name="input_prd01_network_compartment_description"></a> [prd01\_network\_compartment\_description](#input\_prd01\_network\_compartment\_description) | Compartment Description | `any` | n/a | yes |
| <a name="input_prd01_network_compartment_name"></a> [prd01\_network\_compartment\_name](#input\_prd01\_network\_compartment\_name) | Compartment Display Name | `any` | n/a | yes |
| <a name="input_prd01_network_enable_delete"></a> [prd01\_network\_enable\_delete](#input\_prd01\_network\_enable\_delete) | Defines if this compartment can be programatically deleted by terraform destroy | `any` | n/a | yes |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | Private Key Absolute path location where terraform is executed | `any` | n/a | yes |
| <a name="input_qa01_artifacts_compartment_description"></a> [qa01\_artifacts\_compartment\_description](#input\_qa01\_artifacts\_compartment\_description) | Compartment Description | `any` | n/a | yes |
| <a name="input_qa01_artifacts_compartment_name"></a> [qa01\_artifacts\_compartment\_name](#input\_qa01\_artifacts\_compartment\_name) | Compartment Display Name | `any` | n/a | yes |
| <a name="input_qa01_artifacts_enable_delete"></a> [qa01\_artifacts\_enable\_delete](#input\_qa01\_artifacts\_enable\_delete) | Defines if this compartment can be programatically deleted by terraform destroy | `any` | n/a | yes |
| <a name="input_qa01_compartment_description"></a> [qa01\_compartment\_description](#input\_qa01\_compartment\_description) | Enters a description of the compartment | `any` | n/a | yes |
| <a name="input_qa01_compartment_name"></a> [qa01\_compartment\_name](#input\_qa01\_compartment\_name) | Defines the display name of compartment | `any` | n/a | yes |
| <a name="input_qa01_enable_delete"></a> [qa01\_enable\_delete](#input\_qa01\_enable\_delete) | Defines if this compartment can be programatically deleted by terraform destroy | `any` | n/a | yes |
| <a name="input_qa01_network_compartment_description"></a> [qa01\_network\_compartment\_description](#input\_qa01\_network\_compartment\_description) | Compartment Description | `any` | n/a | yes |
| <a name="input_qa01_network_compartment_name"></a> [qa01\_network\_compartment\_name](#input\_qa01\_network\_compartment\_name) | Compartment Display Name | `any` | n/a | yes |
| <a name="input_qa01_network_enable_delete"></a> [qa01\_network\_enable\_delete](#input\_qa01\_network\_enable\_delete) | Defines if this compartment can be programatically deleted by terraform destroy | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Target region where artifacts are going to be created | `any` | n/a | yes |
| <a name="input_sbx01_artifacts_compartment_description"></a> [sbx01\_artifacts\_compartment\_description](#input\_sbx01\_artifacts\_compartment\_description) | Compartment Description | `any` | n/a | yes |
| <a name="input_sbx01_artifacts_compartment_name"></a> [sbx01\_artifacts\_compartment\_name](#input\_sbx01\_artifacts\_compartment\_name) | Compartment Display Name | `any` | n/a | yes |
| <a name="input_sbx01_artifacts_enable_delete"></a> [sbx01\_artifacts\_enable\_delete](#input\_sbx01\_artifacts\_enable\_delete) | Defines if this compartment can be programatically deleted by terraform destroy | `any` | n/a | yes |
| <a name="input_sbx01_compartment_description"></a> [sbx01\_compartment\_description](#input\_sbx01\_compartment\_description) | Enters a description of the compartment | `any` | n/a | yes |
| <a name="input_sbx01_compartment_name"></a> [sbx01\_compartment\_name](#input\_sbx01\_compartment\_name) | Defines the display name of compartment | `any` | n/a | yes |
| <a name="input_sbx01_enable_delete"></a> [sbx01\_enable\_delete](#input\_sbx01\_enable\_delete) | Defines if this compartment can be programatically deleted by terraform destroy | `any` | n/a | yes |
| <a name="input_sbx01_network_compartment_description"></a> [sbx01\_network\_compartment\_description](#input\_sbx01\_network\_compartment\_description) | Compartment Description | `any` | n/a | yes |
| <a name="input_sbx01_network_compartment_name"></a> [sbx01\_network\_compartment\_name](#input\_sbx01\_network\_compartment\_name) | Compartment Display Name | `any` | n/a | yes |
| <a name="input_sbx01_network_enable_delete"></a> [sbx01\_network\_enable\_delete](#input\_sbx01\_network\_enable\_delete) | Defines if this compartment can be programatically deleted by terraform destroy | `any` | n/a | yes |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | OCID of tenancy | `any` | n/a | yes |
| <a name="input_user_ocid"></a> [user\_ocid](#input\_user\_ocid) | User OCID in tenancy. Currently hardcoded to user denny.alquinta@oracle.com | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dev01"></a> [dev01](#output\_dev01) | dev01 Data |
| <a name="output_dev01_artifacts"></a> [dev01\_artifacts](#output\_dev01\_artifacts) | Artifact prd01 Data |
| <a name="output_dev01_network"></a> [dev01\_network](#output\_dev01\_network) | Network dev01 Data |
| <a name="output_hom01"></a> [hom01](#output\_hom01) | hom01 Data |
| <a name="output_hom01_artifacts"></a> [hom01\_artifacts](#output\_hom01\_artifacts) | Artifact prd01 Data |
| <a name="output_hom01_network"></a> [hom01\_network](#output\_hom01\_network) | Network hom01 Data |
| <a name="output_hub01"></a> [hub01](#output\_hub01) | hub01 Data |
| <a name="output_prd01"></a> [prd01](#output\_prd01) | prd01 Data |
| <a name="output_prd01_artifacts"></a> [prd01\_artifacts](#output\_prd01\_artifacts) | Artifact prd01 Data |
| <a name="output_prd01_network"></a> [prd01\_network](#output\_prd01\_network) | Network prd01 Data |
| <a name="output_qa01"></a> [qa01](#output\_qa01) | qa01 Data |
| <a name="output_qa01_artifacts"></a> [qa01\_artifacts](#output\_qa01\_artifacts) | Artifact prd01 Data |
| <a name="output_qa01_network"></a> [qa01\_network](#output\_qa01\_network) | Network qa01 Data |
| <a name="output_sbx01"></a> [sbx01](#output\_sbx01) | sbx01 Data |
| <a name="output_sbx01_artifacts"></a> [sbx01\_artifacts](#output\_sbx01\_artifacts) | Artifact prd01 Data |
| <a name="output_sbx01_network"></a> [sbx01\_network](#output\_sbx01\_network) | Network sbx01 Data |


### Network System
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.5 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | >= 4.36.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | >= 4.36.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dev01_network"></a> [dev01\_network](#module\_dev01\_network) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-network-artifacts.git | v1.0.1 |
| <a name="module_hom01_network"></a> [hom01\_network](#module\_hom01\_network) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-network-artifacts.git | v1.0.1 |
| <a name="module_hub01_network"></a> [hub01\_network](#module\_hub01\_network) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-network-artifacts.git | v1.0.1 |
| <a name="module_lpg_route_pub_hub_to_dev01"></a> [lpg\_route\_pub\_hub\_to\_dev01](#module\_lpg\_route\_pub\_hub\_to\_dev01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git | v1.0.2 |
| <a name="module_lpg_route_pub_hub_to_hom01"></a> [lpg\_route\_pub\_hub\_to\_hom01](#module\_lpg\_route\_pub\_hub\_to\_hom01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git | v1.0.2 |
| <a name="module_lpg_route_pub_hub_to_prd01"></a> [lpg\_route\_pub\_hub\_to\_prd01](#module\_lpg\_route\_pub\_hub\_to\_prd01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git | v1.0.2 |
| <a name="module_lpg_route_pub_hub_to_qa01"></a> [lpg\_route\_pub\_hub\_to\_qa01](#module\_lpg\_route\_pub\_hub\_to\_qa01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git | v1.0.2 |
| <a name="module_lpg_route_pub_hub_to_sbx01"></a> [lpg\_route\_pub\_hub\_to\_sbx01](#module\_lpg\_route\_pub\_hub\_to\_sbx01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git | v1.0.2 |
| <a name="module_lpg_route_pvt_hub_to_dev01"></a> [lpg\_route\_pvt\_hub\_to\_dev01](#module\_lpg\_route\_pvt\_hub\_to\_dev01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git | v1.0.2 |
| <a name="module_lpg_route_pvt_hub_to_hom01"></a> [lpg\_route\_pvt\_hub\_to\_hom01](#module\_lpg\_route\_pvt\_hub\_to\_hom01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git | v1.0.2 |
| <a name="module_lpg_route_pvt_hub_to_prd01"></a> [lpg\_route\_pvt\_hub\_to\_prd01](#module\_lpg\_route\_pvt\_hub\_to\_prd01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git | v1.0.2 |
| <a name="module_lpg_route_pvt_hub_to_qa01"></a> [lpg\_route\_pvt\_hub\_to\_qa01](#module\_lpg\_route\_pvt\_hub\_to\_qa01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git | v1.0.2 |
| <a name="module_lpg_route_pvt_hub_to_sbx01"></a> [lpg\_route\_pvt\_hub\_to\_sbx01](#module\_lpg\_route\_pvt\_hub\_to\_sbx01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-lpg-config.git | v1.0.2 |
| <a name="module_prd01_network"></a> [prd01\_network](#module\_prd01\_network) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-network-artifacts.git | v1.0.1 |
| <a name="module_qa01_network"></a> [qa01\_network](#module\_qa01\_network) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-network-artifacts.git | v1.0.1 |
| <a name="module_sbx01_network"></a> [sbx01\_network](#module\_sbx01\_network) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-network-artifacts.git | v1.0.1 |

## Resources

| Name | Type |
|------|------|
| [oci_identity_region_subscriptions.home_region_subscriptions](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_region_subscriptions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dev01_network_custom_search_domain"></a> [dev01\_network\_custom\_search\_domain](#input\_dev01\_network\_custom\_search\_domain) | A domain name where the custom option can be applied | `any` | n/a | yes |
| <a name="input_dev01_network_dhcp_options_display_name"></a> [dev01\_network\_dhcp\_options\_display\_name](#input\_dev01\_network\_dhcp\_options\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_dev01_network_internet_gateway_display_name"></a> [dev01\_network\_internet\_gateway\_display\_name](#input\_dev01\_network\_internet\_gateway\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_dev01_network_internet_gateway_enabled"></a> [dev01\_network\_internet\_gateway\_enabled](#input\_dev01\_network\_internet\_gateway\_enabled) | Describes if the Internet Gateway is enabled upon creation or not | `bool` | `true` | no |
| <a name="input_dev01_network_is_private_subnet_private"></a> [dev01\_network\_is\_private\_subnet\_private](#input\_dev01\_network\_is\_private\_subnet\_private) | Describes if the subnet is private or not | `bool` | `true` | no |
| <a name="input_dev01_network_is_public_subnet_private"></a> [dev01\_network\_is\_public\_subnet\_private](#input\_dev01\_network\_is\_public\_subnet\_private) | Describes if the subnet is private or not | `bool` | `false` | no |
| <a name="input_dev01_network_is_spoke"></a> [dev01\_network\_is\_spoke](#input\_dev01\_network\_is\_spoke) | Boolean that describes if the compartment is a spoke or not | `bool` | `true` | no |
| <a name="input_dev01_network_lpg_count"></a> [dev01\_network\_lpg\_count](#input\_dev01\_network\_lpg\_count) | Number of LPG to create | `number` | `1` | no |
| <a name="input_dev01_network_lpg_display_name_base"></a> [dev01\_network\_lpg\_display\_name\_base](#input\_dev01\_network\_lpg\_display\_name\_base) | Local Peering Gateway Display Name Base | `any` | n/a | yes |
| <a name="input_dev01_network_nat_gateway_display_name"></a> [dev01\_network\_nat\_gateway\_display\_name](#input\_dev01\_network\_nat\_gateway\_display\_name) | NAT Gateway Display Name | `any` | n/a | yes |
| <a name="input_dev01_network_peered_lpg_display_name"></a> [dev01\_network\_peered\_lpg\_display\_name](#input\_dev01\_network\_peered\_lpg\_display\_name) | Display name of peered network | `string` | `""` | no |
| <a name="input_dev01_network_peered_vcn_network_compartment_name"></a> [dev01\_network\_peered\_vcn\_network\_compartment\_name](#input\_dev01\_network\_peered\_vcn\_network\_compartment\_name) | Compartment name of origin VCN to peer | `string` | `""` | no |
| <a name="input_dev01_network_private_route_table_display_name"></a> [dev01\_network\_private\_route\_table\_display\_name](#input\_dev01\_network\_private\_route\_table\_display\_name) | Private Route Table Display Name. | `any` | n/a | yes |
| <a name="input_dev01_network_private_route_table_nat_route_rules_description"></a> [dev01\_network\_private\_route\_table\_nat\_route\_rules\_description](#input\_dev01\_network\_private\_route\_table\_nat\_route\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"NAT Gateway default route"` | no |
| <a name="input_dev01_network_private_route_table_nat_route_rules_destination"></a> [dev01\_network\_private\_route\_table\_nat\_route\_rules\_destination](#input\_dev01\_network\_private\_route\_table\_nat\_route\_rules\_destination) | private\_route\_table\_route\_rules\_destination | `string` | `"0.0.0.0/0"` | no |
| <a name="input_dev01_network_private_route_table_nat_route_rules_destination_type"></a> [dev01\_network\_private\_route\_table\_nat\_route\_rules\_destination\_type](#input\_dev01\_network\_private\_route\_table\_nat\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_dev01_network_private_route_table_svc_route_rules_description"></a> [dev01\_network\_private\_route\_table\_svc\_route\_rules\_description](#input\_dev01\_network\_private\_route\_table\_svc\_route\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"Service Gateway default route"` | no |
| <a name="input_dev01_network_private_route_table_svc_route_rules_destination_type"></a> [dev01\_network\_private\_route\_table\_svc\_route\_rules\_destination\_type](#input\_dev01\_network\_private\_route\_table\_svc\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"SERVICE_CIDR_BLOCK"` | no |
| <a name="input_dev01_network_private_security_list_display_name"></a> [dev01\_network\_private\_security\_list\_display\_name](#input\_dev01\_network\_private\_security\_list\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_dev01_network_private_security_list_egress_security_rules_description"></a> [dev01\_network\_private\_security\_list\_egress\_security\_rules\_description](#input\_dev01\_network\_private\_security\_list\_egress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All egress rule for all protocols and IP Addresses"` | no |
| <a name="input_dev01_network_private_security_list_egress_security_rules_destination"></a> [dev01\_network\_private\_security\_list\_egress\_security\_rules\_destination](#input\_dev01\_network\_private\_security\_list\_egress\_security\_rules\_destination) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet originating from the instance can go to. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_dev01_network_private_security_list_egress_security_rules_destination_type"></a> [dev01\_network\_private\_security\_list\_egress\_security\_rules\_destination\_type](#input\_dev01\_network\_private\_security\_list\_egress\_security\_rules\_destination\_type) | Optional) (Updatable) Type of destination for the rule. The default is CIDR\_BLOCK | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_dev01_network_private_security_list_egress_security_rules_protocol"></a> [dev01\_network\_private\_security\_list\_egress\_security\_rules\_protocol](#input\_dev01\_network\_private\_security\_list\_egress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_dev01_network_private_security_list_egress_security_rules_stateless"></a> [dev01\_network\_private\_security\_list\_egress\_security\_rules\_stateless](#input\_dev01\_network\_private\_security\_list\_egress\_security\_rules\_stateless) | (Optional) (Updatable) A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if egress traffic allows TCP destination port 80, there should be an ingress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_dev01_network_private_security_list_ingress_security_rules_description"></a> [dev01\_network\_private\_security\_list\_ingress\_security\_rules\_description](#input\_dev01\_network\_private\_security\_list\_ingress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All traffic in for private security List"` | no |
| <a name="input_dev01_network_private_security_list_ingress_security_rules_protocol"></a> [dev01\_network\_private\_security\_list\_ingress\_security\_rules\_protocol](#input\_dev01\_network\_private\_security\_list\_ingress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_dev01_network_private_security_list_ingress_security_rules_source"></a> [dev01\_network\_private\_security\_list\_ingress\_security\_rules\_source](#input\_dev01\_network\_private\_security\_list\_ingress\_security\_rules\_source) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet coming into the instance can come from. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_dev01_network_private_security_list_ingress_security_rules_source_type"></a> [dev01\_network\_private\_security\_list\_ingress\_security\_rules\_source\_type](#input\_dev01\_network\_private\_security\_list\_ingress\_security\_rules\_source\_type) | Type of source for the rule. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_dev01_network_private_security_list_ingress_security_rules_stateless"></a> [dev01\_network\_private\_security\_list\_ingress\_security\_rules\_stateless](#input\_dev01\_network\_private\_security\_list\_ingress\_security\_rules\_stateless) | A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if ingress traffic allows TCP destination port 80, there should be an egress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_dev01_network_private_subnet_cidr_block_map"></a> [dev01\_network\_private\_subnet\_cidr\_block\_map](#input\_dev01\_network\_private\_subnet\_cidr\_block\_map) | Map of CIDR Blocks associated to private subnets and it's corresponding names | `map(any)` | n/a | yes |
| <a name="input_dev01_network_public_route_table_display_name"></a> [dev01\_network\_public\_route\_table\_display\_name](#input\_dev01\_network\_public\_route\_table\_display\_name) | Public Route Table Display Name. | `any` | n/a | yes |
| <a name="input_dev01_network_public_route_table_inet_route_rules_description"></a> [dev01\_network\_public\_route\_table\_inet\_route\_rules\_description](#input\_dev01\_network\_public\_route\_table\_inet\_route\_rules\_description) | Description of Route Table Entry for Internet Gateway | `string` | `"Route entry for Internet Gateway"` | no |
| <a name="input_dev01_network_public_route_table_inet_route_rules_destination"></a> [dev01\_network\_public\_route\_table\_inet\_route\_rules\_destination](#input\_dev01\_network\_public\_route\_table\_inet\_route\_rules\_destination) | private\_route\_table\_route\_rules\_destination | `string` | `"0.0.0.0/0"` | no |
| <a name="input_dev01_network_public_route_table_inet_route_rules_destination_type"></a> [dev01\_network\_public\_route\_table\_inet\_route\_rules\_destination\_type](#input\_dev01\_network\_public\_route\_table\_inet\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_dev01_network_public_route_table_svc_route_rules_description"></a> [dev01\_network\_public\_route\_table\_svc\_route\_rules\_description](#input\_dev01\_network\_public\_route\_table\_svc\_route\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"Service Gateway default route"` | no |
| <a name="input_dev01_network_public_route_table_svc_route_rules_destination_type"></a> [dev01\_network\_public\_route\_table\_svc\_route\_rules\_destination\_type](#input\_dev01\_network\_public\_route\_table\_svc\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"SERVICE_CIDR_BLOCK"` | no |
| <a name="input_dev01_network_public_security_list_display_name"></a> [dev01\_network\_public\_security\_list\_display\_name](#input\_dev01\_network\_public\_security\_list\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_dev01_network_public_security_list_egress_security_rules_description"></a> [dev01\_network\_public\_security\_list\_egress\_security\_rules\_description](#input\_dev01\_network\_public\_security\_list\_egress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All egress rule for all protocols and IP Addresses"` | no |
| <a name="input_dev01_network_public_security_list_egress_security_rules_destination"></a> [dev01\_network\_public\_security\_list\_egress\_security\_rules\_destination](#input\_dev01\_network\_public\_security\_list\_egress\_security\_rules\_destination) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet originating from the instance can go to. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_dev01_network_public_security_list_egress_security_rules_destination_type"></a> [dev01\_network\_public\_security\_list\_egress\_security\_rules\_destination\_type](#input\_dev01\_network\_public\_security\_list\_egress\_security\_rules\_destination\_type) | Optional) (Updatable) Type of destination for the rule. The default is CIDR\_BLOCK | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_dev01_network_public_security_list_egress_security_rules_protocol"></a> [dev01\_network\_public\_security\_list\_egress\_security\_rules\_protocol](#input\_dev01\_network\_public\_security\_list\_egress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_dev01_network_public_security_list_egress_security_rules_stateless"></a> [dev01\_network\_public\_security\_list\_egress\_security\_rules\_stateless](#input\_dev01\_network\_public\_security\_list\_egress\_security\_rules\_stateless) | (Optional) (Updatable) A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if egress traffic allows TCP destination port 80, there should be an ingress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_dev01_network_public_security_list_ingress_security_rules_description"></a> [dev01\_network\_public\_security\_list\_ingress\_security\_rules\_description](#input\_dev01\_network\_public\_security\_list\_ingress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All traffic in for Public Security List"` | no |
| <a name="input_dev01_network_public_security_list_ingress_security_rules_protocol"></a> [dev01\_network\_public\_security\_list\_ingress\_security\_rules\_protocol](#input\_dev01\_network\_public\_security\_list\_ingress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_dev01_network_public_security_list_ingress_security_rules_source"></a> [dev01\_network\_public\_security\_list\_ingress\_security\_rules\_source](#input\_dev01\_network\_public\_security\_list\_ingress\_security\_rules\_source) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet coming into the instance can come from. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_dev01_network_public_security_list_ingress_security_rules_source_type"></a> [dev01\_network\_public\_security\_list\_ingress\_security\_rules\_source\_type](#input\_dev01\_network\_public\_security\_list\_ingress\_security\_rules\_source\_type) | Type of source for the rule. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_dev01_network_public_security_list_ingress_security_rules_stateless"></a> [dev01\_network\_public\_security\_list\_ingress\_security\_rules\_stateless](#input\_dev01\_network\_public\_security\_list\_ingress\_security\_rules\_stateless) | A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if ingress traffic allows TCP destination port 80, there should be an egress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_dev01_network_public_subnet_cidr_block_map"></a> [dev01\_network\_public\_subnet\_cidr\_block\_map](#input\_dev01\_network\_public\_subnet\_cidr\_block\_map) | Map of CIDR Blocks associated to private subnets and it's corresponding names | `map(any)` | n/a | yes |
| <a name="input_dev01_network_service_gateway_display_name"></a> [dev01\_network\_service\_gateway\_display\_name](#input\_dev01\_network\_service\_gateway\_display\_name) | Service Gateway Display Name | `any` | n/a | yes |
| <a name="input_dev01_network_vcn_cidr_blocks"></a> [dev01\_network\_vcn\_cidr\_blocks](#input\_dev01\_network\_vcn\_cidr\_blocks) | The list of one or more IPv4 CIDR blocks for the VCN | `any` | n/a | yes |
| <a name="input_dev01_network_vcn_display_name"></a> [dev01\_network\_vcn\_display\_name](#input\_dev01\_network\_vcn\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_dev01_network_vcn_network_compartment_name"></a> [dev01\_network\_vcn\_network\_compartment\_name](#input\_dev01\_network\_vcn\_network\_compartment\_name) | Name of the compartment where the VCN will be created | `any` | n/a | yes |
| <a name="input_fingerprint"></a> [fingerprint](#input\_fingerprint) | API Key Fingerprint for user\_ocid derived from public API Key imported in OCI User config | `any` | n/a | yes |
| <a name="input_hom01_network_custom_search_domain"></a> [hom01\_network\_custom\_search\_domain](#input\_hom01\_network\_custom\_search\_domain) | A domain name where the custom option can be applied | `any` | n/a | yes |
| <a name="input_hom01_network_dhcp_options_display_name"></a> [hom01\_network\_dhcp\_options\_display\_name](#input\_hom01\_network\_dhcp\_options\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_hom01_network_internet_gateway_display_name"></a> [hom01\_network\_internet\_gateway\_display\_name](#input\_hom01\_network\_internet\_gateway\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_hom01_network_internet_gateway_enabled"></a> [hom01\_network\_internet\_gateway\_enabled](#input\_hom01\_network\_internet\_gateway\_enabled) | Describes if the Internet Gateway is enabled upon creation or not | `bool` | `true` | no |
| <a name="input_hom01_network_is_private_subnet_private"></a> [hom01\_network\_is\_private\_subnet\_private](#input\_hom01\_network\_is\_private\_subnet\_private) | Describes if the subnet is private or not | `bool` | `true` | no |
| <a name="input_hom01_network_is_public_subnet_private"></a> [hom01\_network\_is\_public\_subnet\_private](#input\_hom01\_network\_is\_public\_subnet\_private) | Describes if the subnet is private or not | `bool` | `false` | no |
| <a name="input_hom01_network_is_spoke"></a> [hom01\_network\_is\_spoke](#input\_hom01\_network\_is\_spoke) | Boolean that describes if the compartment is a spoke or not | `bool` | `true` | no |
| <a name="input_hom01_network_lpg_count"></a> [hom01\_network\_lpg\_count](#input\_hom01\_network\_lpg\_count) | Number of LPG to create | `number` | `1` | no |
| <a name="input_hom01_network_lpg_display_name_base"></a> [hom01\_network\_lpg\_display\_name\_base](#input\_hom01\_network\_lpg\_display\_name\_base) | Local Peering Gateway Display Name Base | `any` | n/a | yes |
| <a name="input_hom01_network_nat_gateway_display_name"></a> [hom01\_network\_nat\_gateway\_display\_name](#input\_hom01\_network\_nat\_gateway\_display\_name) | NAT Gateway Display Name | `any` | n/a | yes |
| <a name="input_hom01_network_peered_lpg_display_name"></a> [hom01\_network\_peered\_lpg\_display\_name](#input\_hom01\_network\_peered\_lpg\_display\_name) | Display name of peered network | `string` | `""` | no |
| <a name="input_hom01_network_peered_vcn_network_compartment_name"></a> [hom01\_network\_peered\_vcn\_network\_compartment\_name](#input\_hom01\_network\_peered\_vcn\_network\_compartment\_name) | Compartment name of origin VCN to peer | `string` | `""` | no |
| <a name="input_hom01_network_private_route_table_display_name"></a> [hom01\_network\_private\_route\_table\_display\_name](#input\_hom01\_network\_private\_route\_table\_display\_name) | Private Route Table Display Name. | `any` | n/a | yes |
| <a name="input_hom01_network_private_route_table_nat_route_rules_description"></a> [hom01\_network\_private\_route\_table\_nat\_route\_rules\_description](#input\_hom01\_network\_private\_route\_table\_nat\_route\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"NAT Gateway default route"` | no |
| <a name="input_hom01_network_private_route_table_nat_route_rules_destination"></a> [hom01\_network\_private\_route\_table\_nat\_route\_rules\_destination](#input\_hom01\_network\_private\_route\_table\_nat\_route\_rules\_destination) | private\_route\_table\_route\_rules\_destination | `string` | `"0.0.0.0/0"` | no |
| <a name="input_hom01_network_private_route_table_nat_route_rules_destination_type"></a> [hom01\_network\_private\_route\_table\_nat\_route\_rules\_destination\_type](#input\_hom01\_network\_private\_route\_table\_nat\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_hom01_network_private_route_table_svc_route_rules_description"></a> [hom01\_network\_private\_route\_table\_svc\_route\_rules\_description](#input\_hom01\_network\_private\_route\_table\_svc\_route\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"Service Gateway default route"` | no |
| <a name="input_hom01_network_private_route_table_svc_route_rules_destination_type"></a> [hom01\_network\_private\_route\_table\_svc\_route\_rules\_destination\_type](#input\_hom01\_network\_private\_route\_table\_svc\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"SERVICE_CIDR_BLOCK"` | no |
| <a name="input_hom01_network_private_security_list_display_name"></a> [hom01\_network\_private\_security\_list\_display\_name](#input\_hom01\_network\_private\_security\_list\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_hom01_network_private_security_list_egress_security_rules_description"></a> [hom01\_network\_private\_security\_list\_egress\_security\_rules\_description](#input\_hom01\_network\_private\_security\_list\_egress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All egress rule for all protocols and IP Addresses"` | no |
| <a name="input_hom01_network_private_security_list_egress_security_rules_destination"></a> [hom01\_network\_private\_security\_list\_egress\_security\_rules\_destination](#input\_hom01\_network\_private\_security\_list\_egress\_security\_rules\_destination) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet originating from the instance can go to. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_hom01_network_private_security_list_egress_security_rules_destination_type"></a> [hom01\_network\_private\_security\_list\_egress\_security\_rules\_destination\_type](#input\_hom01\_network\_private\_security\_list\_egress\_security\_rules\_destination\_type) | Optional) (Updatable) Type of destination for the rule. The default is CIDR\_BLOCK | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_hom01_network_private_security_list_egress_security_rules_protocol"></a> [hom01\_network\_private\_security\_list\_egress\_security\_rules\_protocol](#input\_hom01\_network\_private\_security\_list\_egress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_hom01_network_private_security_list_egress_security_rules_stateless"></a> [hom01\_network\_private\_security\_list\_egress\_security\_rules\_stateless](#input\_hom01\_network\_private\_security\_list\_egress\_security\_rules\_stateless) | (Optional) (Updatable) A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if egress traffic allows TCP destination port 80, there should be an ingress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_hom01_network_private_security_list_ingress_security_rules_description"></a> [hom01\_network\_private\_security\_list\_ingress\_security\_rules\_description](#input\_hom01\_network\_private\_security\_list\_ingress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All traffic in for private security List"` | no |
| <a name="input_hom01_network_private_security_list_ingress_security_rules_protocol"></a> [hom01\_network\_private\_security\_list\_ingress\_security\_rules\_protocol](#input\_hom01\_network\_private\_security\_list\_ingress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_hom01_network_private_security_list_ingress_security_rules_source"></a> [hom01\_network\_private\_security\_list\_ingress\_security\_rules\_source](#input\_hom01\_network\_private\_security\_list\_ingress\_security\_rules\_source) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet coming into the instance can come from. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_hom01_network_private_security_list_ingress_security_rules_source_type"></a> [hom01\_network\_private\_security\_list\_ingress\_security\_rules\_source\_type](#input\_hom01\_network\_private\_security\_list\_ingress\_security\_rules\_source\_type) | Type of source for the rule. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_hom01_network_private_security_list_ingress_security_rules_stateless"></a> [hom01\_network\_private\_security\_list\_ingress\_security\_rules\_stateless](#input\_hom01\_network\_private\_security\_list\_ingress\_security\_rules\_stateless) | A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if ingress traffic allows TCP destination port 80, there should be an egress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_hom01_network_private_subnet_cidr_block_map"></a> [hom01\_network\_private\_subnet\_cidr\_block\_map](#input\_hom01\_network\_private\_subnet\_cidr\_block\_map) | Map of CIDR Blocks associated to private subnets and it's corresponding names | `map(any)` | n/a | yes |
| <a name="input_hom01_network_public_route_table_display_name"></a> [hom01\_network\_public\_route\_table\_display\_name](#input\_hom01\_network\_public\_route\_table\_display\_name) | Public Route Table Display Name. | `any` | n/a | yes |
| <a name="input_hom01_network_public_route_table_inet_route_rules_description"></a> [hom01\_network\_public\_route\_table\_inet\_route\_rules\_description](#input\_hom01\_network\_public\_route\_table\_inet\_route\_rules\_description) | Description of Route Table Entry for Internet Gateway | `string` | `"Route entry for Internet Gateway"` | no |
| <a name="input_hom01_network_public_route_table_inet_route_rules_destination"></a> [hom01\_network\_public\_route\_table\_inet\_route\_rules\_destination](#input\_hom01\_network\_public\_route\_table\_inet\_route\_rules\_destination) | private\_route\_table\_route\_rules\_destination | `string` | `"0.0.0.0/0"` | no |
| <a name="input_hom01_network_public_route_table_inet_route_rules_destination_type"></a> [hom01\_network\_public\_route\_table\_inet\_route\_rules\_destination\_type](#input\_hom01\_network\_public\_route\_table\_inet\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_hom01_network_public_route_table_svc_route_rules_description"></a> [hom01\_network\_public\_route\_table\_svc\_route\_rules\_description](#input\_hom01\_network\_public\_route\_table\_svc\_route\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"Service Gateway default route"` | no |
| <a name="input_hom01_network_public_route_table_svc_route_rules_destination_type"></a> [hom01\_network\_public\_route\_table\_svc\_route\_rules\_destination\_type](#input\_hom01\_network\_public\_route\_table\_svc\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"SERVICE_CIDR_BLOCK"` | no |
| <a name="input_hom01_network_public_security_list_display_name"></a> [hom01\_network\_public\_security\_list\_display\_name](#input\_hom01\_network\_public\_security\_list\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_hom01_network_public_security_list_egress_security_rules_description"></a> [hom01\_network\_public\_security\_list\_egress\_security\_rules\_description](#input\_hom01\_network\_public\_security\_list\_egress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All egress rule for all protocols and IP Addresses"` | no |
| <a name="input_hom01_network_public_security_list_egress_security_rules_destination"></a> [hom01\_network\_public\_security\_list\_egress\_security\_rules\_destination](#input\_hom01\_network\_public\_security\_list\_egress\_security\_rules\_destination) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet originating from the instance can go to. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_hom01_network_public_security_list_egress_security_rules_destination_type"></a> [hom01\_network\_public\_security\_list\_egress\_security\_rules\_destination\_type](#input\_hom01\_network\_public\_security\_list\_egress\_security\_rules\_destination\_type) | Optional) (Updatable) Type of destination for the rule. The default is CIDR\_BLOCK | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_hom01_network_public_security_list_egress_security_rules_protocol"></a> [hom01\_network\_public\_security\_list\_egress\_security\_rules\_protocol](#input\_hom01\_network\_public\_security\_list\_egress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_hom01_network_public_security_list_egress_security_rules_stateless"></a> [hom01\_network\_public\_security\_list\_egress\_security\_rules\_stateless](#input\_hom01\_network\_public\_security\_list\_egress\_security\_rules\_stateless) | (Optional) (Updatable) A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if egress traffic allows TCP destination port 80, there should be an ingress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_hom01_network_public_security_list_ingress_security_rules_description"></a> [hom01\_network\_public\_security\_list\_ingress\_security\_rules\_description](#input\_hom01\_network\_public\_security\_list\_ingress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All traffic in for Public Security List"` | no |
| <a name="input_hom01_network_public_security_list_ingress_security_rules_protocol"></a> [hom01\_network\_public\_security\_list\_ingress\_security\_rules\_protocol](#input\_hom01\_network\_public\_security\_list\_ingress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_hom01_network_public_security_list_ingress_security_rules_source"></a> [hom01\_network\_public\_security\_list\_ingress\_security\_rules\_source](#input\_hom01\_network\_public\_security\_list\_ingress\_security\_rules\_source) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet coming into the instance can come from. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_hom01_network_public_security_list_ingress_security_rules_source_type"></a> [hom01\_network\_public\_security\_list\_ingress\_security\_rules\_source\_type](#input\_hom01\_network\_public\_security\_list\_ingress\_security\_rules\_source\_type) | Type of source for the rule. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_hom01_network_public_security_list_ingress_security_rules_stateless"></a> [hom01\_network\_public\_security\_list\_ingress\_security\_rules\_stateless](#input\_hom01\_network\_public\_security\_list\_ingress\_security\_rules\_stateless) | A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if ingress traffic allows TCP destination port 80, there should be an egress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_hom01_network_public_subnet_cidr_block_map"></a> [hom01\_network\_public\_subnet\_cidr\_block\_map](#input\_hom01\_network\_public\_subnet\_cidr\_block\_map) | Map of CIDR Blocks associated to private subnets and it's corresponding names | `map(any)` | n/a | yes |
| <a name="input_hom01_network_service_gateway_display_name"></a> [hom01\_network\_service\_gateway\_display\_name](#input\_hom01\_network\_service\_gateway\_display\_name) | Service Gateway Display Name | `any` | n/a | yes |
| <a name="input_hom01_network_vcn_cidr_blocks"></a> [hom01\_network\_vcn\_cidr\_blocks](#input\_hom01\_network\_vcn\_cidr\_blocks) | The list of one or more IPv4 CIDR blocks for the VCN | `any` | n/a | yes |
| <a name="input_hom01_network_vcn_display_name"></a> [hom01\_network\_vcn\_display\_name](#input\_hom01\_network\_vcn\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_hom01_network_vcn_network_compartment_name"></a> [hom01\_network\_vcn\_network\_compartment\_name](#input\_hom01\_network\_vcn\_network\_compartment\_name) | Name of the compartment where the VCN will be created | `any` | n/a | yes |
| <a name="input_hub01_network_custom_search_domain"></a> [hub01\_network\_custom\_search\_domain](#input\_hub01\_network\_custom\_search\_domain) | A domain name where the custom option can be applied | `any` | n/a | yes |
| <a name="input_hub01_network_dhcp_options_display_name"></a> [hub01\_network\_dhcp\_options\_display\_name](#input\_hub01\_network\_dhcp\_options\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_hub01_network_internet_gateway_display_name"></a> [hub01\_network\_internet\_gateway\_display\_name](#input\_hub01\_network\_internet\_gateway\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_hub01_network_internet_gateway_enabled"></a> [hub01\_network\_internet\_gateway\_enabled](#input\_hub01\_network\_internet\_gateway\_enabled) | Describes if the Internet Gateway is enabled upon creation or not | `bool` | `true` | no |
| <a name="input_hub01_network_is_private_subnet_private"></a> [hub01\_network\_is\_private\_subnet\_private](#input\_hub01\_network\_is\_private\_subnet\_private) | Describes if the subnet is private or not | `bool` | `true` | no |
| <a name="input_hub01_network_is_public_subnet_private"></a> [hub01\_network\_is\_public\_subnet\_private](#input\_hub01\_network\_is\_public\_subnet\_private) | Describes if the subnet is private or not | `bool` | `false` | no |
| <a name="input_hub01_network_is_spoke"></a> [hub01\_network\_is\_spoke](#input\_hub01\_network\_is\_spoke) | Boolean that describes if the compartment is a spoke or not | `bool` | `true` | no |
| <a name="input_hub01_network_lpg_count"></a> [hub01\_network\_lpg\_count](#input\_hub01\_network\_lpg\_count) | Number of LPG to create | `number` | `1` | no |
| <a name="input_hub01_network_lpg_display_name_base"></a> [hub01\_network\_lpg\_display\_name\_base](#input\_hub01\_network\_lpg\_display\_name\_base) | Local Peering Gateway Display Name Base | `any` | n/a | yes |
| <a name="input_hub01_network_nat_gateway_display_name"></a> [hub01\_network\_nat\_gateway\_display\_name](#input\_hub01\_network\_nat\_gateway\_display\_name) | NAT Gateway Display Name | `any` | n/a | yes |
| <a name="input_hub01_network_peered_lpg_display_name"></a> [hub01\_network\_peered\_lpg\_display\_name](#input\_hub01\_network\_peered\_lpg\_display\_name) | Display name of peered network | `string` | `""` | no |
| <a name="input_hub01_network_peered_vcn_network_compartment_name"></a> [hub01\_network\_peered\_vcn\_network\_compartment\_name](#input\_hub01\_network\_peered\_vcn\_network\_compartment\_name) | Compartment name of origin VCN to peer | `string` | `""` | no |
| <a name="input_hub01_network_private_route_table_display_name"></a> [hub01\_network\_private\_route\_table\_display\_name](#input\_hub01\_network\_private\_route\_table\_display\_name) | Private Route Table Display Name. | `any` | n/a | yes |
| <a name="input_hub01_network_private_route_table_nat_route_rules_description"></a> [hub01\_network\_private\_route\_table\_nat\_route\_rules\_description](#input\_hub01\_network\_private\_route\_table\_nat\_route\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"NAT Gateway default route"` | no |
| <a name="input_hub01_network_private_route_table_nat_route_rules_destination"></a> [hub01\_network\_private\_route\_table\_nat\_route\_rules\_destination](#input\_hub01\_network\_private\_route\_table\_nat\_route\_rules\_destination) | private\_route\_table\_route\_rules\_destination | `string` | `"0.0.0.0/0"` | no |
| <a name="input_hub01_network_private_route_table_nat_route_rules_destination_type"></a> [hub01\_network\_private\_route\_table\_nat\_route\_rules\_destination\_type](#input\_hub01\_network\_private\_route\_table\_nat\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_hub01_network_private_route_table_svc_route_rules_description"></a> [hub01\_network\_private\_route\_table\_svc\_route\_rules\_description](#input\_hub01\_network\_private\_route\_table\_svc\_route\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"Service Gateway default route"` | no |
| <a name="input_hub01_network_private_route_table_svc_route_rules_destination_type"></a> [hub01\_network\_private\_route\_table\_svc\_route\_rules\_destination\_type](#input\_hub01\_network\_private\_route\_table\_svc\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"SERVICE_CIDR_BLOCK"` | no |
| <a name="input_hub01_network_private_security_list_display_name"></a> [hub01\_network\_private\_security\_list\_display\_name](#input\_hub01\_network\_private\_security\_list\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_hub01_network_private_security_list_egress_security_rules_description"></a> [hub01\_network\_private\_security\_list\_egress\_security\_rules\_description](#input\_hub01\_network\_private\_security\_list\_egress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All egress rule for all protocols and IP Addresses"` | no |
| <a name="input_hub01_network_private_security_list_egress_security_rules_destination"></a> [hub01\_network\_private\_security\_list\_egress\_security\_rules\_destination](#input\_hub01\_network\_private\_security\_list\_egress\_security\_rules\_destination) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet originating from the instance can go to. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_hub01_network_private_security_list_egress_security_rules_destination_type"></a> [hub01\_network\_private\_security\_list\_egress\_security\_rules\_destination\_type](#input\_hub01\_network\_private\_security\_list\_egress\_security\_rules\_destination\_type) | Optional) (Updatable) Type of destination for the rule. The default is CIDR\_BLOCK | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_hub01_network_private_security_list_egress_security_rules_protocol"></a> [hub01\_network\_private\_security\_list\_egress\_security\_rules\_protocol](#input\_hub01\_network\_private\_security\_list\_egress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_hub01_network_private_security_list_egress_security_rules_stateless"></a> [hub01\_network\_private\_security\_list\_egress\_security\_rules\_stateless](#input\_hub01\_network\_private\_security\_list\_egress\_security\_rules\_stateless) | (Optional) (Updatable) A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if egress traffic allows TCP destination port 80, there should be an ingress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_hub01_network_private_security_list_ingress_security_rules_description"></a> [hub01\_network\_private\_security\_list\_ingress\_security\_rules\_description](#input\_hub01\_network\_private\_security\_list\_ingress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All traffic in for private security List"` | no |
| <a name="input_hub01_network_private_security_list_ingress_security_rules_protocol"></a> [hub01\_network\_private\_security\_list\_ingress\_security\_rules\_protocol](#input\_hub01\_network\_private\_security\_list\_ingress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_hub01_network_private_security_list_ingress_security_rules_source"></a> [hub01\_network\_private\_security\_list\_ingress\_security\_rules\_source](#input\_hub01\_network\_private\_security\_list\_ingress\_security\_rules\_source) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet coming into the instance can come from. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_hub01_network_private_security_list_ingress_security_rules_source_type"></a> [hub01\_network\_private\_security\_list\_ingress\_security\_rules\_source\_type](#input\_hub01\_network\_private\_security\_list\_ingress\_security\_rules\_source\_type) | Type of source for the rule. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_hub01_network_private_security_list_ingress_security_rules_stateless"></a> [hub01\_network\_private\_security\_list\_ingress\_security\_rules\_stateless](#input\_hub01\_network\_private\_security\_list\_ingress\_security\_rules\_stateless) | A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if ingress traffic allows TCP destination port 80, there should be an egress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_hub01_network_private_subnet_cidr_block_map"></a> [hub01\_network\_private\_subnet\_cidr\_block\_map](#input\_hub01\_network\_private\_subnet\_cidr\_block\_map) | Map of CIDR Blocks associated to private subnets and it's corresponding names | `map(any)` | n/a | yes |
| <a name="input_hub01_network_public_route_table_display_name"></a> [hub01\_network\_public\_route\_table\_display\_name](#input\_hub01\_network\_public\_route\_table\_display\_name) | Public Route Table Display Name. | `any` | n/a | yes |
| <a name="input_hub01_network_public_route_table_inet_route_rules_description"></a> [hub01\_network\_public\_route\_table\_inet\_route\_rules\_description](#input\_hub01\_network\_public\_route\_table\_inet\_route\_rules\_description) | Description of Route Table Entry for Internet Gateway | `string` | `"Route entry for Internet Gateway"` | no |
| <a name="input_hub01_network_public_route_table_inet_route_rules_destination"></a> [hub01\_network\_public\_route\_table\_inet\_route\_rules\_destination](#input\_hub01\_network\_public\_route\_table\_inet\_route\_rules\_destination) | private\_route\_table\_route\_rules\_destination | `string` | `"0.0.0.0/0"` | no |
| <a name="input_hub01_network_public_route_table_inet_route_rules_destination_type"></a> [hub01\_network\_public\_route\_table\_inet\_route\_rules\_destination\_type](#input\_hub01\_network\_public\_route\_table\_inet\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_hub01_network_public_route_table_svc_route_rules_description"></a> [hub01\_network\_public\_route\_table\_svc\_route\_rules\_description](#input\_hub01\_network\_public\_route\_table\_svc\_route\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"Service Gateway default route"` | no |
| <a name="input_hub01_network_public_route_table_svc_route_rules_destination_type"></a> [hub01\_network\_public\_route\_table\_svc\_route\_rules\_destination\_type](#input\_hub01\_network\_public\_route\_table\_svc\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"SERVICE_CIDR_BLOCK"` | no |
| <a name="input_hub01_network_public_security_list_display_name"></a> [hub01\_network\_public\_security\_list\_display\_name](#input\_hub01\_network\_public\_security\_list\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_hub01_network_public_security_list_egress_security_rules_description"></a> [hub01\_network\_public\_security\_list\_egress\_security\_rules\_description](#input\_hub01\_network\_public\_security\_list\_egress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All egress rule for all protocols and IP Addresses"` | no |
| <a name="input_hub01_network_public_security_list_egress_security_rules_destination"></a> [hub01\_network\_public\_security\_list\_egress\_security\_rules\_destination](#input\_hub01\_network\_public\_security\_list\_egress\_security\_rules\_destination) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet originating from the instance can go to. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_hub01_network_public_security_list_egress_security_rules_destination_type"></a> [hub01\_network\_public\_security\_list\_egress\_security\_rules\_destination\_type](#input\_hub01\_network\_public\_security\_list\_egress\_security\_rules\_destination\_type) | Optional) (Updatable) Type of destination for the rule. The default is CIDR\_BLOCK | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_hub01_network_public_security_list_egress_security_rules_protocol"></a> [hub01\_network\_public\_security\_list\_egress\_security\_rules\_protocol](#input\_hub01\_network\_public\_security\_list\_egress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_hub01_network_public_security_list_egress_security_rules_stateless"></a> [hub01\_network\_public\_security\_list\_egress\_security\_rules\_stateless](#input\_hub01\_network\_public\_security\_list\_egress\_security\_rules\_stateless) | (Optional) (Updatable) A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if egress traffic allows TCP destination port 80, there should be an ingress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_hub01_network_public_security_list_ingress_security_rules_description"></a> [hub01\_network\_public\_security\_list\_ingress\_security\_rules\_description](#input\_hub01\_network\_public\_security\_list\_ingress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All traffic in for Public Security List"` | no |
| <a name="input_hub01_network_public_security_list_ingress_security_rules_protocol"></a> [hub01\_network\_public\_security\_list\_ingress\_security\_rules\_protocol](#input\_hub01\_network\_public\_security\_list\_ingress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_hub01_network_public_security_list_ingress_security_rules_source"></a> [hub01\_network\_public\_security\_list\_ingress\_security\_rules\_source](#input\_hub01\_network\_public\_security\_list\_ingress\_security\_rules\_source) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet coming into the instance can come from. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_hub01_network_public_security_list_ingress_security_rules_source_type"></a> [hub01\_network\_public\_security\_list\_ingress\_security\_rules\_source\_type](#input\_hub01\_network\_public\_security\_list\_ingress\_security\_rules\_source\_type) | Type of source for the rule. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_hub01_network_public_security_list_ingress_security_rules_stateless"></a> [hub01\_network\_public\_security\_list\_ingress\_security\_rules\_stateless](#input\_hub01\_network\_public\_security\_list\_ingress\_security\_rules\_stateless) | A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if ingress traffic allows TCP destination port 80, there should be an egress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_hub01_network_public_subnet_cidr_block_map"></a> [hub01\_network\_public\_subnet\_cidr\_block\_map](#input\_hub01\_network\_public\_subnet\_cidr\_block\_map) | Map of CIDR Blocks associated to private subnets and it's corresponding names | `map(any)` | n/a | yes |
| <a name="input_hub01_network_service_gateway_display_name"></a> [hub01\_network\_service\_gateway\_display\_name](#input\_hub01\_network\_service\_gateway\_display\_name) | Service Gateway Display Name | `any` | n/a | yes |
| <a name="input_hub01_network_vcn_cidr_blocks"></a> [hub01\_network\_vcn\_cidr\_blocks](#input\_hub01\_network\_vcn\_cidr\_blocks) | The list of one or more IPv4 CIDR blocks for the VCN | `any` | n/a | yes |
| <a name="input_hub01_network_vcn_display_name"></a> [hub01\_network\_vcn\_display\_name](#input\_hub01\_network\_vcn\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_hub01_network_vcn_network_compartment_name"></a> [hub01\_network\_vcn\_network\_compartment\_name](#input\_hub01\_network\_vcn\_network\_compartment\_name) | Name of the compartment where the VCN will be created | `any` | n/a | yes |
| <a name="input_prd01_network_custom_search_domain"></a> [prd01\_network\_custom\_search\_domain](#input\_prd01\_network\_custom\_search\_domain) | A domain name where the custom option can be applied | `any` | n/a | yes |
| <a name="input_prd01_network_dhcp_options_display_name"></a> [prd01\_network\_dhcp\_options\_display\_name](#input\_prd01\_network\_dhcp\_options\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_prd01_network_internet_gateway_display_name"></a> [prd01\_network\_internet\_gateway\_display\_name](#input\_prd01\_network\_internet\_gateway\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_prd01_network_internet_gateway_enabled"></a> [prd01\_network\_internet\_gateway\_enabled](#input\_prd01\_network\_internet\_gateway\_enabled) | Describes if the Internet Gateway is enabled upon creation or not | `bool` | `true` | no |
| <a name="input_prd01_network_is_private_subnet_private"></a> [prd01\_network\_is\_private\_subnet\_private](#input\_prd01\_network\_is\_private\_subnet\_private) | Describes if the subnet is private or not | `bool` | `true` | no |
| <a name="input_prd01_network_is_public_subnet_private"></a> [prd01\_network\_is\_public\_subnet\_private](#input\_prd01\_network\_is\_public\_subnet\_private) | Describes if the subnet is private or not | `bool` | `false` | no |
| <a name="input_prd01_network_is_spoke"></a> [prd01\_network\_is\_spoke](#input\_prd01\_network\_is\_spoke) | Boolean that describes if the compartment is a spoke or not | `bool` | `true` | no |
| <a name="input_prd01_network_lpg_count"></a> [prd01\_network\_lpg\_count](#input\_prd01\_network\_lpg\_count) | Number of LPG to create | `number` | `1` | no |
| <a name="input_prd01_network_lpg_display_name_base"></a> [prd01\_network\_lpg\_display\_name\_base](#input\_prd01\_network\_lpg\_display\_name\_base) | Local Peering Gateway Display Name Base | `any` | n/a | yes |
| <a name="input_prd01_network_nat_gateway_display_name"></a> [prd01\_network\_nat\_gateway\_display\_name](#input\_prd01\_network\_nat\_gateway\_display\_name) | NAT Gateway Display Name | `any` | n/a | yes |
| <a name="input_prd01_network_peered_lpg_display_name"></a> [prd01\_network\_peered\_lpg\_display\_name](#input\_prd01\_network\_peered\_lpg\_display\_name) | Display name of peered network | `string` | `""` | no |
| <a name="input_prd01_network_peered_vcn_network_compartment_name"></a> [prd01\_network\_peered\_vcn\_network\_compartment\_name](#input\_prd01\_network\_peered\_vcn\_network\_compartment\_name) | Compartment name of origin VCN to peer | `string` | `""` | no |
| <a name="input_prd01_network_private_route_table_display_name"></a> [prd01\_network\_private\_route\_table\_display\_name](#input\_prd01\_network\_private\_route\_table\_display\_name) | Private Route Table Display Name. | `any` | n/a | yes |
| <a name="input_prd01_network_private_route_table_nat_route_rules_description"></a> [prd01\_network\_private\_route\_table\_nat\_route\_rules\_description](#input\_prd01\_network\_private\_route\_table\_nat\_route\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"NAT Gateway default route"` | no |
| <a name="input_prd01_network_private_route_table_nat_route_rules_destination"></a> [prd01\_network\_private\_route\_table\_nat\_route\_rules\_destination](#input\_prd01\_network\_private\_route\_table\_nat\_route\_rules\_destination) | private\_route\_table\_route\_rules\_destination | `string` | `"0.0.0.0/0"` | no |
| <a name="input_prd01_network_private_route_table_nat_route_rules_destination_type"></a> [prd01\_network\_private\_route\_table\_nat\_route\_rules\_destination\_type](#input\_prd01\_network\_private\_route\_table\_nat\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_prd01_network_private_route_table_svc_route_rules_description"></a> [prd01\_network\_private\_route\_table\_svc\_route\_rules\_description](#input\_prd01\_network\_private\_route\_table\_svc\_route\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"Service Gateway default route"` | no |
| <a name="input_prd01_network_private_route_table_svc_route_rules_destination_type"></a> [prd01\_network\_private\_route\_table\_svc\_route\_rules\_destination\_type](#input\_prd01\_network\_private\_route\_table\_svc\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"SERVICE_CIDR_BLOCK"` | no |
| <a name="input_prd01_network_private_security_list_display_name"></a> [prd01\_network\_private\_security\_list\_display\_name](#input\_prd01\_network\_private\_security\_list\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_prd01_network_private_security_list_egress_security_rules_description"></a> [prd01\_network\_private\_security\_list\_egress\_security\_rules\_description](#input\_prd01\_network\_private\_security\_list\_egress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All egress rule for all protocols and IP Addresses"` | no |
| <a name="input_prd01_network_private_security_list_egress_security_rules_destination"></a> [prd01\_network\_private\_security\_list\_egress\_security\_rules\_destination](#input\_prd01\_network\_private\_security\_list\_egress\_security\_rules\_destination) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet originating from the instance can go to. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_prd01_network_private_security_list_egress_security_rules_destination_type"></a> [prd01\_network\_private\_security\_list\_egress\_security\_rules\_destination\_type](#input\_prd01\_network\_private\_security\_list\_egress\_security\_rules\_destination\_type) | Optional) (Updatable) Type of destination for the rule. The default is CIDR\_BLOCK | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_prd01_network_private_security_list_egress_security_rules_protocol"></a> [prd01\_network\_private\_security\_list\_egress\_security\_rules\_protocol](#input\_prd01\_network\_private\_security\_list\_egress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_prd01_network_private_security_list_egress_security_rules_stateless"></a> [prd01\_network\_private\_security\_list\_egress\_security\_rules\_stateless](#input\_prd01\_network\_private\_security\_list\_egress\_security\_rules\_stateless) | (Optional) (Updatable) A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if egress traffic allows TCP destination port 80, there should be an ingress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_prd01_network_private_security_list_ingress_security_rules_description"></a> [prd01\_network\_private\_security\_list\_ingress\_security\_rules\_description](#input\_prd01\_network\_private\_security\_list\_ingress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All traffic in for private security List"` | no |
| <a name="input_prd01_network_private_security_list_ingress_security_rules_protocol"></a> [prd01\_network\_private\_security\_list\_ingress\_security\_rules\_protocol](#input\_prd01\_network\_private\_security\_list\_ingress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_prd01_network_private_security_list_ingress_security_rules_source"></a> [prd01\_network\_private\_security\_list\_ingress\_security\_rules\_source](#input\_prd01\_network\_private\_security\_list\_ingress\_security\_rules\_source) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet coming into the instance can come from. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_prd01_network_private_security_list_ingress_security_rules_source_type"></a> [prd01\_network\_private\_security\_list\_ingress\_security\_rules\_source\_type](#input\_prd01\_network\_private\_security\_list\_ingress\_security\_rules\_source\_type) | Type of source for the rule. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_prd01_network_private_security_list_ingress_security_rules_stateless"></a> [prd01\_network\_private\_security\_list\_ingress\_security\_rules\_stateless](#input\_prd01\_network\_private\_security\_list\_ingress\_security\_rules\_stateless) | A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if ingress traffic allows TCP destination port 80, there should be an egress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_prd01_network_private_subnet_cidr_block_map"></a> [prd01\_network\_private\_subnet\_cidr\_block\_map](#input\_prd01\_network\_private\_subnet\_cidr\_block\_map) | Map of CIDR Blocks associated to private subnets and it's corresponding names | `map(any)` | n/a | yes |
| <a name="input_prd01_network_public_route_table_display_name"></a> [prd01\_network\_public\_route\_table\_display\_name](#input\_prd01\_network\_public\_route\_table\_display\_name) | Public Route Table Display Name. | `any` | n/a | yes |
| <a name="input_prd01_network_public_route_table_inet_route_rules_description"></a> [prd01\_network\_public\_route\_table\_inet\_route\_rules\_description](#input\_prd01\_network\_public\_route\_table\_inet\_route\_rules\_description) | Description of Route Table Entry for Internet Gateway | `string` | `"Route entry for Internet Gateway"` | no |
| <a name="input_prd01_network_public_route_table_inet_route_rules_destination"></a> [prd01\_network\_public\_route\_table\_inet\_route\_rules\_destination](#input\_prd01\_network\_public\_route\_table\_inet\_route\_rules\_destination) | private\_route\_table\_route\_rules\_destination | `string` | `"0.0.0.0/0"` | no |
| <a name="input_prd01_network_public_route_table_inet_route_rules_destination_type"></a> [prd01\_network\_public\_route\_table\_inet\_route\_rules\_destination\_type](#input\_prd01\_network\_public\_route\_table\_inet\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_prd01_network_public_route_table_svc_route_rules_description"></a> [prd01\_network\_public\_route\_table\_svc\_route\_rules\_description](#input\_prd01\_network\_public\_route\_table\_svc\_route\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"Service Gateway default route"` | no |
| <a name="input_prd01_network_public_route_table_svc_route_rules_destination_type"></a> [prd01\_network\_public\_route\_table\_svc\_route\_rules\_destination\_type](#input\_prd01\_network\_public\_route\_table\_svc\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"SERVICE_CIDR_BLOCK"` | no |
| <a name="input_prd01_network_public_security_list_display_name"></a> [prd01\_network\_public\_security\_list\_display\_name](#input\_prd01\_network\_public\_security\_list\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_prd01_network_public_security_list_egress_security_rules_description"></a> [prd01\_network\_public\_security\_list\_egress\_security\_rules\_description](#input\_prd01\_network\_public\_security\_list\_egress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All egress rule for all protocols and IP Addresses"` | no |
| <a name="input_prd01_network_public_security_list_egress_security_rules_destination"></a> [prd01\_network\_public\_security\_list\_egress\_security\_rules\_destination](#input\_prd01\_network\_public\_security\_list\_egress\_security\_rules\_destination) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet originating from the instance can go to. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_prd01_network_public_security_list_egress_security_rules_destination_type"></a> [prd01\_network\_public\_security\_list\_egress\_security\_rules\_destination\_type](#input\_prd01\_network\_public\_security\_list\_egress\_security\_rules\_destination\_type) | Optional) (Updatable) Type of destination for the rule. The default is CIDR\_BLOCK | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_prd01_network_public_security_list_egress_security_rules_protocol"></a> [prd01\_network\_public\_security\_list\_egress\_security\_rules\_protocol](#input\_prd01\_network\_public\_security\_list\_egress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_prd01_network_public_security_list_egress_security_rules_stateless"></a> [prd01\_network\_public\_security\_list\_egress\_security\_rules\_stateless](#input\_prd01\_network\_public\_security\_list\_egress\_security\_rules\_stateless) | (Optional) (Updatable) A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if egress traffic allows TCP destination port 80, there should be an ingress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_prd01_network_public_security_list_ingress_security_rules_description"></a> [prd01\_network\_public\_security\_list\_ingress\_security\_rules\_description](#input\_prd01\_network\_public\_security\_list\_ingress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All traffic in for Public Security List"` | no |
| <a name="input_prd01_network_public_security_list_ingress_security_rules_protocol"></a> [prd01\_network\_public\_security\_list\_ingress\_security\_rules\_protocol](#input\_prd01\_network\_public\_security\_list\_ingress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_prd01_network_public_security_list_ingress_security_rules_source"></a> [prd01\_network\_public\_security\_list\_ingress\_security\_rules\_source](#input\_prd01\_network\_public\_security\_list\_ingress\_security\_rules\_source) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet coming into the instance can come from. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_prd01_network_public_security_list_ingress_security_rules_source_type"></a> [prd01\_network\_public\_security\_list\_ingress\_security\_rules\_source\_type](#input\_prd01\_network\_public\_security\_list\_ingress\_security\_rules\_source\_type) | Type of source for the rule. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_prd01_network_public_security_list_ingress_security_rules_stateless"></a> [prd01\_network\_public\_security\_list\_ingress\_security\_rules\_stateless](#input\_prd01\_network\_public\_security\_list\_ingress\_security\_rules\_stateless) | A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if ingress traffic allows TCP destination port 80, there should be an egress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_prd01_network_public_subnet_cidr_block_map"></a> [prd01\_network\_public\_subnet\_cidr\_block\_map](#input\_prd01\_network\_public\_subnet\_cidr\_block\_map) | Map of CIDR Blocks associated to private subnets and it's corresponding names | `map(any)` | n/a | yes |
| <a name="input_prd01_network_service_gateway_display_name"></a> [prd01\_network\_service\_gateway\_display\_name](#input\_prd01\_network\_service\_gateway\_display\_name) | Service Gateway Display Name | `any` | n/a | yes |
| <a name="input_prd01_network_vcn_cidr_blocks"></a> [prd01\_network\_vcn\_cidr\_blocks](#input\_prd01\_network\_vcn\_cidr\_blocks) | The list of one or more IPv4 CIDR blocks for the VCN | `any` | n/a | yes |
| <a name="input_prd01_network_vcn_display_name"></a> [prd01\_network\_vcn\_display\_name](#input\_prd01\_network\_vcn\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_prd01_network_vcn_network_compartment_name"></a> [prd01\_network\_vcn\_network\_compartment\_name](#input\_prd01\_network\_vcn\_network\_compartment\_name) | Name of the compartment where the VCN will be created | `any` | n/a | yes |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | Private Key Absolute path location where terraform is executed | `any` | n/a | yes |
| <a name="input_qa01_network_custom_search_domain"></a> [qa01\_network\_custom\_search\_domain](#input\_qa01\_network\_custom\_search\_domain) | A domain name where the custom option can be applied | `any` | n/a | yes |
| <a name="input_qa01_network_dhcp_options_display_name"></a> [qa01\_network\_dhcp\_options\_display\_name](#input\_qa01\_network\_dhcp\_options\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_qa01_network_internet_gateway_display_name"></a> [qa01\_network\_internet\_gateway\_display\_name](#input\_qa01\_network\_internet\_gateway\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_qa01_network_internet_gateway_enabled"></a> [qa01\_network\_internet\_gateway\_enabled](#input\_qa01\_network\_internet\_gateway\_enabled) | Describes if the Internet Gateway is enabled upon creation or not | `bool` | `true` | no |
| <a name="input_qa01_network_is_private_subnet_private"></a> [qa01\_network\_is\_private\_subnet\_private](#input\_qa01\_network\_is\_private\_subnet\_private) | Describes if the subnet is private or not | `bool` | `true` | no |
| <a name="input_qa01_network_is_public_subnet_private"></a> [qa01\_network\_is\_public\_subnet\_private](#input\_qa01\_network\_is\_public\_subnet\_private) | Describes if the subnet is private or not | `bool` | `false` | no |
| <a name="input_qa01_network_is_spoke"></a> [qa01\_network\_is\_spoke](#input\_qa01\_network\_is\_spoke) | Boolean that describes if the compartment is a spoke or not | `bool` | `true` | no |
| <a name="input_qa01_network_lpg_count"></a> [qa01\_network\_lpg\_count](#input\_qa01\_network\_lpg\_count) | Number of LPG to create | `number` | `1` | no |
| <a name="input_qa01_network_lpg_display_name_base"></a> [qa01\_network\_lpg\_display\_name\_base](#input\_qa01\_network\_lpg\_display\_name\_base) | Local Peering Gateway Display Name Base | `any` | n/a | yes |
| <a name="input_qa01_network_nat_gateway_display_name"></a> [qa01\_network\_nat\_gateway\_display\_name](#input\_qa01\_network\_nat\_gateway\_display\_name) | NAT Gateway Display Name | `any` | n/a | yes |
| <a name="input_qa01_network_peered_lpg_display_name"></a> [qa01\_network\_peered\_lpg\_display\_name](#input\_qa01\_network\_peered\_lpg\_display\_name) | Display name of peered network | `string` | `""` | no |
| <a name="input_qa01_network_peered_vcn_network_compartment_name"></a> [qa01\_network\_peered\_vcn\_network\_compartment\_name](#input\_qa01\_network\_peered\_vcn\_network\_compartment\_name) | Compartment name of origin VCN to peer | `string` | `""` | no |
| <a name="input_qa01_network_private_route_table_display_name"></a> [qa01\_network\_private\_route\_table\_display\_name](#input\_qa01\_network\_private\_route\_table\_display\_name) | Private Route Table Display Name. | `any` | n/a | yes |
| <a name="input_qa01_network_private_route_table_nat_route_rules_description"></a> [qa01\_network\_private\_route\_table\_nat\_route\_rules\_description](#input\_qa01\_network\_private\_route\_table\_nat\_route\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"NAT Gateway default route"` | no |
| <a name="input_qa01_network_private_route_table_nat_route_rules_destination"></a> [qa01\_network\_private\_route\_table\_nat\_route\_rules\_destination](#input\_qa01\_network\_private\_route\_table\_nat\_route\_rules\_destination) | private\_route\_table\_route\_rules\_destination | `string` | `"0.0.0.0/0"` | no |
| <a name="input_qa01_network_private_route_table_nat_route_rules_destination_type"></a> [qa01\_network\_private\_route\_table\_nat\_route\_rules\_destination\_type](#input\_qa01\_network\_private\_route\_table\_nat\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_qa01_network_private_route_table_svc_route_rules_description"></a> [qa01\_network\_private\_route\_table\_svc\_route\_rules\_description](#input\_qa01\_network\_private\_route\_table\_svc\_route\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"Service Gateway default route"` | no |
| <a name="input_qa01_network_private_route_table_svc_route_rules_destination_type"></a> [qa01\_network\_private\_route\_table\_svc\_route\_rules\_destination\_type](#input\_qa01\_network\_private\_route\_table\_svc\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"SERVICE_CIDR_BLOCK"` | no |
| <a name="input_qa01_network_private_security_list_display_name"></a> [qa01\_network\_private\_security\_list\_display\_name](#input\_qa01\_network\_private\_security\_list\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_qa01_network_private_security_list_egress_security_rules_description"></a> [qa01\_network\_private\_security\_list\_egress\_security\_rules\_description](#input\_qa01\_network\_private\_security\_list\_egress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All egress rule for all protocols and IP Addresses"` | no |
| <a name="input_qa01_network_private_security_list_egress_security_rules_destination"></a> [qa01\_network\_private\_security\_list\_egress\_security\_rules\_destination](#input\_qa01\_network\_private\_security\_list\_egress\_security\_rules\_destination) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet originating from the instance can go to. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_qa01_network_private_security_list_egress_security_rules_destination_type"></a> [qa01\_network\_private\_security\_list\_egress\_security\_rules\_destination\_type](#input\_qa01\_network\_private\_security\_list\_egress\_security\_rules\_destination\_type) | Optional) (Updatable) Type of destination for the rule. The default is CIDR\_BLOCK | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_qa01_network_private_security_list_egress_security_rules_protocol"></a> [qa01\_network\_private\_security\_list\_egress\_security\_rules\_protocol](#input\_qa01\_network\_private\_security\_list\_egress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_qa01_network_private_security_list_egress_security_rules_stateless"></a> [qa01\_network\_private\_security\_list\_egress\_security\_rules\_stateless](#input\_qa01\_network\_private\_security\_list\_egress\_security\_rules\_stateless) | (Optional) (Updatable) A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if egress traffic allows TCP destination port 80, there should be an ingress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_qa01_network_private_security_list_ingress_security_rules_description"></a> [qa01\_network\_private\_security\_list\_ingress\_security\_rules\_description](#input\_qa01\_network\_private\_security\_list\_ingress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All traffic in for private security List"` | no |
| <a name="input_qa01_network_private_security_list_ingress_security_rules_protocol"></a> [qa01\_network\_private\_security\_list\_ingress\_security\_rules\_protocol](#input\_qa01\_network\_private\_security\_list\_ingress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_qa01_network_private_security_list_ingress_security_rules_source"></a> [qa01\_network\_private\_security\_list\_ingress\_security\_rules\_source](#input\_qa01\_network\_private\_security\_list\_ingress\_security\_rules\_source) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet coming into the instance can come from. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_qa01_network_private_security_list_ingress_security_rules_source_type"></a> [qa01\_network\_private\_security\_list\_ingress\_security\_rules\_source\_type](#input\_qa01\_network\_private\_security\_list\_ingress\_security\_rules\_source\_type) | Type of source for the rule. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_qa01_network_private_security_list_ingress_security_rules_stateless"></a> [qa01\_network\_private\_security\_list\_ingress\_security\_rules\_stateless](#input\_qa01\_network\_private\_security\_list\_ingress\_security\_rules\_stateless) | A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if ingress traffic allows TCP destination port 80, there should be an egress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_qa01_network_private_subnet_cidr_block_map"></a> [qa01\_network\_private\_subnet\_cidr\_block\_map](#input\_qa01\_network\_private\_subnet\_cidr\_block\_map) | Map of CIDR Blocks associated to private subnets and it's corresponding names | `map(any)` | n/a | yes |
| <a name="input_qa01_network_public_route_table_display_name"></a> [qa01\_network\_public\_route\_table\_display\_name](#input\_qa01\_network\_public\_route\_table\_display\_name) | Public Route Table Display Name. | `any` | n/a | yes |
| <a name="input_qa01_network_public_route_table_inet_route_rules_description"></a> [qa01\_network\_public\_route\_table\_inet\_route\_rules\_description](#input\_qa01\_network\_public\_route\_table\_inet\_route\_rules\_description) | Description of Route Table Entry for Internet Gateway | `string` | `"Route entry for Internet Gateway"` | no |
| <a name="input_qa01_network_public_route_table_inet_route_rules_destination"></a> [qa01\_network\_public\_route\_table\_inet\_route\_rules\_destination](#input\_qa01\_network\_public\_route\_table\_inet\_route\_rules\_destination) | private\_route\_table\_route\_rules\_destination | `string` | `"0.0.0.0/0"` | no |
| <a name="input_qa01_network_public_route_table_inet_route_rules_destination_type"></a> [qa01\_network\_public\_route\_table\_inet\_route\_rules\_destination\_type](#input\_qa01\_network\_public\_route\_table\_inet\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_qa01_network_public_route_table_svc_route_rules_description"></a> [qa01\_network\_public\_route\_table\_svc\_route\_rules\_description](#input\_qa01\_network\_public\_route\_table\_svc\_route\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"Service Gateway default route"` | no |
| <a name="input_qa01_network_public_route_table_svc_route_rules_destination_type"></a> [qa01\_network\_public\_route\_table\_svc\_route\_rules\_destination\_type](#input\_qa01\_network\_public\_route\_table\_svc\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"SERVICE_CIDR_BLOCK"` | no |
| <a name="input_qa01_network_public_security_list_display_name"></a> [qa01\_network\_public\_security\_list\_display\_name](#input\_qa01\_network\_public\_security\_list\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_qa01_network_public_security_list_egress_security_rules_description"></a> [qa01\_network\_public\_security\_list\_egress\_security\_rules\_description](#input\_qa01\_network\_public\_security\_list\_egress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All egress rule for all protocols and IP Addresses"` | no |
| <a name="input_qa01_network_public_security_list_egress_security_rules_destination"></a> [qa01\_network\_public\_security\_list\_egress\_security\_rules\_destination](#input\_qa01\_network\_public\_security\_list\_egress\_security\_rules\_destination) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet originating from the instance can go to. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_qa01_network_public_security_list_egress_security_rules_destination_type"></a> [qa01\_network\_public\_security\_list\_egress\_security\_rules\_destination\_type](#input\_qa01\_network\_public\_security\_list\_egress\_security\_rules\_destination\_type) | Optional) (Updatable) Type of destination for the rule. The default is CIDR\_BLOCK | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_qa01_network_public_security_list_egress_security_rules_protocol"></a> [qa01\_network\_public\_security\_list\_egress\_security\_rules\_protocol](#input\_qa01\_network\_public\_security\_list\_egress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_qa01_network_public_security_list_egress_security_rules_stateless"></a> [qa01\_network\_public\_security\_list\_egress\_security\_rules\_stateless](#input\_qa01\_network\_public\_security\_list\_egress\_security\_rules\_stateless) | (Optional) (Updatable) A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if egress traffic allows TCP destination port 80, there should be an ingress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_qa01_network_public_security_list_ingress_security_rules_description"></a> [qa01\_network\_public\_security\_list\_ingress\_security\_rules\_description](#input\_qa01\_network\_public\_security\_list\_ingress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All traffic in for Public Security List"` | no |
| <a name="input_qa01_network_public_security_list_ingress_security_rules_protocol"></a> [qa01\_network\_public\_security\_list\_ingress\_security\_rules\_protocol](#input\_qa01\_network\_public\_security\_list\_ingress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_qa01_network_public_security_list_ingress_security_rules_source"></a> [qa01\_network\_public\_security\_list\_ingress\_security\_rules\_source](#input\_qa01\_network\_public\_security\_list\_ingress\_security\_rules\_source) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet coming into the instance can come from. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_qa01_network_public_security_list_ingress_security_rules_source_type"></a> [qa01\_network\_public\_security\_list\_ingress\_security\_rules\_source\_type](#input\_qa01\_network\_public\_security\_list\_ingress\_security\_rules\_source\_type) | Type of source for the rule. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_qa01_network_public_security_list_ingress_security_rules_stateless"></a> [qa01\_network\_public\_security\_list\_ingress\_security\_rules\_stateless](#input\_qa01\_network\_public\_security\_list\_ingress\_security\_rules\_stateless) | A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if ingress traffic allows TCP destination port 80, there should be an egress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_qa01_network_public_subnet_cidr_block_map"></a> [qa01\_network\_public\_subnet\_cidr\_block\_map](#input\_qa01\_network\_public\_subnet\_cidr\_block\_map) | Map of CIDR Blocks associated to private subnets and it's corresponding names | `map(any)` | n/a | yes |
| <a name="input_qa01_network_service_gateway_display_name"></a> [qa01\_network\_service\_gateway\_display\_name](#input\_qa01\_network\_service\_gateway\_display\_name) | Service Gateway Display Name | `any` | n/a | yes |
| <a name="input_qa01_network_vcn_cidr_blocks"></a> [qa01\_network\_vcn\_cidr\_blocks](#input\_qa01\_network\_vcn\_cidr\_blocks) | The list of one or more IPv4 CIDR blocks for the VCN | `any` | n/a | yes |
| <a name="input_qa01_network_vcn_display_name"></a> [qa01\_network\_vcn\_display\_name](#input\_qa01\_network\_vcn\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_qa01_network_vcn_network_compartment_name"></a> [qa01\_network\_vcn\_network\_compartment\_name](#input\_qa01\_network\_vcn\_network\_compartment\_name) | Name of the compartment where the VCN will be created | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Target region where artifacts are going to be created | `any` | n/a | yes |
| <a name="input_sbx01_network_custom_search_domain"></a> [sbx01\_network\_custom\_search\_domain](#input\_sbx01\_network\_custom\_search\_domain) | A domain name where the custom option can be applied | `any` | n/a | yes |
| <a name="input_sbx01_network_dhcp_options_display_name"></a> [sbx01\_network\_dhcp\_options\_display\_name](#input\_sbx01\_network\_dhcp\_options\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_sbx01_network_internet_gateway_display_name"></a> [sbx01\_network\_internet\_gateway\_display\_name](#input\_sbx01\_network\_internet\_gateway\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_sbx01_network_internet_gateway_enabled"></a> [sbx01\_network\_internet\_gateway\_enabled](#input\_sbx01\_network\_internet\_gateway\_enabled) | Describes if the Internet Gateway is enabled upon creation or not | `bool` | `true` | no |
| <a name="input_sbx01_network_is_private_subnet_private"></a> [sbx01\_network\_is\_private\_subnet\_private](#input\_sbx01\_network\_is\_private\_subnet\_private) | Describes if the subnet is private or not | `bool` | `true` | no |
| <a name="input_sbx01_network_is_public_subnet_private"></a> [sbx01\_network\_is\_public\_subnet\_private](#input\_sbx01\_network\_is\_public\_subnet\_private) | Describes if the subnet is private or not | `bool` | `false` | no |
| <a name="input_sbx01_network_is_spoke"></a> [sbx01\_network\_is\_spoke](#input\_sbx01\_network\_is\_spoke) | Boolean that describes if the compartment is a spoke or not | `bool` | `true` | no |
| <a name="input_sbx01_network_lpg_count"></a> [sbx01\_network\_lpg\_count](#input\_sbx01\_network\_lpg\_count) | Number of LPG to create | `number` | `1` | no |
| <a name="input_sbx01_network_lpg_display_name_base"></a> [sbx01\_network\_lpg\_display\_name\_base](#input\_sbx01\_network\_lpg\_display\_name\_base) | Local Peering Gateway Display Name Base | `any` | n/a | yes |
| <a name="input_sbx01_network_nat_gateway_display_name"></a> [sbx01\_network\_nat\_gateway\_display\_name](#input\_sbx01\_network\_nat\_gateway\_display\_name) | NAT Gateway Display Name | `any` | n/a | yes |
| <a name="input_sbx01_network_peered_lpg_display_name"></a> [sbx01\_network\_peered\_lpg\_display\_name](#input\_sbx01\_network\_peered\_lpg\_display\_name) | Display name of peered network | `string` | `""` | no |
| <a name="input_sbx01_network_peered_vcn_network_compartment_name"></a> [sbx01\_network\_peered\_vcn\_network\_compartment\_name](#input\_sbx01\_network\_peered\_vcn\_network\_compartment\_name) | Compartment name of origin VCN to peer | `string` | `""` | no |
| <a name="input_sbx01_network_private_route_table_display_name"></a> [sbx01\_network\_private\_route\_table\_display\_name](#input\_sbx01\_network\_private\_route\_table\_display\_name) | Private Route Table Display Name. | `any` | n/a | yes |
| <a name="input_sbx01_network_private_route_table_nat_route_rules_description"></a> [sbx01\_network\_private\_route\_table\_nat\_route\_rules\_description](#input\_sbx01\_network\_private\_route\_table\_nat\_route\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"NAT Gateway default route"` | no |
| <a name="input_sbx01_network_private_route_table_nat_route_rules_destination"></a> [sbx01\_network\_private\_route\_table\_nat\_route\_rules\_destination](#input\_sbx01\_network\_private\_route\_table\_nat\_route\_rules\_destination) | private\_route\_table\_route\_rules\_destination | `string` | `"0.0.0.0/0"` | no |
| <a name="input_sbx01_network_private_route_table_nat_route_rules_destination_type"></a> [sbx01\_network\_private\_route\_table\_nat\_route\_rules\_destination\_type](#input\_sbx01\_network\_private\_route\_table\_nat\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_sbx01_network_private_route_table_svc_route_rules_description"></a> [sbx01\_network\_private\_route\_table\_svc\_route\_rules\_description](#input\_sbx01\_network\_private\_route\_table\_svc\_route\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"Service Gateway default route"` | no |
| <a name="input_sbx01_network_private_route_table_svc_route_rules_destination_type"></a> [sbx01\_network\_private\_route\_table\_svc\_route\_rules\_destination\_type](#input\_sbx01\_network\_private\_route\_table\_svc\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"SERVICE_CIDR_BLOCK"` | no |
| <a name="input_sbx01_network_private_security_list_display_name"></a> [sbx01\_network\_private\_security\_list\_display\_name](#input\_sbx01\_network\_private\_security\_list\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_sbx01_network_private_security_list_egress_security_rules_description"></a> [sbx01\_network\_private\_security\_list\_egress\_security\_rules\_description](#input\_sbx01\_network\_private\_security\_list\_egress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All egress rule for all protocols and IP Addresses"` | no |
| <a name="input_sbx01_network_private_security_list_egress_security_rules_destination"></a> [sbx01\_network\_private\_security\_list\_egress\_security\_rules\_destination](#input\_sbx01\_network\_private\_security\_list\_egress\_security\_rules\_destination) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet originating from the instance can go to. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_sbx01_network_private_security_list_egress_security_rules_destination_type"></a> [sbx01\_network\_private\_security\_list\_egress\_security\_rules\_destination\_type](#input\_sbx01\_network\_private\_security\_list\_egress\_security\_rules\_destination\_type) | Optional) (Updatable) Type of destination for the rule. The default is CIDR\_BLOCK | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_sbx01_network_private_security_list_egress_security_rules_protocol"></a> [sbx01\_network\_private\_security\_list\_egress\_security\_rules\_protocol](#input\_sbx01\_network\_private\_security\_list\_egress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_sbx01_network_private_security_list_egress_security_rules_stateless"></a> [sbx01\_network\_private\_security\_list\_egress\_security\_rules\_stateless](#input\_sbx01\_network\_private\_security\_list\_egress\_security\_rules\_stateless) | (Optional) (Updatable) A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if egress traffic allows TCP destination port 80, there should be an ingress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_sbx01_network_private_security_list_ingress_security_rules_description"></a> [sbx01\_network\_private\_security\_list\_ingress\_security\_rules\_description](#input\_sbx01\_network\_private\_security\_list\_ingress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All traffic in for private security List"` | no |
| <a name="input_sbx01_network_private_security_list_ingress_security_rules_protocol"></a> [sbx01\_network\_private\_security\_list\_ingress\_security\_rules\_protocol](#input\_sbx01\_network\_private\_security\_list\_ingress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_sbx01_network_private_security_list_ingress_security_rules_source"></a> [sbx01\_network\_private\_security\_list\_ingress\_security\_rules\_source](#input\_sbx01\_network\_private\_security\_list\_ingress\_security\_rules\_source) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet coming into the instance can come from. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_sbx01_network_private_security_list_ingress_security_rules_source_type"></a> [sbx01\_network\_private\_security\_list\_ingress\_security\_rules\_source\_type](#input\_sbx01\_network\_private\_security\_list\_ingress\_security\_rules\_source\_type) | Type of source for the rule. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_sbx01_network_private_security_list_ingress_security_rules_stateless"></a> [sbx01\_network\_private\_security\_list\_ingress\_security\_rules\_stateless](#input\_sbx01\_network\_private\_security\_list\_ingress\_security\_rules\_stateless) | A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if ingress traffic allows TCP destination port 80, there should be an egress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_sbx01_network_private_subnet_cidr_block_map"></a> [sbx01\_network\_private\_subnet\_cidr\_block\_map](#input\_sbx01\_network\_private\_subnet\_cidr\_block\_map) | Map of CIDR Blocks associated to private subnets and it's corresponding names | `map(any)` | n/a | yes |
| <a name="input_sbx01_network_public_route_table_display_name"></a> [sbx01\_network\_public\_route\_table\_display\_name](#input\_sbx01\_network\_public\_route\_table\_display\_name) | Public Route Table Display Name. | `any` | n/a | yes |
| <a name="input_sbx01_network_public_route_table_inet_route_rules_description"></a> [sbx01\_network\_public\_route\_table\_inet\_route\_rules\_description](#input\_sbx01\_network\_public\_route\_table\_inet\_route\_rules\_description) | Description of Route Table Entry for Internet Gateway | `string` | `"Route entry for Internet Gateway"` | no |
| <a name="input_sbx01_network_public_route_table_inet_route_rules_destination"></a> [sbx01\_network\_public\_route\_table\_inet\_route\_rules\_destination](#input\_sbx01\_network\_public\_route\_table\_inet\_route\_rules\_destination) | private\_route\_table\_route\_rules\_destination | `string` | `"0.0.0.0/0"` | no |
| <a name="input_sbx01_network_public_route_table_inet_route_rules_destination_type"></a> [sbx01\_network\_public\_route\_table\_inet\_route\_rules\_destination\_type](#input\_sbx01\_network\_public\_route\_table\_inet\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_sbx01_network_public_route_table_svc_route_rules_description"></a> [sbx01\_network\_public\_route\_table\_svc\_route\_rules\_description](#input\_sbx01\_network\_public\_route\_table\_svc\_route\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"Service Gateway default route"` | no |
| <a name="input_sbx01_network_public_route_table_svc_route_rules_destination_type"></a> [sbx01\_network\_public\_route\_table\_svc\_route\_rules\_destination\_type](#input\_sbx01\_network\_public\_route\_table\_svc\_route\_rules\_destination\_type) | (Optional) (Updatable) Type of destination for the rule. Required if you provide a destination. | `string` | `"SERVICE_CIDR_BLOCK"` | no |
| <a name="input_sbx01_network_public_security_list_display_name"></a> [sbx01\_network\_public\_security\_list\_display\_name](#input\_sbx01\_network\_public\_security\_list\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_sbx01_network_public_security_list_egress_security_rules_description"></a> [sbx01\_network\_public\_security\_list\_egress\_security\_rules\_description](#input\_sbx01\_network\_public\_security\_list\_egress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All egress rule for all protocols and IP Addresses"` | no |
| <a name="input_sbx01_network_public_security_list_egress_security_rules_destination"></a> [sbx01\_network\_public\_security\_list\_egress\_security\_rules\_destination](#input\_sbx01\_network\_public\_security\_list\_egress\_security\_rules\_destination) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet originating from the instance can go to. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_sbx01_network_public_security_list_egress_security_rules_destination_type"></a> [sbx01\_network\_public\_security\_list\_egress\_security\_rules\_destination\_type](#input\_sbx01\_network\_public\_security\_list\_egress\_security\_rules\_destination\_type) | Optional) (Updatable) Type of destination for the rule. The default is CIDR\_BLOCK | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_sbx01_network_public_security_list_egress_security_rules_protocol"></a> [sbx01\_network\_public\_security\_list\_egress\_security\_rules\_protocol](#input\_sbx01\_network\_public\_security\_list\_egress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_sbx01_network_public_security_list_egress_security_rules_stateless"></a> [sbx01\_network\_public\_security\_list\_egress\_security\_rules\_stateless](#input\_sbx01\_network\_public\_security\_list\_egress\_security\_rules\_stateless) | (Optional) (Updatable) A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if egress traffic allows TCP destination port 80, there should be an ingress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_sbx01_network_public_security_list_ingress_security_rules_description"></a> [sbx01\_network\_public\_security\_list\_ingress\_security\_rules\_description](#input\_sbx01\_network\_public\_security\_list\_ingress\_security\_rules\_description) | (Optional) (Updatable) An optional description of your choice for the rule. | `string` | `"All traffic in for Public Security List"` | no |
| <a name="input_sbx01_network_public_security_list_ingress_security_rules_protocol"></a> [sbx01\_network\_public\_security\_list\_ingress\_security\_rules\_protocol](#input\_sbx01\_network\_public\_security\_list\_ingress\_security\_rules\_protocol) | (Required) (Updatable) The transport protocol. Specify either all or an IPv4 protocol number as defined in Protocol Numbers. Options are supported only for ICMP (1), TCP (6), UDP (17), and ICMPv6 (58). | `string` | `"all"` | no |
| <a name="input_sbx01_network_public_security_list_ingress_security_rules_source"></a> [sbx01\_network\_public\_security\_list\_ingress\_security\_rules\_source](#input\_sbx01\_network\_public\_security\_list\_ingress\_security\_rules\_source) | (Required) (Updatable) Conceptually, this is the range of IP addresses that a packet coming into the instance can come from. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_sbx01_network_public_security_list_ingress_security_rules_source_type"></a> [sbx01\_network\_public\_security\_list\_ingress\_security\_rules\_source\_type](#input\_sbx01\_network\_public\_security\_list\_ingress\_security\_rules\_source\_type) | Type of source for the rule. | `string` | `"CIDR_BLOCK"` | no |
| <a name="input_sbx01_network_public_security_list_ingress_security_rules_stateless"></a> [sbx01\_network\_public\_security\_list\_ingress\_security\_rules\_stateless](#input\_sbx01\_network\_public\_security\_list\_ingress\_security\_rules\_stateless) | A stateless rule allows traffic in one direction. Remember to add a corresponding stateless rule in the other direction if you need to support bidirectional traffic. For example, if ingress traffic allows TCP destination port 80, there should be an egress rule to allow TCP source port 80. Defaults to false, which means the rule is stateful and a corresponding rule is not necessary for bidirectional traffic. | `bool` | `true` | no |
| <a name="input_sbx01_network_public_subnet_cidr_block_map"></a> [sbx01\_network\_public\_subnet\_cidr\_block\_map](#input\_sbx01\_network\_public\_subnet\_cidr\_block\_map) | Map of CIDR Blocks associated to private subnets and it's corresponding names | `map(any)` | n/a | yes |
| <a name="input_sbx01_network_service_gateway_display_name"></a> [sbx01\_network\_service\_gateway\_display\_name](#input\_sbx01\_network\_service\_gateway\_display\_name) | Service Gateway Display Name | `any` | n/a | yes |
| <a name="input_sbx01_network_vcn_cidr_blocks"></a> [sbx01\_network\_vcn\_cidr\_blocks](#input\_sbx01\_network\_vcn\_cidr\_blocks) | The list of one or more IPv4 CIDR blocks for the VCN | `any` | n/a | yes |
| <a name="input_sbx01_network_vcn_display_name"></a> [sbx01\_network\_vcn\_display\_name](#input\_sbx01\_network\_vcn\_display\_name) | (Optional) (Updatable) A user-friendly name. Does not have to be unique, and it's changeable. Avoid entering confidential information. | `any` | n/a | yes |
| <a name="input_sbx01_network_vcn_network_compartment_name"></a> [sbx01\_network\_vcn\_network\_compartment\_name](#input\_sbx01\_network\_vcn\_network\_compartment\_name) | Name of the compartment where the VCN will be created | `any` | n/a | yes |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | OCID of tenancy | `any` | n/a | yes |
| <a name="input_user_ocid"></a> [user\_ocid](#input\_user\_ocid) | User OCID in tenancy. Currently hardcoded to user denny.alquinta@oracle.com | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dev01_network"></a> [dev01\_network](#output\_dev01\_network) | VCN of dev01 |
| <a name="output_hom01_network"></a> [hom01\_network](#output\_hom01\_network) | VCN of hom01 |
| <a name="output_hub01_network"></a> [hub01\_network](#output\_hub01\_network) | VCN of hub01 |
| <a name="output_lpg_dev01"></a> [lpg\_dev01](#output\_lpg\_dev01) | Output of dev01 LPGs |
| <a name="output_lpg_hom01"></a> [lpg\_hom01](#output\_lpg\_hom01) | Output of hom01 LPGs |
| <a name="output_lpg_hub01"></a> [lpg\_hub01](#output\_lpg\_hub01) | Output of hub01 LPGs |
| <a name="output_lpg_prd01"></a> [lpg\_prd01](#output\_lpg\_prd01) | Output of prd01 LPGs |
| <a name="output_lpg_sbx01"></a> [lpg\_sbx01](#output\_lpg\_sbx01) | Output of sbx01 LPGs |
| <a name="output_prd01_network"></a> [prd01\_network](#output\_prd01\_network) | VCN of prd01 |
| <a name="output_qa01_network"></a> [qa01\_network](#output\_qa01\_network) | VCN of qa01 |
| <a name="output_sbx01_network"></a> [sbx01\_network](#output\_sbx01\_network) | VCN of sbx01 |


## Contributing
This project is open source.  Please submit your contributions by forking this repository and submitting a pull request!  Oracle appreciates any contributions that are made by the open source community.

## License
Copyright (c) 2021 Oracle and/or its affiliates.

Licensed under the Universal Permissive License (UPL), Version 1.0.

See [LICENSE](LICENSE) for more details.

