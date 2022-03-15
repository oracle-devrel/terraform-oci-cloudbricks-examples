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

######################################## OKE01 SPECIFIC VARIABLES ######################################
oke01_instance_compartment_name             = "MY_ARTIFACT_COMPARTMENT"
oke01_network_compartment_name              = "MY_NETWORK_COMPARTMENT"
oke01_vcn_display_name                      = "MY_VCN"
oke01_lbaas_network_subnet_name             = "My_Public_Subnet"
oke01_endpoint_subnet_name                  = "My_Private_Subnet"
oke01_endpoint_is_public_ip_enabled         = false
oke01_availability_domain_map               = { "ad1" : "aBCD:foo-REGION-1-AD-1", "ad2" : "aBCD:foo-REGION-1-AD-2", "ad3" : "aBCD:foo-REGION-1-AD-3" }
oke01_cluster_name                          = "my_k8_cluster"
oke01_k8s_version                           = "vX.Y.Z"
oke01_k8s_dashboard_enabled                 = true
oke01_k8s_tiller_enabled                    = true
######################################## OKE01 SPECIFIC VARIABLES ######################################

######################################## NODE01 SPECIFIC VARIABLES ########################################
node01_ssh_public_key                       = "/path/to/public/ssh/key/pub_key"
node01_ssh_private_key                      = "/path/to/public/ssh/key/priv_key"
node01_ssh_public_is_path                   = true
node01_ssh_private_is_path                  = true
node01_oke_cluster_compartment_name         = "MY_ARTIFACT_COMPARTMENT"
node01_oke_network_compartment_name         = "MY_NETWORK_COMPARTMENT"
node01_oke_availability_domain_map          = { "ad1" : "aBCD:foo-REGION-1-AD-1", "ad2" : "aBCD:foo-REGION-1-AD-2", "ad2" : "aBCD:foo-REGION-1-AD-3" }
node01_oke_cluster_name                     = "my_k8_cluster"
node01_oke_nodepool_network_subnet_name     = "node_pool_subnet"
node01_k8s_version                          = "K8_Version"
node01_node_pool_name                       = "my_node_pool"
node01_node_pool_shape                      = "VM.Standard.E4.Flex"
node01_is_flex_shape                        = true
node01_nodepool_shape_config_ocpus          = 1
node01_nodepool_shape_config_memory_in_gbs  = 16
node01_number_of_nodes                      = 3
node01_k8s_label_map                        = { "SampleLabel1" : "SomeText", "SampleLabel1" : "AnotherText" }
######################################## NODE01 SPECIFIC VARIABLES ########################################
