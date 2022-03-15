# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# system.tfvars
#
# Purpose: The following script defines the system particular variables to provision environment


######################################## PROVIDER SPECIFIC VARIABLES ######################################
tenancy_ocid        = "ocid1.tenancy.oc1..foobarbar"
region              = "re-region-1"
user_ocid           = "ocid1.user.oc1..foobarbar"
fingerprint         = "fo:oo:ba:ar:ba:ar"
private_key_path    = "/foo/bar/path/oci_api_key.pem"
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