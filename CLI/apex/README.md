# OCI Cloud Bricks: Sample APEX

[![License: UPL](https://img.shields.io/badge/license-UPL-green)](https://img.shields.io/badge/license-UPL-green) [![Quality gate](https://sonarcloud.io/api/project_badges/quality_gate?project=oracle-devrel_terraform-oci-cloudbricks-examples)](https://sonarcloud.io/dashboard?id=oracle-devrel_terraform-oci-cloudbricks-examples)

## Introduction
The following system builds a Sample DBCS Database

![Reference Architecture](./images/Bricks_Architectures-DBCS.jpg)

## Getting Started
For details in how the Oracle CloudBricks Framework works, refer to the [following file](../../../README.md)

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
aws_access_key_id=202ad26f6546c71cc8990c821eece00a6b543ssa21231
aws_secret_access_key=xgYpRAiel5Yxrc9G67MGddaskjdhalsdiujlewiH3NxX4ZMe4=
```

For instructions in how to create Customer Secret Keys, go to the [following link](https://docs.oracle.com/en-us/iaas/Content/Identity/Tasks/managingcredentials.htm#To4)

---

## Components
The following system contains the following components: 

### [backend.tf](./backend.tf)

This file defines the S3 compatibility API integration to store .tfstate file into an OCI Bucket. It's content is the following: 

```go
terraform {
  backend "s3" {
    bucket   = "Precreated_bucket_to_store_tfstate_files_name"
    key      = "Samples/dbcs-database.tfstate"
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
- The `key` variable, supports a structure of your choice, by providing `/` as separators. Name of the file should always be `system_name.tfstate`
- The `region` variable contains the name id of the region where the system is being deployed at
- The `endpoint` variable contains the concatenation of the tenancy namespace and the region as depicted on above example. For instructions in how to determine the Tenancy Object Storage namespace, refer to the [following documentation](https://docs.oracle.com/en-us/iaas/Content/Object/Tasks/understandingnamespaces.htm)
- The rest of *variables* require to be set as is. **Do not change nor update these values**

---

### [datasource.tf](./datasource.tf)
This file defines the datasources required for internal tracking lookup on Open Source Project. Do not alter this file

---

### [main.tf](./main.tf) 
This file defines the main orchestration of module. The following structure is expected

```go
module "ModuleName" {

  source = "git::ssh://git@github.com/oracle-devrel/module.git?ref=v1.0.0"
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
  module  = foo
  variables = bar
  here      = bar
  ######################################## COMPARTMENT SPECIFIC VARIABLES ######################################
}
```

*Considerations*
- Whereas needed, apply variable and module overloading
- For module specifics, refer to module documentation: 
  - [terraform-oci-cloudbricks-dbcs-database](https://github.com/oracle-devrel/terraform-oci-cloudbricks-dbcs-database/blob/main/README.md)
- For variable usage, refer to section *Variable Documentation*

---

### [output.tf](./output.tf)
The following file defines the output of system, for future forward integration use with Configuration Management Tools

---


### [README.md](./README.md)
This file

---

### [system.tfvars](./system.tfvars)
The following file defines the specific variables customized using variable overloading. Please refer to backend brick module documentation for details in how to fill.
For module specifics, refer to module documentation: 
  - [terraform-oci-cloudbricks-dbcs-database](https://github.com/oracle-devrel/terraform-oci-cloudbricks-dbcs-database/blob/main/README.md)

---

### [variables.tf](./variables.tf)
The following file defines all the variables used in this system. For details on it's content, refer to section *Variable Documentation*

---

## Variable Documentation
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.5 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | >= 4.36.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 4.52.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dbcs01"></a> [dbcs01](#module\_dbcs01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-dbcs-database | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [oci_identity_region_subscriptions.home_region_subscriptions](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_region_subscriptions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dbcs01_auto_backup_enabled"></a> [dbcs01\_auto\_backup\_enabled](#input\_dbcs01\_auto\_backup\_enabled) | Defines if autobackup is enabled or not | `bool` | `false` | no |
| <a name="input_dbcs01_auto_backup_window_utc"></a> [dbcs01\_auto\_backup\_window\_utc](#input\_dbcs01\_auto\_backup\_window\_utc) | Defines the recovery 2 hour window. The values must be from '12:00AM-02:00AM\_UTC' to '10:00PM-12:00AM\_UTC', if different value is provided defaults to null (ANYTIME) | `string` | `"ANYTIME"` | no |
| <a name="input_dbcs01_character_set"></a> [dbcs01\_character\_set](#input\_dbcs01\_character\_set) | Charset used by DB | `any` | n/a | yes |
| <a name="input_dbcs01_cluster_name"></a> [dbcs01\_cluster\_name](#input\_dbcs01\_cluster\_name) | Describes the DB Cluster Name | `string` | `"DB-Cluster"` | no |
| <a name="input_dbcs01_data_storage_size_in_gb"></a> [dbcs01\_data\_storage\_size\_in\_gb](#input\_dbcs01\_data\_storage\_size\_in\_gb) | Database Storage in GB | `any` | n/a | yes |
| <a name="input_dbcs01_database_software_image_id"></a> [dbcs01\_database\_software\_image\_id](#input\_dbcs01\_database\_software\_image\_id) | Defines the OCID of the Database Software Image that should be used by database | `any` | `null` | no |
| <a name="input_dbcs01_db_admin_password"></a> [dbcs01\_db\_admin\_password](#input\_dbcs01\_db\_admin\_password) | DBCS Administration Password | `any` | n/a | yes |
| <a name="input_dbcs01_db_disk_redundancy"></a> [dbcs01\_db\_disk\_redundancy](#input\_dbcs01\_db\_disk\_redundancy) | Database Disk Redundancy | `any` | n/a | yes |
| <a name="input_dbcs01_db_display_name"></a> [dbcs01\_db\_display\_name](#input\_dbcs01\_db\_display\_name) | Database Display Name | `any` | n/a | yes |
| <a name="input_dbcs01_db_edition"></a> [dbcs01\_db\_edition](#input\_dbcs01\_db\_edition) | Database Edition | `any` | n/a | yes |
| <a name="input_dbcs01_db_home_display_name"></a> [dbcs01\_db\_home\_display\_name](#input\_dbcs01\_db\_home\_display\_name) | Database Home Display Name | `any` | n/a | yes |
| <a name="input_dbcs01_db_name"></a> [dbcs01\_db\_name](#input\_dbcs01\_db\_name) | Database Name | `any` | n/a | yes |
| <a name="input_dbcs01_db_system_shape"></a> [dbcs01\_db\_system\_shape](#input\_dbcs01\_db\_system\_shape) | DB Systems Shape | `any` | n/a | yes |
| <a name="input_dbcs01_db_version"></a> [dbcs01\_db\_version](#input\_dbcs01\_db\_version) | Database Version | `any` | n/a | yes |
| <a name="input_dbcs01_db_workload"></a> [dbcs01\_db\_workload](#input\_dbcs01\_db\_workload) | Workload intended from DB | `any` | n/a | yes |
| <a name="input_dbcs01_dbcs_availability_domain_number"></a> [dbcs01\_dbcs\_availability\_domain\_number](#input\_dbcs01\_dbcs\_availability\_domain\_number) | Defines the availability domain where OCI artifact will be created. This is a numeric value greater than 0 | `any` | n/a | yes |
| <a name="input_dbcs01_dbcs_instance_compartment_id"></a> [dbcs01\_dbcs\_instance\_compartment\_id](#input\_dbcs01\_dbcs\_instance\_compartment\_id) | Defines the compartment OCID where the infrastructure will be created | `string` | `""` | no |
| <a name="input_dbcs01_dbcs_instance_compartment_name"></a> [dbcs01\_dbcs\_instance\_compartment\_name](#input\_dbcs01\_dbcs\_instance\_compartment\_name) | Defines the compartment name where the infrastructure will be created | `string` | `""` | no |
| <a name="input_dbcs01_dbcs_network_compartment_name"></a> [dbcs01\_dbcs\_network\_compartment\_name](#input\_dbcs01\_dbcs\_network\_compartment\_name) | Defines the compartment where the Network is currently located | `any` | n/a | yes |
| <a name="input_dbcs01_dbcs_nsg_name"></a> [dbcs01\_dbcs\_nsg\_name](#input\_dbcs01\_dbcs\_nsg\_name) | Display Name of an optional Network Security Group | `string` | `""` | no |
| <a name="input_dbcs01_fault_domains"></a> [dbcs01\_fault\_domains](#input\_dbcs01\_fault\_domains) | Fault Domains | `string` | `""` | no |
| <a name="input_dbcs01_hostname"></a> [dbcs01\_hostname](#input\_dbcs01\_hostname) | DB Hostname | `any` | n/a | yes |
| <a name="input_dbcs01_license_model"></a> [dbcs01\_license\_model](#input\_dbcs01\_license\_model) | Database System License Model | `any` | n/a | yes |
| <a name="input_dbcs01_n_character_set"></a> [dbcs01\_n\_character\_set](#input\_dbcs01\_n\_character\_set) | N Charset used by DB | `any` | n/a | yes |
| <a name="input_dbcs01_network_subnet_name"></a> [dbcs01\_network\_subnet\_name](#input\_dbcs01\_network\_subnet\_name) | Defines the subnet display name where this resource will be created at | `any` | n/a | yes |
| <a name="input_dbcs01_node_count"></a> [dbcs01\_node\_count](#input\_dbcs01\_node\_count) | Amount of nodes in DB | `any` | n/a | yes |
| <a name="input_dbcs01_pdb_name"></a> [dbcs01\_pdb\_name](#input\_dbcs01\_pdb\_name) | Pluggable Database Name for DB | `any` | n/a | yes |
| <a name="input_dbcs01_recovery_window_in_days"></a> [dbcs01\_recovery\_window\_in\_days](#input\_dbcs01\_recovery\_window\_in\_days) | Defines the recovery window in days. Supported values are 7,15,30,45 and 60 days | `any` | `null` | no |
| <a name="input_dbcs01_ssh_private_is_path"></a> [dbcs01\_ssh\_private\_is\_path](#input\_dbcs01\_ssh\_private\_is\_path) | Describes if SSH Private Key is located on file or inside code | `bool` | `false` | no |
| <a name="input_dbcs01_ssh_private_key"></a> [dbcs01\_ssh\_private\_key](#input\_dbcs01\_ssh\_private\_key) | Private Key to use for latter connection to the DB on null resource | `any` | n/a | yes |
| <a name="input_dbcs01_ssh_public_is_path"></a> [dbcs01\_ssh\_public\_is\_path](#input\_dbcs01\_ssh\_public\_is\_path) | Describes if SSH Public Key is located on file or inside code | `bool` | `false` | no |
| <a name="input_dbcs01_ssh_public_key"></a> [dbcs01\_ssh\_public\_key](#input\_dbcs01\_ssh\_public\_key) | Defines SSH Public Key to be used in order to remotely connect to compute instance | `string` | n/a | yes |
| <a name="input_dbcs01_storage_management"></a> [dbcs01\_storage\_management](#input\_dbcs01\_storage\_management) | The storage option used in DB system. ASM - Automatic storage management LVM - Logical Volume management | `string` | `"ASM"` | no |
| <a name="input_dbcs01_time_zone"></a> [dbcs01\_time\_zone](#input\_dbcs01\_time\_zone) | Timezone definition for Database | `string` | `"America/Santiago"` | no |
| <a name="input_dbcs01_vcn_display_name"></a> [dbcs01\_vcn\_display\_name](#input\_dbcs01\_vcn\_display\_name) | VCN Display name to execute lookup | `any` | n/a | yes |
| <a name="input_fingerprint"></a> [fingerprint](#input\_fingerprint) | API Key Fingerprint for user\_ocid derived from public API Key imported in OCI User config | `any` | n/a | yes |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | Private Key Absolute path location where terraform is executed | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Target region where artifacts are going to be created | `any` | n/a | yes |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | OCID of tenancy | `any` | n/a | yes |
| <a name="input_user_ocid"></a> [user\_ocid](#input\_user\_ocid) | User OCID in tenancy | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_DBCSDBSystem"></a> [DBCSDBSystem](#output\_DBCSDBSystem) | Database DB System instance |
| <a name="output_DBNodesInfo"></a> [DBNodesInfo](#output\_DBNodesInfo) | DB Node hostname-IP map |
| <a name="output_DBNodesScanIPs"></a> [DBNodesScanIPs](#output\_DBNodesScanIPs) | Nodes SCAN IPs |
| <a name="output_DBNodesVIPInfo"></a> [DBNodesVIPInfo](#output\_DBNodesVIPInfo) | VIP hostname-IP map |
---

## Contributing
This project is open source.  Please submit your contributions by forking this repository and submitting a pull request!  Oracle appreciates any contributions that are made by the open source community.

## License
Copyright (c) 2021 Oracle and/or its affiliates.

Licensed under the Universal Permissive License (UPL), Version 1.0.

See [LICENSE](LICENSE) for more details.