# OCI Cloud Bricks: Sample Django instance with File Sotorage System and mySQL Database

[![License: UPL](https://img.shields.io/badge/license-UPL-green)](https://img.shields.io/badge/license-UPL-green) [![Quality gate](https://sonarcloud.io/api/project_badges/quality_gate?project=oracle-devrel_terraform-oci-cloudbricks-examples)](https://sonarcloud.io/dashboard?id=oracle-devrel_terraform-oci-cloudbricks-examples)

## Introduction
The following system builds a Sample linux compute with a File Storage System and a mySQL Database with the following reference architecture. Please note that a pre-set mount target is expected for this example to work. 

![ReferenceArchitecture](./images/Bricks_Architectures-1instance_fss_mySQL.jpg)

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
- The `key` variable, supports a structure of your choice, by providing `/`as separators. Name of the file should always be `system_name.tfstate`
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
  - [terraform-oci-cloudbricks-linux-compute](https://github.com/oracle-devrel/terraform-oci-cloudbricks-linux-compute/blob/main/README.md)
  - [terraform-oci-cloudbricks-linux-fss](https://github.com/oracle-devrel/terraform-oci-cloudbricks-linux-fss/blob/main/README.md)
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
  - [terraform-oci-cloudbricks-compartment](https://github.com/oracle-devrel/terraform-oci-cloudbricks-compartment/blob/main/README.md)


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
| <a name="provider_oci"></a> [oci](#provider\_oci) | 4.68.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_djangoconfig01"></a> [djangoconfig01](#module\_djangoconfig01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-remote-linux-executor.git | v1.0.0 |
| <a name="module_fssdisk01"></a> [fssdisk01](#module\_fssdisk01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-fss.git | v1.0.0 |
| <a name="module_instance01"></a> [instance01](#module\_instance01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-linux-compute.git | v1.0.2 |
| <a name="module_mysql01"></a> [mysql01](#module\_mysql01) | git::ssh://git@github.com/oracle-devrel/terraform-oci-cloudbricks-mysql-database | v1.0.4.1 |

## Resources

| Name | Type |
|------|------|
| [oci_identity_region_subscriptions.home_region_subscriptions](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_region_subscriptions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_djangoconfig01_script_args"></a> [djangoconfig01\_script\_args](#input\_djangoconfig01\_script\_args) | Arguments that are passed on to the script | `any` | `null` | no |
| <a name="input_djangoconfig01_script_name"></a> [djangoconfig01\_script\_name](#input\_djangoconfig01\_script\_name) | Name of .sh script | `string` | `"script.sh"` | no |
| <a name="input_djangoconfig01_ssh_private_is_path"></a> [djangoconfig01\_ssh\_private\_is\_path](#input\_djangoconfig01\_ssh\_private\_is\_path) | Describes if SSH Private Key is located on file or inside code | `bool` | `false` | no |
| <a name="input_djangoconfig01_ssh_private_key"></a> [djangoconfig01\_ssh\_private\_key](#input\_djangoconfig01\_ssh\_private\_key) | Private key to log into machine | `any` | n/a | yes |
| <a name="input_djangoconfig01_ssh_public_is_path"></a> [djangoconfig01\_ssh\_public\_is\_path](#input\_djangoconfig01\_ssh\_public\_is\_path) | Describes if SSH Public Key is located on file or inside code | `bool` | `false` | no |
| <a name="input_djangoconfig01_ssh_public_key"></a> [djangoconfig01\_ssh\_public\_key](#input\_djangoconfig01\_ssh\_public\_key) | Defines SSH Public Key to be used in order to remotely connect to compute instance | `string` | n/a | yes |
| <a name="input_fingerprint"></a> [fingerprint](#input\_fingerprint) | API Key Fingerprint for user\_ocid derived from public API Key imported in OCI User config | `any` | n/a | yes |
| <a name="input_fssdisk01_disk_unit"></a> [fssdisk01\_disk\_unit](#input\_fssdisk01\_disk\_unit) | Disk Unit Assigned to NFS Disk | `string` | `""` | no |
| <a name="input_fssdisk01_export_path_base"></a> [fssdisk01\_export\_path\_base](#input\_fssdisk01\_export\_path\_base) | Export path for File Storage Service | `any` | n/a | yes |
| <a name="input_fssdisk01_fss_display_name_base"></a> [fssdisk01\_fss\_display\_name\_base](#input\_fssdisk01\_fss\_display\_name\_base) | User friendly name for File Storage Service | `any` | n/a | yes |
| <a name="input_fssdisk01_fss_instance_compartment_id"></a> [fssdisk01\_fss\_instance\_compartment\_id](#input\_fssdisk01\_fss\_instance\_compartment\_id) | Defines the compartment OCID where the infrastructure will be created | `string` | `""` | no |
| <a name="input_fssdisk01_fss_instance_compartment_name"></a> [fssdisk01\_fss\_instance\_compartment\_name](#input\_fssdisk01\_fss\_instance\_compartment\_name) | Defines the compartment name where the infrastructure will be created | `string` | `""` | no |
| <a name="input_fssdisk01_fss_mount_target_availability_domain"></a> [fssdisk01\_fss\_mount\_target\_availability\_domain](#input\_fssdisk01\_fss\_mount\_target\_availability\_domain) | Availability domain where the mount target is located at | `any` | n/a | yes |
| <a name="input_fssdisk01_fss_mount_target_name"></a> [fssdisk01\_fss\_mount\_target\_name](#input\_fssdisk01\_fss\_mount\_target\_name) | User friendly name for Mount Target | `any` | n/a | yes |
| <a name="input_fssdisk01_fss_network_compartment_name"></a> [fssdisk01\_fss\_network\_compartment\_name](#input\_fssdisk01\_fss\_network\_compartment\_name) | Defines the compartment where the Network is currently located | `any` | n/a | yes |
| <a name="input_fssdisk01_is_winrm_configured_for_image"></a> [fssdisk01\_is\_winrm\_configured\_for\_image](#input\_fssdisk01\_is\_winrm\_configured\_for\_image) | Defines if winrm is being used in this installation | `bool` | `true` | no |
| <a name="input_fssdisk01_is_winrm_configured_with_ssl"></a> [fssdisk01\_is\_winrm\_configured\_with\_ssl](#input\_fssdisk01\_is\_winrm\_configured\_with\_ssl) | Use the https 5986 port for winrm by default. If that fails with a http response error: 401 - invalid content type, the SSL may not be configured correctly | `bool` | `true` | no |
| <a name="input_fssdisk01_label_zs"></a> [fssdisk01\_label\_zs](#input\_fssdisk01\_label\_zs) | n/a | `list(any)` | <pre>[<br>  "0",<br>  ""<br>]</pre> | no |
| <a name="input_fssdisk01_mt_compartment_id"></a> [fssdisk01\_mt\_compartment\_id](#input\_fssdisk01\_mt\_compartment\_id) | Mount Target Compartment Location OCID | `string` | `""` | no |
| <a name="input_fssdisk01_mt_compartment_name"></a> [fssdisk01\_mt\_compartment\_name](#input\_fssdisk01\_mt\_compartment\_name) | Mount Target Compartment Location | `string` | `""` | no |
| <a name="input_fssdisk01_network_subnet_name"></a> [fssdisk01\_network\_subnet\_name](#input\_fssdisk01\_network\_subnet\_name) | Name of the subnet where the artifact is located | `any` | n/a | yes |
| <a name="input_fssdisk01_num_of_fss"></a> [fssdisk01\_num\_of\_fss](#input\_fssdisk01\_num\_of\_fss) | Amount of FSS that will be created | `any` | n/a | yes |
| <a name="input_fssdisk01_os_type"></a> [fssdisk01\_os\_type](#input\_fssdisk01\_os\_type) | Describes the type of OS currently in place. Valid values are: linux, ubuntu, windows | `string` | n/a | yes |
| <a name="input_fssdisk01_ssh_private_is_path"></a> [fssdisk01\_ssh\_private\_is\_path](#input\_fssdisk01\_ssh\_private\_is\_path) | Determines if key is supposed to be on file or in text | `bool` | `true` | no |
| <a name="input_fssdisk01_ssh_private_key"></a> [fssdisk01\_ssh\_private\_key](#input\_fssdisk01\_ssh\_private\_key) | Determines what is the private key to connect to machine | `string` | `""` | no |
| <a name="input_fssdisk01_vcn_display_name"></a> [fssdisk01\_vcn\_display\_name](#input\_fssdisk01\_vcn\_display\_name) | Display Name associated to VCN | `any` | n/a | yes |
| <a name="input_fssdisk01_win_os_password"></a> [fssdisk01\_win\_os\_password](#input\_fssdisk01\_win\_os\_password) | Windows Server OS Password | `string` | `""` | no |
| <a name="input_instance01_assign_public_ip_flag"></a> [instance01\_assign\_public\_ip\_flag](#input\_instance01\_assign\_public\_ip\_flag) | Defines either machine will have or not a Public IP assigned. All Pvt networks this variable must be false | `bool` | `false` | no |
| <a name="input_instance01_bkp_policy_boot_volume"></a> [instance01\_bkp\_policy\_boot\_volume](#input\_instance01\_bkp\_policy\_boot\_volume) | Describes the backup policy attached to the boot volume | `string` | `"gold"` | no |
| <a name="input_instance01_compute_availability_domain_list"></a> [instance01\_compute\_availability\_domain\_list](#input\_instance01\_compute\_availability\_domain\_list) | Defines the availability domain list where OCI artifact will be created. This is a numeric value greater than 0 | `list(any)` | n/a | yes |
| <a name="input_instance01_compute_display_name_base"></a> [instance01\_compute\_display\_name\_base](#input\_instance01\_compute\_display\_name\_base) | Defines the compute and hostname Label for created compute | `any` | n/a | yes |
| <a name="input_instance01_compute_nsg_name"></a> [instance01\_compute\_nsg\_name](#input\_instance01\_compute\_nsg\_name) | Name of the NSG associated to the compute | `any` | n/a | yes |
| <a name="input_instance01_fault_domain_name"></a> [instance01\_fault\_domain\_name](#input\_instance01\_fault\_domain\_name) | Describes the fault domain to be used by machine | `list(any)` | <pre>[<br>  "FAULT-DOMAIN-1",<br>  "FAULT-DOMAIN-2",<br>  "FAULT-DOMAIN-3"<br>]</pre> | no |
| <a name="input_instance01_instance_image_ocid"></a> [instance01\_instance\_image\_ocid](#input\_instance01\_instance\_image\_ocid) | Defines the OCID for the OS image to be used on artifact creation. Extract OCID from: https://docs.cloud.oracle.com/iaas/images/ or designated custom image OCID created by packer | `any` | n/a | yes |
| <a name="input_instance01_instance_shape"></a> [instance01\_instance\_shape](#input\_instance01\_instance\_shape) | Defines the shape to be used on compute creation | `any` | n/a | yes |
| <a name="input_instance01_instance_shape_config_memory_in_gbs"></a> [instance01\_instance\_shape\_config\_memory\_in\_gbs](#input\_instance01\_instance\_shape\_config\_memory\_in\_gbs) | (Updatable) The total amount of memory available to the instance, in gigabytes. | `string` | `""` | no |
| <a name="input_instance01_instance_shape_config_ocpus"></a> [instance01\_instance\_shape\_config\_ocpus](#input\_instance01\_instance\_shape\_config\_ocpus) | (Updatable) The total number of OCPUs available to the instance. | `string` | `""` | no |
| <a name="input_instance01_is_flex_shape"></a> [instance01\_is\_flex\_shape](#input\_instance01\_is\_flex\_shape) | Boolean that describes if the shape is flex or not | `bool` | `false` | no |
| <a name="input_instance01_is_nsg_required"></a> [instance01\_is\_nsg\_required](#input\_instance01\_is\_nsg\_required) | Boolean that describes if an NSG is associated to the machine | `bool` | `false` | no |
| <a name="input_instance01_label_zs"></a> [instance01\_label\_zs](#input\_instance01\_label\_zs) | Auxiliary variable to concatenate with compute number | `list(any)` | <pre>[<br>  "0",<br>  ""<br>]</pre> | no |
| <a name="input_instance01_linux_compute_instance_compartment_name"></a> [instance01\_linux\_compute\_instance\_compartment\_name](#input\_instance01\_linux\_compute\_instance\_compartment\_name) | Defines the compartment name where the infrastructure will be created | `any` | n/a | yes |
| <a name="input_instance01_linux_compute_network_compartment_name"></a> [instance01\_linux\_compute\_network\_compartment\_name](#input\_instance01\_linux\_compute\_network\_compartment\_name) | Defines the compartment where the Network is currently located | `any` | n/a | yes |
| <a name="input_instance01_network_subnet_name"></a> [instance01\_network\_subnet\_name](#input\_instance01\_network\_subnet\_name) | Defines the subnet display name where this resource will be created at | `any` | n/a | yes |
| <a name="input_instance01_num_instances"></a> [instance01\_num\_instances](#input\_instance01\_num\_instances) | Amount of instances to create | `number` | `0` | no |
| <a name="input_instance01_primary_vnic_display_name"></a> [instance01\_primary\_vnic\_display\_name](#input\_instance01\_primary\_vnic\_display\_name) | Defines the Primary VNIC Display Name | `string` | `"primaryvnic"` | no |
| <a name="input_instance01_private_ip"></a> [instance01\_private\_ip](#input\_instance01\_private\_ip) | Describes the private IP required for machine | `any` | `null` | no |
| <a name="input_instance01_ssh_private_is_path"></a> [instance01\_ssh\_private\_is\_path](#input\_instance01\_ssh\_private\_is\_path) | Describes if SSH Private Key is located on file or inside code | `bool` | `false` | no |
| <a name="input_instance01_ssh_private_key"></a> [instance01\_ssh\_private\_key](#input\_instance01\_ssh\_private\_key) | Private key to log into machine | `any` | n/a | yes |
| <a name="input_instance01_ssh_public_is_path"></a> [instance01\_ssh\_public\_is\_path](#input\_instance01\_ssh\_public\_is\_path) | Describes if SSH Public Key is located on file or inside code | `bool` | `false` | no |
| <a name="input_instance01_ssh_public_key"></a> [instance01\_ssh\_public\_key](#input\_instance01\_ssh\_public\_key) | Defines SSH Public Key to be used in order to remotely connect to compute instance | `string` | n/a | yes |
| <a name="input_instance01_vcn_display_name"></a> [instance01\_vcn\_display\_name](#input\_instance01\_vcn\_display\_name) | VCN Display name to execute lookup | `any` | n/a | yes |
| <a name="input_mysql01_mysql_db_system_admin_password"></a> [mysql01\_mysql\_db\_system\_admin\_password](#input\_mysql01\_mysql\_db\_system\_admin\_password) | (Required) The password for the administrative user. The password must be between 8 and 32 characters long, and must contain at least 1 numeric character, 1 lowercase character, 1 uppercase character, and 1 special (nonalphanumeric) character. | `any` | n/a | yes |
| <a name="input_mysql01_mysql_db_system_admin_username"></a> [mysql01\_mysql\_db\_system\_admin\_username](#input\_mysql01\_mysql\_db\_system\_admin\_username) | (Required) The username for the administrative user. | `any` | n/a | yes |
| <a name="input_mysql01_mysql_db_system_availability_domain"></a> [mysql01\_mysql\_db\_system\_availability\_domain](#input\_mysql01\_mysql\_db\_system\_availability\_domain) | (Required) The availability domain on which to deploy the Read/Write endpoint. This defines the preferred primary instance. In a failover scenario, the Read/Write endpoint is redirected to one of the other availability domains and the MySQL instance in that domain is promoted to the primary instance. This redirection does not affect the IP address of the DB System in any way. For a standalone DB System, this defines the availability domain in which the DB System is placed. | `any` | n/a | yes |
| <a name="input_mysql01_mysql_db_system_backup_policy_is_enabled"></a> [mysql01\_mysql\_db\_system\_backup\_policy\_is\_enabled](#input\_mysql01\_mysql\_db\_system\_backup\_policy\_is\_enabled) | Boolean that defines if either backup is enabled or not | `bool` | `false` | no |
| <a name="input_mysql01_mysql_db_system_backup_policy_retention_in_days"></a> [mysql01\_mysql\_db\_system\_backup\_policy\_retention\_in\_days](#input\_mysql01\_mysql\_db\_system\_backup\_policy\_retention\_in\_days) | The number of days automated backups are retained. | `string` | `""` | no |
| <a name="input_mysql01_mysql_db_system_backup_policy_window_start_time"></a> [mysql01\_mysql\_db\_system\_backup\_policy\_window\_start\_time](#input\_mysql01\_mysql\_db\_system\_backup\_policy\_window\_start\_time) | The start of a 30-minute window of time in which daily, automated backups occur. This should be in the format of the Time portion of an RFC3339-formatted timestamp. Any second or sub-second time data will be truncated to zero. At some point in the window, the system may incur a brief service disruption as the backup is performed. | `string` | `""` | no |
| <a name="input_mysql01_mysql_db_system_data_storage_size_in_gb"></a> [mysql01\_mysql\_db\_system\_data\_storage\_size\_in\_gb](#input\_mysql01\_mysql\_db\_system\_data\_storage\_size\_in\_gb) | Initial size of the data volume in GiBs that will be created and attached. | `any` | n/a | yes |
| <a name="input_mysql01_mysql_db_system_defined_tags"></a> [mysql01\_mysql\_db\_system\_defined\_tags](#input\_mysql01\_mysql\_db\_system\_defined\_tags) | Defined tags for this resource. Each key is predefined and scoped to a namespace. | `map` | `{}` | no |
| <a name="input_mysql01_mysql_db_system_description"></a> [mysql01\_mysql\_db\_system\_description](#input\_mysql01\_mysql\_db\_system\_description) | User-provided data about the DB System. | `any` | n/a | yes |
| <a name="input_mysql01_mysql_db_system_display_name"></a> [mysql01\_mysql\_db\_system\_display\_name](#input\_mysql01\_mysql\_db\_system\_display\_name) | The user-friendly name for the DB System. It does not have to be unique. | `any` | n/a | yes |
| <a name="input_mysql01_mysql_db_system_fault_domain"></a> [mysql01\_mysql\_db\_system\_fault\_domain](#input\_mysql01\_mysql\_db\_system\_fault\_domain) | The fault domain on which to deploy the Read/Write endpoint. This defines the preferred primary instance. | `any` | n/a | yes |
| <a name="input_mysql01_mysql_db_system_freeform_tags"></a> [mysql01\_mysql\_db\_system\_freeform\_tags](#input\_mysql01\_mysql\_db\_system\_freeform\_tags) | Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace. | `map` | `{}` | no |
| <a name="input_mysql01_mysql_db_system_hostname_label"></a> [mysql01\_mysql\_db\_system\_hostname\_label](#input\_mysql01\_mysql\_db\_system\_hostname\_label) | The hostname for the primary endpoint of the DB System. Used for DNS. The value is the hostname portion of the primary private IP's fully qualified domain name (FQDN) (for example, dbsystem-1 in FQDN dbsystem-1.subnet123.vcn1.oraclevcn.com). Must be unique across all VNICs in the subnet and comply with RFC 952 and RFC 1123. | `any` | n/a | yes |
| <a name="input_mysql01_mysql_db_system_is_highly_available"></a> [mysql01\_mysql\_db\_system\_is\_highly\_available](#input\_mysql01\_mysql\_db\_system\_is\_highly\_available) | Boolean that describes if either HA is enabled or not | `bool` | `false` | no |
| <a name="input_mysql01_mysql_db_system_maintenance_window_start_time"></a> [mysql01\_mysql\_db\_system\_maintenance\_window\_start\_time](#input\_mysql01\_mysql\_db\_system\_maintenance\_window\_start\_time) | (Required) (Updatable) The start of the 2 hour maintenance window. This string is of the format: {day-of-week} {time-of-day}. {day-of-week} is a case-insensitive string like mon, tue, etc. {time-of-day} is the Time portion of an RFC3339-formatted timestamp. Any second or sub-second time data will be truncated to zero. | `any` | n/a | yes |
| <a name="input_mysql01_mysql_db_system_port"></a> [mysql01\_mysql\_db\_system\_port](#input\_mysql01\_mysql\_db\_system\_port) | (Optional) The port for primary endpoint of the DB System to listen on. | `string` | `"3306"` | no |
| <a name="input_mysql01_mysql_db_system_port_x"></a> [mysql01\_mysql\_db\_system\_port\_x](#input\_mysql01\_mysql\_db\_system\_port\_x) | (Optional) The TCP network port on which X Plugin listens for connections. This is the X Plugin equivalent of port. | `string` | `"33060"` | no |
| <a name="input_mysql01_mysql_heatwave_cluster_size"></a> [mysql01\_mysql\_heatwave\_cluster\_size](#input\_mysql01\_mysql\_heatwave\_cluster\_size) | Number of MySQL HeatWave nodes to be created | `number` | `2` | no |
| <a name="input_mysql01_mysql_heatwave_enabled"></a> [mysql01\_mysql\_heatwave\_enabled](#input\_mysql01\_mysql\_heatwave\_enabled) | Defines whether a MySQL HeatWave cluster is enabled | `bool` | `false` | no |
| <a name="input_mysql01_mysql_heatwave_shape"></a> [mysql01\_mysql\_heatwave\_shape](#input\_mysql01\_mysql\_heatwave\_shape) | The shape to be used instead of mysql01\_mysql\_shape\_name when mysql01\_mysql\_heatwave\_enabled = true. | `string` | `"MySQL.HeatWave.VM.Standard.E3"` | no |
| <a name="input_mysql01_mysql_instance_compartment_name"></a> [mysql01\_mysql\_instance\_compartment\_name](#input\_mysql01\_mysql\_instance\_compartment\_name) | Compartment where MySQL Instance will be created | `string` | `""` | no |
| <a name="input_mysql01_mysql_instance_compartment_ocid"></a> [mysql01\_mysql\_instance\_compartment\_ocid](#input\_mysql01\_mysql\_instance\_compartment\_ocid) | OCID of the compartment where MySQL Instance will be created. Use alternatively to mysql01\_mysql\_instance\_compartment\_name | `string` | `""` | no |
| <a name="input_mysql01_mysql_network_compartment_name"></a> [mysql01\_mysql\_network\_compartment\_name](#input\_mysql01\_mysql\_network\_compartment\_name) | Compartment where the network of MySQL artifact is | `string` | `""` | no |
| <a name="input_mysql01_mysql_network_compartment_ocid"></a> [mysql01\_mysql\_network\_compartment\_ocid](#input\_mysql01\_mysql\_network\_compartment\_ocid) | OCID of the compartment where the network of MySQL artifact is. Use alternatively to mysql01\_mysql\_network\_compartment\_name | `string` | `""` | no |
| <a name="input_mysql01_mysql_shape_name"></a> [mysql01\_mysql\_shape\_name](#input\_mysql01\_mysql\_shape\_name) | (Required) The name of the shape. The shape determines the resources allocated. CPU cores and memory for VM shapes; CPU cores, memory and storage for non-VM (or bare metal) shapes. To get a list of shapes, use the ListShapes operation. | `string` | `"MySQL.VM.Standard.E3.1.8GB"` | no |
| <a name="input_mysql01_network_subnet_name"></a> [mysql01\_network\_subnet\_name](#input\_mysql01\_network\_subnet\_name) | Defines the subnet display name where this resource will be created at | `string` | `""` | no |
| <a name="input_mysql01_subnet_id"></a> [mysql01\_subnet\_id](#input\_mysql01\_subnet\_id) | Subnet OCID. Use alternatively to network\_subnet\_name | `string` | `""` | no |
| <a name="input_mysql01_vcn_display_name"></a> [mysql01\_vcn\_display\_name](#input\_mysql01\_vcn\_display\_name) | VCN Display name to execute lookup | `string` | `""` | no |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | Private Key Absolute path location where terraform is executed | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Target region where artifacts are going to be created | `any` | n/a | yes |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | OCID of tenancy | `any` | n/a | yes |
| <a name="input_user_ocid"></a> [user\_ocid](#input\_user\_ocid) | User OCID in tenancy. Currently hardcoded to user denny.alquinta@oracle.com | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fssdisk01"></a> [fssdisk01](#output\_fssdisk01) | File Storage System |
| <a name="output_instance01"></a> [instance01](#output\_instance01) | Compute Instances |
| <a name="output_mysql"></a> [mysql](#output\_mysql) | Instance of MySQL database |
---

## Known issues

### Problems with API on creating several FSS at the same time

```shell

Error: 409-Conflict 
│ Provider version: 4.42.0, released on 2021-09-01.  
│ Service: File Storage System 
│ Error Message: Another filesystem is currently being provisioned, try again later 
│ OPC request ID: 1d398d3d1bdb39ebce7ab9c00ec074ff/62490F339342C2592DC8F82BB81BF543/B2690CE55D3ADB426B94A73C074F4408 
│ Suggestion: The resource is in a conflicted state. Please retry again or contact support for help with service: File Storage System
│ 
│ 
│   with module.fssdisk01[1].oci_file_storage_file_system.FileStorage[1],
│   on .terraform/modules/fssdisk01/fss.tf line 2, in resource "oci_file_storage_file_system" "FileStorage":
│    2: resource "oci_file_storage_file_system" "FileStorage" {
│ 
```

## Contributing
This project is open source.  Please submit your contributions by forking this repository and submitting a pull request!  Oracle appreciates any contributions that are made by the open source community.

## License
Copyright (c) 2021 Oracle and/or its affiliates.

Licensed under the Universal Permissive License (UPL), Version 1.0.

See [LICENSE](LICENSE) for more details.