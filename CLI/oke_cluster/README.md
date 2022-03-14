# OCI Cloud Bricks: Sample Application Load Balancer and Backend Set

[![License: UPL](https://img.shields.io/badge/license-UPL-green)](https://img.shields.io/badge/license-UPL-green) [![Quality gate](https://sonarcloud.io/api/project_badges/quality_gate?project=oracle-devrel_terraform-oci-cloudbricks-examples)](https://sonarcloud.io/dashboard?id=oracle-devrel_terraform-oci-cloudbricks-examples)

## Introduction
The following system builds an Oracle Kubernetes Engine Cluster with an Oracle Kubernetes Engine Nodepool associated to a particular compartment and subnets.

![Reference Architecture](./images/Bricks_Architectures-oke_nodepool_ref_arch.jpg)

## Getting Started
For details on how the Oracle CloudBricks Framework works, refer to the [following file](../../../README.md)

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
    key      = "Samples/sample_hub_spoke_compartment_with_parent.tfstate"
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
  - [terraform-oci-cloudbricks-lbaas-bes-single](https://github.com/oracle-devrel/terraform-oci-cloudbricks-lbaas-bes-single/blob/main/README.md)
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
  - [terraform-oci-cloudbricks-oke-cluster](https://github.com/oracle-devrel/terraform-oci-cloudbricks-oke-cluster/blob/main/README.md)
  - [terraform-oci-cloudbricks-oke-nodepool](https://github.com/oracle-devrel/terraform-oci-cloudbricks-oke-nodepool/blob/main/README.md)

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
| <a name="provider_oci"></a> [oci](#provider\_oci) | >= 4.36.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="oke01"></a> [oke01](#module\_oke01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-oke-cluster.git | v1.0.2 |
| <a name="node01"></a> [node01](#module\_node01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-oke-nodepool.git | v1.0.2 |


## Resources

| Name | Type |
|------|------|
| [oci_identity_region_subscriptions.home_region_subscriptions](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_region_subscriptions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="oke01_instance_compartment_name"></a> [oke01\_instance\_compartment\_name](#input\_backendset01\_backend\_port) | Defines the compartment name where the infrastructure will be created. | `string` | `""` | yes |
| <a name="oke01_network_compartment_name"></a> [oke01\_network\_compartment\_name](#input\_backendset01\_backend\_set\_is\_preserve\_source) | Defines the compartment where the Network is currently located. | `string` | n/a | yes |
| <a name="oke01_vcn_display_name"></a> [oke01_vcn_display_name](#input\_backendset01\_backend\_set\_name) | Defines the display name of the VCN where the cluster will allocate LBaaS Ingress Controller components. | `any` | n/a | yes |
| <a name="oke01_lbaas_network_subnet_name"></a> [oke01\_lbaas_network\_subnet\_name](#input\_backendset01\_balanced\_artifact) | Describes the display name of the subnet where LBaaS Components will be alocated by resource orchestrator. | `any` |  n/a | yes |
| <a name="oke01_endpoint_subnet_name"></a> [oke01\_endpoint\_subnet\_name](#input\_backendset01\_certificate\_name) | Determines the subnet where the control plane API will be located at. | `string` | `""` | no |
| <a name="oke01_endpoint_is_public_ip_enabled"></a> [oke01\_endpoint\_is\_public\_ip\_enabled](#input\_backendset01\_certificate\_passphrase) | Determines if OKE Control Plane is located on public or private subnet. | `any` | n/a | yes |
| <a name="oke01_availability_domain_map"></a> [oke01\_availability\_domain\_map](#input\_backendset01\_certificate\_private\_key) | The name of the availability domain in which this node is placed. | `map(any)` | n/a | yes |
| <a name="oke01_cluster_name"></a> [oke01\_cluster\_name](#input\_backendset01\_check\_protocol) | Defines the K8 Cluster Name | `any` | n/a | yes |
| <a name="oke01_k8s_version"></a> [oke01\_k8s\_version](#input\_backendset01\_checkport) | Declares K8 Version| `any` | n/a | yes |
| <a name="oke01_k8s_dashboard_enabled"></a> [oke01\_k8s\_dashboard\_enabled](#input\_backendset01\_is\_app\_bes) | Defines if Kubernetes Dashboard is enabled for cluster. | `bool` | `false` | no |
| <a name="oke01_k8s_tiller_enabled"></a> [oke01\_k8s\_tiller\_enabled](#input\_backendset01\_is\_instancepool\_bes) | Defines if Helm (Tiller) is enabled in cluster. | `bool` | `false` | no |
| <a name="node01_ssh_public_key"></a> [node01\_ssh\_public\_key](#input\_backendset01\_is\_network\_bes) | Defines SSH Public Key to be used in order to remotely connect to compute nodepool. | `string` | n/a | yes |
| <a name="node01_ssh_private_key"></a> [node01\_ssh\_private\_key](#input\_backendset01\_lbaas\_bes\_single\_instance\_compartment\_name) | Private key to log into machine. | `any` | n/a | yes |
| <a name="node01_ssh_public_is_path"></a> [node01\_ssh\_public\_is\_path](#input\_backendset01\_lbaas\_bes\_single\_network\_compartment\_name) | Describes if SSH Public Key is located on file or inside code. | `bool` | `false` | no |
| <a name="node01_ssh_private_is_path"></a> [node01\_ssh\_private\_is\_path](#input\_backendset01\_lbaas\_ca\_cert) | Describes if SSH Private Key is located on file or inside code. | `bool` | `false` | no |
| <a name="node01_oke_cluster_compartment_name"></a> [node01\_oke\_cluster\_compartment\_name](#input\_backendset01\_lbaas\_cert\_is\_path) | Defines the compartment name where the OKE cluster was created. | `string` | `""` | no |
| <a name="node01_oke_network_compartment_name"></a> [node01\_oke\_network\_compartment\_name](#input\_backendset01\_lbaas\_policy) | Defines the compartment where the Network is currently located. | `any` | n/a | yes |
| <a name="node01_oke_availability_domain_map"></a> [node01\_oke\_availability\_domain_map](#input\_backendset01\_lbaas\_pub\_cert\_is\_path) | The name of the availability domain in which this node is placed. | `map(any)` | n/a | yes |
| <a name="node01_oke_cluster_name"></a> [node01\_oke\_cluster\_name](#input\_backendset01\_lbaas\_public\_cert) | OKE cluster display name. | `any` | n/a | yes |
| <a name="node01_oke_nodepool_network_subnet_name"></a> [node01\_oke\_nodepool\_network\_subnet\_name](#input\_backendset01\_lbaas\_pvt\_key\_is\_path) | Defines the specific Subnet to be used for this resource. | `any` | n/a | yes |
| <a name="node01_k8s_version"></a> [node01\_k8s\_version](#input\_backendset01\_listen\_port) | Declares K8 Version. | `any` | n/a | yes |
| <a name="node01_node_pool_name"></a> [node01\_node\_pool\_name](#input\_backendset01\_listen\_protocol) | Node Pool Name for K8 Cluster. | `any` | n/a | yes |
| <a name="node01_node_pool_shape"></a> [node01\_node\_pool\_shape](#input\_backendset01\_listener\_name) | 	Shape to be used in node pool members. | `any` | n/a | yes |
| <a name="node01_is_flex_shape"></a> [node01\_is\_flex\_shape](#input\_backendset01\_network\_subnet\_name) | Boolean that describes if the shape is flex or not. | `bool` | `false` | no |
| <a name="node01_nodepool_shape_config_ocpus"></a> [node01\_nodepool\_shape\_config\_ocpus](#input\_backendset01\_routing\_policy\_actions\_name) | (Updatable) The total number of OCPUs available to the nodepool. | `string` | `""` | no |
| <a name="node01_nodepool_shape_config_memory_in_gbs"></a> [node01\_nodepool\_shape\_config\_memory\_in_gbs](#input\_backendset01\_routing\_policy\_condition\_language\_version) | (Updatable) The total amount of memory available to the nodepool, in gigabytes. | `string` | `""` | no |
| <a name="node01_number_of_nodes"></a> [node01\_number\_of\_nodes](#input\_backendset01\_routing\_policy\_conditions) |Number of Nodes inside Node Pool | `any` | n/a | yes |
| <a name="node01_k8s_label_map"></a> [node01\_k8s\_label\_map](#input\_backendset01\_routing\_policy\_name) | Define the list of Kubernetes Labels to apply in nodepool. | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_oke01"></a> [oke01](#output\_oke01) | oke01 data |
| <a name="output_node01"></a> [node01](#output\_node01) | node01 data |

---

## Contributing
This project is open source.  Please submit your contributions by forking this repository and submitting a pull request!  Oracle appreciates any contributions that are made by the open source community.

## License
Copyright (c) 2021 Oracle and/or its affiliates.

Licensed under the Universal Permissive License (UPL), Version 1.0.

See [LICENSE](LICENSE) for more details.