# OCI Cloud Bricks: Sample PostgreSQL Deployment

[![License: UPL](https://img.shields.io/badge/license-UPL-green)](https://img.shields.io/badge/license-UPL-green) [![Quality gate](https://sonarcloud.io/api/project_badges/quality_gate?project=oracle-devrel_terraform-oci-cloudbricks-examples)](https://sonarcloud.io/dashboard?id=oracle-devrel_terraform-oci-cloudbricks-examples)

## Introduction
The following system builds a Sample PostgreSQL Database

![Reference Architecture](./images/Bricks_Architectures-postgresql.jpg)

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
    key      = "Samples/postgresql.tfstate"
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
  - [terraform-oci-cloudbricks-postgresql](https://github.com/oracle-devrel/terraform-oci-cloudbricks-postgresql/blob/main/README.md)
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
  - [terraform-oci-cloudbricks-postgresql](https://github.com/oracle-devrel/terraform-oci-cloudbricks-postgresql/blob/main/README.md)

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
| <a name="provider_oci"></a> [oci](#provider\_oci) | 4.51.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_postgre01"></a> [postgre01](#module\_postgre01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-postgresql | v1.0.3 |

## Resources

| Name | Type |
|------|------|
| [oci_identity_region_subscriptions.home_region_subscriptions](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_region_subscriptions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_fingerprint"></a> [fingerprint](#input\_fingerprint) | API Key Fingerprint for user\_ocid derived from public API Key imported in OCI User config | `any` | n/a | yes |
| <a name="input_postgre01_compute_nsg_name"></a> [postgre01\_compute\_nsg\_name](#input\_postgre01\_compute\_nsg\_name) | Name of the NSG associated to the compute | `string` | `""` | no |
| <a name="input_postgre01_database_backup_policy_level"></a> [postgre01\_database\_backup\_policy\_level](#input\_postgre01\_database\_backup\_policy\_level) | Backup policy level for Database ISCSI disks | `any` | n/a | yes |
| <a name="input_postgre01_database_size_in_gb"></a> [postgre01\_database\_size\_in\_gb](#input\_postgre01\_database\_size\_in\_gb) | Disk Capacity for Database | `any` | n/a | yes |
| <a name="input_postgre01_database_vpus_per_gb"></a> [postgre01\_database\_vpus\_per\_gb](#input\_postgre01\_database\_vpus\_per\_gb) | Disk VPUS for the Database | `any` | n/a | yes |
| <a name="input_postgre01_instance_backup_policy_level"></a> [postgre01\_instance\_backup\_policy\_level](#input\_postgre01\_instance\_backup\_policy\_level) | Backup policy level for instance boot volume disks | `any` | n/a | yes |
| <a name="input_postgre01_instance_os"></a> [postgre01\_instance\_os](#input\_postgre01\_instance\_os) | Operating system for compute instances | `string` | `"Oracle Linux"` | no |
| <a name="input_postgre01_linux_compute_instance_compartment_name"></a> [postgre01\_linux\_compute\_instance\_compartment\_name](#input\_postgre01\_linux\_compute\_instance\_compartment\_name) | Defines the compartment name where the infrastructure will be created | `any` | n/a | yes |
| <a name="input_postgre01_linux_compute_network_compartment_name"></a> [postgre01\_linux\_compute\_network\_compartment\_name](#input\_postgre01\_linux\_compute\_network\_compartment\_name) | Defines the compartment where the Network is currently located | `any` | n/a | yes |
| <a name="input_postgre01_linux_os_version"></a> [postgre01\_linux\_os\_version](#input\_postgre01\_linux\_os\_version) | Operating system version for all Linux instances | `string` | `"7.9"` | no |
| <a name="input_postgre01_postgresql_deploy_hotstandby1"></a> [postgre01\_postgresql\_deploy\_hotstandby1](#input\_postgre01\_postgresql\_deploy\_hotstandby1) | Boolean to determine if to provision hotstandby1 | `bool` | `false` | no |
| <a name="input_postgre01_postgresql_deploy_hotstandby2"></a> [postgre01\_postgresql\_deploy\_hotstandby2](#input\_postgre01\_postgresql\_deploy\_hotstandby2) | Boolean to determine if to provision hotstandby2 | `bool` | `false` | no |
| <a name="input_postgre01_postgresql_hotstandby1_ad"></a> [postgre01\_postgresql\_hotstandby1\_ad](#input\_postgre01\_postgresql\_hotstandby1\_ad) | The availability domain to provision the hoststandby1 instance in | `string` | `""` | no |
| <a name="input_postgre01_postgresql_hotstandby1_fd"></a> [postgre01\_postgresql\_hotstandby1\_fd](#input\_postgre01\_postgresql\_hotstandby1\_fd) | The fault domain to provision the hoststandby1 instance in | `string` | `""` | no |
| <a name="input_postgre01_postgresql_hotstandby2_ad"></a> [postgre01\_postgresql\_hotstandby2\_ad](#input\_postgre01\_postgresql\_hotstandby2\_ad) | The availability domain to provision the hoststandby2 instance in | `string` | `""` | no |
| <a name="input_postgre01_postgresql_hotstandby2_fd"></a> [postgre01\_postgresql\_hotstandby2\_fd](#input\_postgre01\_postgresql\_hotstandby2\_fd) | The fault domain to provision the hoststandby2 instance in | `string` | `""` | no |
| <a name="input_postgre01_postgresql_hotstandby_is_flex_shape"></a> [postgre01\_postgresql\_hotstandby\_is\_flex\_shape](#input\_postgre01\_postgresql\_hotstandby\_is\_flex\_shape) | Boolean to determine if the standy instances are flex or not | `bool` | `false` | no |
| <a name="input_postgre01_postgresql_hotstandby_memory_in_gb"></a> [postgre01\_postgresql\_hotstandby\_memory\_in\_gb](#input\_postgre01\_postgresql\_hotstandby\_memory\_in\_gb) | The amount of memory in GB for the standby instances to use when flex shape is enabled | `string` | `""` | no |
| <a name="input_postgre01_postgresql_hotstandby_ocpus"></a> [postgre01\_postgresql\_hotstandby\_ocpus](#input\_postgre01\_postgresql\_hotstandby\_ocpus) | The number of OCPUS for the flex instances to use when flex shape is enabled | `string` | `""` | no |
| <a name="input_postgre01_postgresql_hotstandby_shape"></a> [postgre01\_postgresql\_hotstandby\_shape](#input\_postgre01\_postgresql\_hotstandby\_shape) | The shape for the hotstandby instances to use | `string` | `""` | no |
| <a name="input_postgre01_postgresql_master_ad"></a> [postgre01\_postgresql\_master\_ad](#input\_postgre01\_postgresql\_master\_ad) | The availability domain to provision the master instance in | `any` | n/a | yes |
| <a name="input_postgre01_postgresql_master_fd"></a> [postgre01\_postgresql\_master\_fd](#input\_postgre01\_postgresql\_master\_fd) | The fault domain to provision the master instance in | `any` | n/a | yes |
| <a name="input_postgre01_postgresql_master_is_flex_shape"></a> [postgre01\_postgresql\_master\_is\_flex\_shape](#input\_postgre01\_postgresql\_master\_is\_flex\_shape) | Boolean to determine if the master instance is flex or not | `bool` | `false` | no |
| <a name="input_postgre01_postgresql_master_memory_in_gb"></a> [postgre01\_postgresql\_master\_memory\_in\_gb](#input\_postgre01\_postgresql\_master\_memory\_in\_gb) | The amount of memory in GB for the master instance to use when flex shape is enabled | `string` | `""` | no |
| <a name="input_postgre01_postgresql_master_name"></a> [postgre01\_postgresql\_master\_name](#input\_postgre01\_postgresql\_master\_name) | The name given to the master instance | `any` | n/a | yes |
| <a name="input_postgre01_postgresql_master_ocpus"></a> [postgre01\_postgresql\_master\_ocpus](#input\_postgre01\_postgresql\_master\_ocpus) | The number of OCPUS for the master instance to use when flex shape is enabled | `string` | `""` | no |
| <a name="input_postgre01_postgresql_master_shape"></a> [postgre01\_postgresql\_master\_shape](#input\_postgre01\_postgresql\_master\_shape) | The shape for the master instance to use | `any` | n/a | yes |
| <a name="input_postgre01_postgresql_password"></a> [postgre01\_postgresql\_password](#input\_postgre01\_postgresql\_password) | The password used in setup of the PostgreSQL database | `any` | n/a | yes |
| <a name="input_postgre01_postgresql_replicat_username"></a> [postgre01\_postgresql\_replicat\_username](#input\_postgre01\_postgresql\_replicat\_username) | The username used in setup of PostgreSQL replication | `string` | `"replicator"` | no |
| <a name="input_postgre01_postgresql_standyby1_name"></a> [postgre01\_postgresql\_standyby1\_name](#input\_postgre01\_postgresql\_standyby1\_name) | The name given to the standby1 instance | `string` | `""` | no |
| <a name="input_postgre01_postgresql_standyby2_name"></a> [postgre01\_postgresql\_standyby2\_name](#input\_postgre01\_postgresql\_standyby2\_name) | The name given to the standby2 instance | `string` | `""` | no |
| <a name="input_postgre01_postgresql_version"></a> [postgre01\_postgresql\_version](#input\_postgre01\_postgresql\_version) | The version of PostgreSQL used in the setup | `any` | n/a | yes |
| <a name="input_postgre01_private_network_subnet_name"></a> [postgre01\_private\_network\_subnet\_name](#input\_postgre01\_private\_network\_subnet\_name) | Defines the subnet display name where this resource will be created at | `any` | n/a | yes |
| <a name="input_postgre01_ssh_private_key"></a> [postgre01\_ssh\_private\_key](#input\_postgre01\_ssh\_private\_key) | Defines SSH Private Key to be used in order to remotely connect to compute instances | `any` | n/a | yes |
| <a name="input_postgre01_ssh_public_key"></a> [postgre01\_ssh\_public\_key](#input\_postgre01\_ssh\_public\_key) | Defines SSH Public Key to be used in order to remotely connect to compute instances | `any` | n/a | yes |
| <a name="input_postgre01_vcn_display_name"></a> [postgre01\_vcn\_display\_name](#input\_postgre01\_vcn\_display\_name) | VCN Display name to execute lookup | `any` | n/a | yes |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | Private Key Absolute path location where terraform is executed | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Target region where artifacts are going to be created | `any` | n/a | yes |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | OCID of tenancy | `any` | n/a | yes |
| <a name="input_user_ocid"></a> [user\_ocid](#input\_user\_ocid) | User OCID in tenancy. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_MasterNode"></a> [MasterNode](#output\_MasterNode) | Master Node Information |
| <a name="output_Username"></a> [Username](#output\_Username) | Username for PostgreSQL |
---

## Contributing
This project is open source.  Please submit your contributions by forking this repository and submitting a pull request!  Oracle appreciates any contributions that are made by the open source community.

## License
Copyright (c) 2021 Oracle and/or its affiliates.

Licensed under the Universal Permissive License (UPL), Version 1.0.

See [LICENSE](LICENSE) for more details.