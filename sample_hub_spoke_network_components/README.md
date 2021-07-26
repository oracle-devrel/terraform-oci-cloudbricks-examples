# suraocife/demoenv01

The following [README.md](README.md) file describes the project related to provision end-to-end ***WebLogic Server 12.2.1.4*** Domains within Oracle Cloud Infrastructure. This provisions the infrastructure and later triggers the ansible playbooks related to Domain Configuration. 

------

## Structure

The following is the structure of the project: 

| Item                           | Description                                                  |
| ------------------------------ | ------------------------------------------------------------ |
| [lbaas_certs](lbaas_certs)     | Certificates related to Public Load Balancer. This includes 3 files: `ca_certifcate.crt`: crt file that contains the Certificate Authority Cert. `private_key.pem`: Private Key related to public cert. `public_cert.crt`: Public Certificate. |
| [ssh_keys](ssh_keys)           | SSH Keys associated to compute instances. This includes 2 files: `surapoc_ssh_id_rsa`: Private SSH Key. `surapoc_ssh_id_rsa.pub`: Public SSH Key |
| [backend.tf](backend.tf)       | *Terraform* configuration file that contains the coordinates to store `.tfstate` file inside a particular bucket, using the *AWS S3 Compatibility API*. See [file structure and contents](##File Structure and Contents) section for more details. |
| [main.tf](main.tf)             | Main *Terraform* orchestration file. This contains the entire definition of the modules used in the provisioning process of the system. See [file structure and contents](##File Structure and Contents) section for more details. |
| [output.tf](output.tf)         | Output *Terraform* configuration file, which content feeds the *Terraform / Ansible* Integration. **This file must not be touched**. See [file structure and contents](##File Structure and Contents) section for more details. |
| [provider.tf](provider.tf)     | Includes the default provider variables to connect to *Oracle Cloud Infrastructure*. These values are for this case, defined in the project variables. See [file structure and contents](##File Structure and Contents) section for more details. |
| [README.md](README.md)         | This File                                                    |
| [system.tfvars](system.tfvars) | *Terraform* variable file that contains all the variable provisioning for this system. See [file structure and contents](##File Structure and Contents) section for more details. |
| [variables.tf](variables.tf)   | *Terraform* configuration file that contains all the variable declarations for this system. This file will include as many variables are used inside [main.tf](main.tf) file. See [file structure and contents](##File Structure and Contents) section for more details. |

------

## File Structure and Contents



## backend.tf

This file contains the definition that allows OCI via the *AWS S3 Compatibility API* to interact with a bucket and remotely store the system's [tfstate](https://www.terraform.io/docs/state/index.html) file. You may access the sample `backend.tf` file [here](backend.tf) and the following is the generic content of it:

```go
/* backend.tf
Author: DALQUINT - denny.alquinta@oracle.com
Purpose: Handles the storage of tfstate file in backend bucket
Copyright (c) 2017, 2021, Oracle and/or its affiliates. All rights reserved. */

terraform {
  backend "s3" {
    bucket   = "NAME_OF_THE_BUCKET"
    key      = "STRUCTURE/FOR/BUCKET/DIRECTORY/SYSTEM.tfstate"
    region   = "REGION"
    endpoint = "https://TENANCY_NAMESPACE_NAME.compat.objectstorage.REGION.oraclecloud.com"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}
```

For this case, the file content is: 

| Property | Value                                                        | Comments                                                     |
| -------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| bucket   | tfstate_bucket                                               | This may be any bucket of your choice. When creating bucket, make sure versioning is enabled and that the bucket is private |
| key      | Environments/WLS/demoenv01.tfstate                           | This may be any structure. When concatenating a path, this will generate an inner structure inside bucket for ease of navigation. This files must never be erased unless there is an inconsistency between the code and the system status. This **name must be unique** per each system is created. This file is the corner stone of Terraform Infrastructure Status, so **must not be tampered.** To neglect this step, will compromise the infrastructure unicity and status, hence will potentially risk to corrupt the infrastructure. |
| region   | us-ashburn-1                                                 | This value will depend on which region the tenancy is currently subscribed and where the infrastructure is being created |
| endpoint | https://id82vjamxpqo.compat.objectstorage.us-ashburn-1.oraclecloud.com | This is the concatenation of the tenancy namespace which can be found under Administration > Tenancy Details and the region where the tenancy is subscribed and infrastructure is being created. |



## main.tf

The following file is the main module orchestrator of the system. This will pull all the required backend modules stored on corresponding *OCIBE* projects and will pull them into `.terraform` local directory for usage. You may access the sample main.tf file [here](main.tf) and the following is the generic content of it:



```go
/* main.tf
Author: Denny Alquinta – denny.alquinta@oracle.com 
Purpose: Defines all the components related to environment
Copyright (c) 2017, 2020, Oracle and/or its affiliates. All rights reserved. */

module "admin_compute" {
  source = "git::YOUR_REPOSITORY_SSH_OR_HTTPS_URI/suracompute.git?ref=RELEASE_TAG"
  ######################################## COMMON VARIABLES ######################################
  region                      = var.region
  private_key_path            = var.private_key_path
  public_network_subnet_name  = var.public_network_subnet_name
  private_network_subnet_name = var.private_network_subnet_name
  ######################################## COMMON VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  ssh_public_key                          = var.admin_ssh_public_key
  ssh_private_key                         = var.admin_ssh_private_key
  ssh_public_is_path                      = var.admin_ssh_public_is_path
  ssh_private_is_path                     = var.admin_ssh_private_is_path
  compute_availability_domain_list        = var.admin_compute_availability_domain_list
  fault_domain_name                       = var.admin_fault_domain_name
  bkp_policy_boot_volume                  = var.admin_bkp_policy_boot_volume
  linux_compute_instance_compartment_name = var.admin_linux_compute_instance_compartment_name
  linux_compute_network_compartment_name  = var.admin_linux_compute_network_compartment_name
  vcn_display_name                        = var.admin_vcn_display_name
  num_instances                           = var.admin_num_instances
  compute_display_name_base               = var.admin_compute_display_name_base
  instance_image_ocid                     = var.admin_instance_image_ocid
  instance_shape                          = var.admin_instance_shape
  is_compute_private                      = var.admin_is_compute_private
}

module "managed_compute_cluster" {
  source = "git::YOUR_REPOSITORY_SSH_OR_HTTPS_URI/suracompute.git?ref=RELEASE_TAG"
  ######################################## COMMON VARIABLES ######################################
  region                      = var.region
  private_key_path            = var.private_key_path
  public_network_subnet_name  = var.public_network_subnet_name
  private_network_subnet_name = var.private_network_subnet_name
  ######################################## COMMON VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  ssh_public_key                          = var.managed_ssh_public_key
  ssh_private_key                         = var.managed_ssh_private_key
  ssh_public_is_path                      = var.managed_ssh_public_is_path
  ssh_private_is_path                     = var.managed_ssh_private_is_path
  compute_availability_domain_list        = var.managed_compute_availability_domain_list
  fault_domain_name                       = var.managed_fault_domain_name
  bkp_policy_boot_volume                  = var.managed_bkp_policy_boot_volume
  linux_compute_instance_compartment_name = var.managed_linux_compute_instance_compartment_name
  linux_compute_network_compartment_name  = var.managed_linux_compute_network_compartment_name
  vcn_display_name                        = var.managed_vcn_display_name
  num_instances                           = var.managed_num_instances
  compute_display_name_base               = var.managed_compute_display_name_base
  instance_image_ocid                     = var.managed_instance_image_ocid
  instance_shape                          = var.managed_instance_shape
  is_compute_private                      = var.managed_is_compute_private
}

module "nfs" {
  source                         = "git::YOUR_REPOSITORY_SSH_OR_HTTPS_URI/surafss.git?ref=RELEASE_TAG"
  ######################################## COMMON VARIABLES ######################################
  region                      = var.region
  private_key_path            = var.private_key_path
  public_network_subnet_name  = var.public_network_subnet_name
  private_network_subnet_name = var.private_network_subnet_name
  ######################################## COMMON VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################  
  ssh_public_key                 = var.nfs_ssh_public_key
  ssh_private_key                = var.nfs_ssh_private_key
  ssh_public_is_path             = var.nfs_ssh_public_is_path
  ssh_private_is_path            = var.nfs_ssh_private_is_path
  vcn_display_name               = var.nfs_vcn_display_name
  fss_availability_domain_number = var.nfs_fss_availability_domain_number
  mt_availability_domain_number  = var.nfs_mt_availability_domain_number
  num_of_fss                     = var.nfs_num_of_fss
  mt_compartment_name            = var.nfs_mt_compartment_name
  export_path_base               = var.nfs_export_path_base
  fss_display_name_base          = var.nfs_fss_display_name_base
  fss_instance_compartment_name  = var.nfs_fss_instance_compartment_name
  fss_network_compartment_name   = var.nfs_fss_network_compartment_name
  mount_target_name              = var.nfs_mount_target_name
}

module "loadbalancer" {
  source = "git::YOUR_REPOSITORY_SSH_OR_HTTPS_URI/suralbaas.git?ref=RELEASE_TAG"
  ######################################## COMMON VARIABLES ######################################
  region                      = var.region
  private_key_path            = var.private_key_path
  public_network_subnet_name  = var.public_network_subnet_name
  private_network_subnet_name = var.private_network_subnet_name
  ######################################## COMMON VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  ssh_public_key                  = var.loadbalancer_ssh_public_key
  ssh_private_key                 = var.loadbalancer_ssh_private_key
  ssh_public_is_path              = var.loadbalancer_ssh_public_is_path
  ssh_private_is_path             = var.loadbalancer_ssh_private_is_path
  lbaas_instance_compartment_name = var.loadbalancer_lbaas_instance_compartment_name
  lbaas_network_compartment_name  = var.loadbalancer_lbaas_network_compartment_name
  vcn_display_name                = var.loadbalancer_vcn_display_name
  lbaas_display_name              = var.loadbalancer_lbaas_display_name
  lbaas_shape_min_bw_mbps         = var.loadbalancer_lbaas_shape_min_bw_mbps
  lbaas_shape_max_bw_mbps         = var.loadbalancer_lbaas_shape_max_bw_mbps
  is_private                      = var.loadbalancer_is_private
  nsg_name                        = var.loadbalancer_nsg_name
}

module "backendset" {
  source = "git::YOUR_REPOSITORY_SSH_OR_HTTPS_URI/suralbaasbes.git?ref=RELEASE_TAG"
  ######################################## COMMON VARIABLES ######################################
  region                      = var.region
  private_key_path            = var.private_key_path
  public_network_subnet_name  = var.public_network_subnet_name
  private_network_subnet_name = var.private_network_subnet_name
  ######################################## COMMON VARIABLES ######################################
  ######################################## ARTIFACT SPECIFIC VARIABLES ######################################
  ssh_public_key                      = var.backendset_ssh_public_key
  ssh_private_key                     = var.backendset_ssh_private_key
  ssh_public_is_path                  = var.backendset_ssh_public_is_path
  ssh_private_is_path                 = var.backendset_ssh_private_is_path
  balanced_artifact                   = module.managed_compute_cluster.instance
  load_balancer_id                    = module.loadbalancer.lbaas_instance.id
  vcn_display_name                    = var.backendset_vcn_display_name
  balancing_protocol                  = var.backendset_balancing_protocol
  lbaas_backend_set_name              = var.backendset_lbaas_backend_set_name
  lbaas_bes_check_protocol            = var.backendset_lbaas_bes_check_protocol
  lbaas_bes_checkport                 = var.backendset_lbaas_bes_checkport
  lbaas_path_to_routeset_name         = var.backendset_lbaas_path_to_routeset_name
  lbaas_bes_instance_compartment_name = var.backendset_lbaas_bes_instance_compartment_name
  lbaas_bes_network_compartment_name  = var.backendset_lbaas_bes_network_compartment_name
  lbaas_bes_listen_port               = var.backendset_lbaas_bes_listen_port
  lbaas_bes_listen_protocol           = var.backendset_lbaas_bes_listen_protocol
  backend_default_balancing_port      = var.backendset_backend_default_balancing_port
  ms_per_machine                      = var.ms_per_machine
  lbaas_cert_is_path                  = var.backendset_lbaas_cert_is_path
  lbaas_pvt_key_is_path               = var.backendset_lbaas_pvt_key_is_path
  lbaas_pub_cert_is_path              = var.backendset_lbaas_pub_cert_is_path
  lbaas_ca_cert                       = var.backendset_lbaas_ca_cert
  certificate_passphrase              = var.backendset_certificate_passphrase
  certificate_private_key             = var.backendset_certificate_private_key
  lbaas_public_cert                   = var.backendset_lbaas_public_cert
  certificate_name                    = var.backendset_certificate_name
  verify_peer_certificate             = var.backend_verify_peer_certificate
}
```



This system is composed by 5 backend modules which are explained below: 

| Module                  | Comments                                                     |
| ----------------------- | ------------------------------------------------------------ |
| admin_compute           | Uses `suracompute` backend module to generate the required computes to host the AdminServer of Domain. This typically is 1 |
| managed_compute_cluster | Uses `suracompute` backend module to generate the required computes to host the managed servers of domain. This may vary from any value starting in 0. |
| nfs                     | Uses `surafss` backend module to generate the required NFS v3 Filesystems required by the domain. |
| loadbalancer            | Uses `suralbaas` backend module to generate the LBaaS Service which front ends the cluster |
| backendset              | Uses `suralbaasbes` backend module to generate the backend set associated to the computes previously created and then attaches this to the corresponding LBaaS. |

> **IMPORTANT:** The sample file is completely linked to https://github.com private repositories of denny.alquinta@oracle.com ownership. All files must be properly updated to poll code from internal repositories. This repos as are private will not grant public access to anyone and where use exclusively as a PoC. 

## output.tf

This file contains the outputs required by the Terraform/Ansible integration to work properly. The values on each output entry are the ones that are later executed by get_hosts_vars.sh script to produce the output json files inside json_stage directory that later on are parsed and processed by get_hosts_vars.py to write the ansible_hosts and playbook.yaml files. You may access to the content of it [here](output.tf). 



## provider.tf

This file contains the provider configuration, needed to connect to OCI. The values associated in this project are hardcoded to user denny.alquinta@oracle.com and should be properly updated to a service user. 



## system.tfvars

Along with [main.tf](main.tf) this is the second main pivotal file for system creation. This file contains the exact value of each variable referenced in [main.tf](main.tf). You may access the content of it [here](system.tfvars). The following is an explanation of each value:

**Variables for module: General Domain configuration

| Property         | Value                                                        |
| ---------------- | ------------------------------------------------------------ |
| wls_domain_name  | Name that gets passed to ansible to configure the domain. This value represents the domain name across the entire domain configuration. This can be any string value |
| wls_cluster_name | Name that gets passed to ansible as WLS Cluster Name. Each domain only supports a single cluster. This can be any string value |
| ms_per_machine   | Number that represents the amount of managed servers that will be created per each compute that belongs to the cluster. If this value is set to 2, it means that each compute that composes the cluster will host 2 managed servers. This value must be calculated in function of the amount of memory available for the compute shape chosen. Consider that each managed server currently is configured with 4GB of Heapsize, applying best practices on Garbage Collection Management |



**Variables for module: admin_compute** 

| Property                                      | Value                                                        |
| --------------------------------------------- | ------------------------------------------------------------ |
| admin_ssh_public_key                          | This is the full path of the SSH Public Key associated to the hosts. This file was created in API Key Management and AWS S3 Compatibility API Integration section in the following [README.md](../README.md) file. Refer to it for details on it's location |
| admin_ssh_private_key                         | This is the full path of the SSH Private Key associated to the hosts. This file was created in API Key Management and AWS S3 Compatibility API Integration section in the following [README.md](../README.md) file. Refer to it for details on it's location |
| admin_ssh_public_is_path                      | Determines if the SSH Public Key is stored on a file or in a variable. This value should **always** be **set** to **true** |
| admin_ssh_private_is_path                     | Determines if the SSH Private Key is stored on a file or in a variable. This value should **always** be **set** to **true** |
| admin_compute_availability_domain_list        | A collection list of Availability Domain Names, where the computes will be stored at. If tenancy region only contains a single Availability Domain, this collection list should include a single value. Pairing in Fault Domains is automatically done by the provider |
| admin_fault_domain_name                       | Value that contains an overload value in case you want to assign the AdminServer Compute to a specific Fault Domain. By default **should be left** **blank**. |
| admin_bkp_policy_boot_volume                  | Backup policy associated to the Admin Server compute boot volume. This may be bronze, silver or gold or any custom policy value associated to the compute. |
| admin_linux_compute_instance_compartment_name | Name of the compartment where Admin Compute artifact should be created |
| admin_linux_compute_network_compartment_name  | Name of the compartment where the Network definition for Admin Compute artifact is located at |
| admin_vcn_display_name                        | Name of the VCN where the Admin Compute artifact should be created |
| admin_num_instances                           | Amount of compute instances related to the Admin Server. This value should **always** be **set** to **1** |
| admin_compute_display_name_base               | Base name from where the Admin Server name will start to iterate. Expected behavior is BASENAMEXX where XX varies from 01 to n |
| admin_instance_image_ocid                     | OCID related to the golden image prebaked with WLS installation with corresponding patches. Current Image holds an [OFA](https://docs.oracle.com/en/database/oracle/oracle-database/12.2/ssdbi/optimal-flexible-architecture-file-path-examples.html#GUID-BB3EE4F7-50F4-4A2D-8A0D-96B7CC44029B) installation with latest PSU available (WLS PSU 201001) |
| admin_instance_shape                          | Shape selected for Admin Server Compute. For details on shapes refer to the following [link](https://docs.oracle.com/en-us/iaas/Content/Compute/References/computeshapes.htm). |
| admin_is_compute_private                      | Flag that determines if the compute should be created in a public or private subnet. If value is set to true, this will be created in whatever subnet is selected as private_network_subnet_name in [commons.tfvars](../commons.tfvars) file. If value is set to false, then it'll be created in whatever subnet is selected as public_network_subnet_name in [commons.tfvars](../commons.tfvars) file. |



**Variables for module: managed_compute_cluster** 

| Property                                        | Value                                                        |
| ----------------------------------------------- | ------------------------------------------------------------ |
| managed_ssh_public_key                          | This is the full path of the SSH Public Key associated to the hosts. This file was created in API Key Management and AWS S3 Compatibility API Integration section in the following [README.md](../README.md) file. Refer to it for details on it's location |
| managed_ssh_private_key                         | This is the full path of the SSH Private Key associated to the hosts. This file was created in API Key Management and AWS S3 Compatibility API Integration section in the following [README.md](../README.md) file. Refer to it for details on it's location |
| managed_ssh_public_is_path                      | Determines if the SSH Public Key is stored on a file or in a variable. This value should **always** be **set** to **true** |
| managed_ssh_private_is_path                     | Determines if the SSH Private Key is stored on a file or in a variable. This value should **always** be **set** to **true** |
| managed_compute_availability_domain_list        | A collection list of Availability Domain Names, where the computes will be stored at. If tenancy region only contains a single Availability Domain, this collection list should include a single value. Pairing in Fault Domains is automatically done by the provider |
| managed_fault_domain_name                       | Value that contains an overload value in case you want to assign the AdminServer Compute to a specific Fault Domain. By default **should be left** **blank**. |
| managed_bkp_policy_boot_volume                  | Backup policy associated to the Managed Server compute boot volume. This may be bronze, silver or gold or any custom policy value associated to the compute. |
| managed_linux_compute_instance_compartment_name | Name of the compartment where ManagedCompute artifact should be created |
| managed_linux_compute_network_compartment_name  | Name of the compartment where the Network definition for Managed Compute artifact are located at |
| managed_vcn_display_name                        | Name of the VCN where the Managed Compute artifact should be created |
| managed_num_instances                           | Amount of compute instances related to the Managed Server. This value should **always** be **set** to a value greater to **1** |
| managed_compute_display_name_base               | Base name from where the Managed Server name will start to iterate. Expected behavior is BASENAMEXX where XX varies from 01 to n |
| managed_instance_image_ocid                     | OCID related to the golden image prebaked with WLS installation with corresponding patches. Current Image holds an [OFA](https://docs.oracle.com/en/database/oracle/oracle-database/12.2/ssdbi/optimal-flexible-architecture-file-path-examples.html#GUID-BB3EE4F7-50F4-4A2D-8A0D-96B7CC44029B) installation with latest PSU available (WLS PSU 201001) |
| managed_instance_shape                          | Shape selected for Managed Server Compute. For details on shapes refer to the following [link](https://docs.oracle.com/en-us/iaas/Content/Compute/References/computeshapes.htm). |
| managed_is_compute_private                      | Flag that determines if the compute should be created in a public or private subnet. If value is set to true, this will be created in whatever subnet is selected as private_network_subnet_name in [commons.tfvars](../commons.tfvars) file. If value is set to false, then it'll be created in whatever subnet is selected as public_network_subnet_name in [commons.tfvars](../commons.tfvars) file. |



**Variables for module: nfs**

| Property                    | Value                                                        |
| --------------------------- | ------------------------------------------------------------ |
| nfs_ssh_public_key      | This is the full path of the SSH Public Key associated to the hosts. This file was created in API Key Management and AWS S3 Compatibility API Integration section in the following [README.md](../README.md) file. Refer to it for details on it's location |
| nfs_ssh_private_key     | This is the full path of the SSH Private Key associated to the hosts. This file was created in API Key Management and AWS S3 Compatibility API Integration section in the following [README.md](../README.md) file. Refer to it for details on it's location |
| nfs_ssh_public_is_path  | Determines if the SSH Public Key is stored on a file or in a variable. This value should **always** be **set** to **true** |
| nfs_ssh_private_is_path | Determines if the SSH Private Key is stored on a file or in a variable. This value should **always** be **set** to **true** |
| nfs_vcn_display_name | Display name where the NFS Filesystems are located at. This is required to lookup for the mount point |
| nfs_fss_availability_domain_number | Integer number indicating in which Availability Domain the NFS File Systems will be created. This needs to be the same as where the mount point is |
| nfs_mt_availability_domain_number | Integer number indicating in which Availability Domain the NFS Mount Point is located at. |
| nfs_num_of_fss | Integer number that indicates how many NFS File Systems should be created. This value should **always** be **set** to **3** |
| nfs_mt_compartment_name | Name of the compartment where the NFS Mount Target was created |
| nfs_export_path_base | Export path base, to name the NFS File Systems |
| nfs_fss_display_name_base | Base display name for NFS File Systems |
| nfs_fss_instance_compartment_name | Name of the compartment where FSS artifacts are created |
| nfs_fss_network_compartment_name | Name of the compartment where the Network for FSS artifacts is at |
| nfs_mount_target_name | Explicit name of the mount target related to the values above generated |



**Variables for module: loadbalancer**

| Property                | Value                                                        |
| ----------------------- | ------------------------------------------------------------ |
| loadbalancer_ssh_public_key      | This is the full path of the SSH Public Key associated to the hosts. This file was created in API Key Management and AWS S3 Compatibility API Integration section in the following [README.md](../README.md) file. Refer to it for details on it's location |
| loadbalancer_ssh_private_key     | This is the full path of the SSH Private Key associated to the hosts. This file was created in API Key Management and AWS S3 Compatibility API Integration section in the following [README.md](../README.md) file. Refer to it for details on it's location |
| loadbalancer_ssh_public_is_path  | Determines if the SSH Public Key is stored on a file or in a variable. This value should **always** be **set** to **true** |
| loadbalancer_ssh_private_is_path | Determines if the SSH Private Key is stored on a file or in a variable. This value should **always** be **set** to **true** |
| loadbalancer_lbaas_instance_compartment_name | Name of the compartment where the LBaaS artifact is created |
| loadbalancer_lbaas_network_compartment_name | Name of the compartment where the network related to the LBaaS is |
| loadbalancer_vcn_display_name | Display name of the VCN where the artifacts are created |
| loadbalancer_lbaas_display_name | Display name for LBaaS |
| loadbalancer_lbaas_shape_min_bw_mbps | Minimum bandwidth assigned to LBaaS |
| loadbalancer_lbaas_shape_max_bw_mbps | Maximum bandwidth assigned to LBaaS |
| loadbalancer_is_private | Boolean flag that determines if the LBaaS Listener is set to be created on Public or Private Network. |
| loadbalancer_nsg_name | Name of the Network Security Group associated to the LBaaS |

**Variables for module: backendset**

| Property                         | Value                                                        |
| -------------------------------- | ------------------------------------------------------------ |
| backendset_ssh_public_key      | This is the full path of the SSH Public Key associated to the hosts. This file was created in API Key Management and AWS S3 Compatibility API Integration section in the following [README.md](../README.md) file. Refer to it for details on it's location |
| backendset_ssh_private_key     | This is the full path of the SSH Private Key associated to the hosts. This file was created in API Key Management and AWS S3 Compatibility API Integration section in the following [README.md](../README.md) file. Refer to it for details on it's location |
| backendset_ssh_public_is_path  | Determines if the SSH Public Key is stored on a file or in a variable. This value should **always** be **set** to **true** |
| backendset_ssh_private_is_path | Determines if the SSH Private Key is stored on a file or in a variable. This value should **always** be **set** to **true** |
| backendset_vcn_display_name | Display name of the VCN where the artifacts are created |
| backendset_balancing_protocol | Balancing protocol to which the requests should be redirected on declared backend |
| backendset_lbaas_backend_set_name | Name of the backend set |
| backendset_lbaas_bes_check_protocol | Healthcheck protocol to be used to determine the health of the backend |
| backendset_lbaas_bes_checkport | Healtchek port to be used to determine the health of the backend |
| backendset_lbaas_path_to_routeset_name | Path to Routeset name |
| backendset_lbaas_bes_instance_compartment_name | Compartment name where the artifact is created |
| backendset_lbaas_bes_network_compartment_name | Compartment name where the network is |
| backendset_lbaas_bes_listen_port | Listen Port for LBaaS Listener. Overload if required |
| backendset_lbaas_bes_listen_protocol | Protocol for Listen Port. Overload if required |
| backendset_ms_per_machine | Amount of managed servers to be created per each compute. This allows vertical scale up on domain |
| backendset_certificate_private_key | Relative path to LBaaS Private Key certificate |
| backendset_lbaas_public_cert | Relative path to LBaaS Public Certificate |
| backendset_lbaas_certificate_name | Name of the Certificate |
| backendset_lbaas_ca_cert | Relative path to LBaaS Certificate Authority CA |



## variables.tf



This file contains the combined variable sets for all the modules orchestrated for each modular component. Consult each individual module variable inside each backend README.md file. 

You may access this file by clicking [here](variables.tf)







------

The following code is protected using Oracle Technology Network License Agreement. For more details, please refer to the project's OEM [LICENSE](LICENSE)  file.



**Copyright (c) 2021, Oracle, Oracle Advanced Customer Services and/or its affiliates. All rights reserved.**

