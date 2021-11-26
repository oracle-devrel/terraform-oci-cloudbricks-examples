# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# system.tfvars
#
# Purpose: The following script defines the system particular variables to provision environment

######################################## COMMON VARIABLES ######################################
region           = "re-region-1"
tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaabcedfghijklmonoprstuvwxyz"
user_ocid        = "ocid1.tenancy.oc1..aaaaaaaabcedfghijklmonoprstuvwxyz"
fingerprint      = "fo:oo:ba:ar:ba:ar"
private_key_path = "/absolute/path/to/api/key/your_api_key.pem"
######################################## COMMON VARIABLES ######################################
######################################## ARTIFACT SPECIFIC VARIABLES ######################################


######################################## COMPUTE01 SPECIFIC VARIABLES ######################################
compute01_ssh_public_key                   = "./relative/path/to/ssh/key/public_ssh_key.pub"
compute01_ssh_private_key                  = "./relative/path/to/ssh/key/private_ssh_key"
compute01_ssh_public_is_path               = true
compute01_ssh_private_is_path              = true
compute01_compute_availability_domain_list = ["aBCD:foo-REGION-1-AD-1", "aBCD:foo-REGION-1-AD-2","aBCD:foo-REGION-1-AD-3" ]

compute01_network_subnet_name                     = "My_Subnet"
compute01_assign_public_ip_flag                   = true
compute01_fault_domain_name                       = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3"]
compute01_bkp_policy_boot_volume                  = "gold"
compute01_linux_compute_instance_compartment_name = "MY_INSTANCE_COMPARTMENT"
compute01_linux_compute_network_compartment_name  = "MY_NETWORK_COMPARTMENT"
compute01_vcn_display_name                        = "MY_VCN"
compute01_num_instances                           = 1
compute01_is_nsg_required                         = true
compute01_compute_nsg_name                        = "My_NSG"
compute01_compute_display_name_base               = "lnxmachine"
compute01_instance_image_ocid                     = "ocid1.image.oc1.re-region-1.aaaaaaaau7tfm24xgqs2wa" 
compute01_instance_shape                          = "VM.Standard2.1"
######################################## COMPUTE01 SPECIFIC VARIABLES ######################################


######################################## BASTION_SERVICE01 SPECIFIC VARIABLES ######################################
bastion_service01_bastion_service_instance_compartment_name = "MY_ARTIFACT_COMPARTMENT"
bastion_service01_bastion_service_network_compartment_name  = "MY_NETWORK_COMPARTMENT"
bastion_service01_private_network_subnet_name               = "My_Subnet"
bastion_service01_vcn_display_name                          = "MY_VCN"
bastion_service01_bastion_service_name                      = "bastionservice"
bastion_service01_allowed_client_cidr                       = ["0.0.0.0/0" , "10.0.0.0/16"] 
bastion_service01_bastion_max_session_ttl_in_seconds        = 1800 
######################################## BASTION_SERVICE01 SPECIFIC VARIABLES ######################################


######################################## BASTION_SESSION01 SPECIFIC VARIABLES ######################################
bastion_session01_ssh_public_key                            = "./relative/path/to/ssh/key/public_ssh_key.pub"
bastion_session01_bastion_service_name                      = "MY_BASTION_SERVICE_NAME"
bastion_session01_bastion_service_instance_compartment_name = "MY_BASTION_SERVICE_COMPARTMENT"

bastion_session01_bastion_session_compute_list  = [
  {
    "displayname" = "UnitaryBastionSession1"
    "type"        = "MANAGED_SSH"
    "username"    = "opc"
    "ttl"         = "10800"
  },
  {
    "displayname" = "UnitaryBastionSession2"
    "type"        = "PORT_FORWARDING"
    "port"        = "22"
    "ttl"         = "10800"
  },
]
######################################## BASTION_SESSION01 SPECIFIC VARIABLES ######################################


######################################## ARTIFACT SPECIFIC VARIABLES ######################################
