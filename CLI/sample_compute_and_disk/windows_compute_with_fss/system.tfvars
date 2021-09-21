# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# system.tfvars
#
# Purpose: The following script defines the system particular variables to provision environment

########## PROVIDER SPECIFIC VARIABLES ##########
region           = "re-region-1"
tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaaoqdygmiidrabhv3y4hkr3rb3z6dpmgotvq2scffra6jt7rubresa"
user_ocid        = "ocid1.user.oc1..aaaaaaaafl42rhkw624h4os6n2ulcfxjjn2ylqsanhgtcph7j7owirzj6gya"
fingerprint      = "9a:9e:13:cf:94:6e:2c:b9:54:d2:60:0d:e4:14:8b:5e"
private_key_path = "/home/opc/my_keys/oci_api_key.pem"
########## PROVIDER SPECIFIC VARIABLES ##########

########## INSTANCE SPECIFIC VARIABLES ##########
instance01_ssh_public_key                   = "/home/opc/.ssh/OCI_KEYS/SSH/auto_ssh_id_rsa.pub"
instance01_ssh_private_key                  = "/home/opc/.ssh/OCI_KEYS/SSH/auto_ssh_id_rsa"
instance01_ssh_public_is_path               = true
instance01_ssh_private_is_path              = true
instance01_compute_availability_domain_list = ["oDQF:re-region-1-AD-1"]

instance01_network_subnet_name                       = "My_Subnet"
instance01_assign_public_ip_flag                     = true
instance01_fault_domain_name                         = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3"]
instance01_bkp_policy_boot_volume                    = "bronze"
instance01_windows_compute_instance_compartment_name = "COMPARTMENT"
instance01_windows_compute_network_compartment_name  = "COMPARTMENT"
instance01_vcn_display_name                          = "MY_VCN"
instance01_num_instances                             = 1
instance01_is_nsg_required                           = false
instance01_compute_nsg_name                          = ""
instance01_compute_display_name_base                 = "win2019"
instance01_instance_image_ocid                       = "ocid1.image.oc1.re-region-1.aaaaaaaaaawshehk5nk3h7tt3gj6obzwjeohbmknuslro4biuqk7enaaihna" #Image: Windows-Server-2019-Standard-Edition-VM-2021.04.13-0
instance01_instance_shape                            = "VM.Standard.E4.Flex"
instance01_is_flex_shape                             = true
instance01_instance_shape_config_ocpus               = 1
instance01_instance_shape_config_memory_in_gbs       = 16

########## INSTANCE SPECIFIC VARIABLES ##########

########## ARTIFACT SPECIFIC VARIABLES ##########
disk01_num_of_fss                           = 1
disk01_export_path_base                     = "fss"
disk01_fss_display_name_base                = "fssdisk"
disk01_fss_instance_compartment_name        = "COMPARTMENT"
disk01_fss_network_compartment_name         = "COMPARTMENT"
disk01_mt_compartment_name                  = "COMPARTMENT"
disk01_vcn_display_name                     = "MY_VCN"
disk01_network_subnet_name                  = "My_Subnet"
disk01_fss_mount_target_availability_domain = "oDQF:re-region-1-AD-1"
disk01_fss_mount_target_name                = "mount_target"

disk01_ssh_private_key              = "/home/opc/.ssh/OCI_KEYS/SSH/auto_ssh_id_rsa"
disk01_os_type                      = "windows"
disk01_is_winrm_configured_with_ssl = true
disk01_disk_unit                    = "Z"
########## ARTIFACT SPECIFIC VARIABLES ##########