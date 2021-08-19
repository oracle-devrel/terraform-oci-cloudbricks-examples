# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# variables.tf
#
# Purpose:The following script declares all variables used in this backend repository

/********** Provider Variables NOT OVERLOADABLE **********/
variable "region" {
  description = "Target region where artifacts are going to be created"
}

variable "tenancy_ocid" {
  description = "OCID of tenancy"
}

variable "user_ocid" {
  description = "User OCID in tenancy. Currently hardcoded to user denny.alquinta@oracle.com"
}

variable "fingerprint" {
  description = "API Key Fingerprint for user_ocid derived from public API Key imported in OCI User config"
}

variable "private_key_path" {
  description = "Private Key Absolute path location where terraform is executed"

}
/********** Provider Variables NOT OVERLOADABLE **********/

/********** mainbizcomp compartment **********/
variable "mainbizcomp_is_root_parent" {
  description = "The following variable describes if Root compartment is the parent of this"

}
variable "mainbizcomp_root_compartment_ocid" {
  description = "Defines the OCID of the root compartment"

}
variable "mainbizcomp_compartment_name" {
  description = "Defines the display name of compartment"

}
variable "mainbizcomp_compartment_description" {
  description = "Enters a description of the compartment"

}
variable "mainbizcomp_enable_delete" {
  description = "Defines if this compartment can be programatically deleted by terraform destroy"

}

/********** mainbizcomp compartment **********/

/********** hub01comp compartment **********/
variable "hub01comp_compartment_name" {
  description = "Defines the display name of compartment"

}
variable "hub01comp_compartment_description" {
  description = "Enters a description of the compartment"

}
variable "hub01comp_enable_delete" {
  description = "Defines if this compartment can be programatically deleted by terraform destroy"

}

/********** hub01comp compartment **********/


/********** spoke01comp compartment **********/
variable "spoke01comp_compartment_name" {
  description = "Defines the display name of compartment"

}
variable "spoke01comp_compartment_description" {
  description = "Enters a description of the compartment"

}
variable "spoke01comp_enable_delete" {
  description = "Defines if this compartment can be programatically deleted by terraform destroy"

}

/********** spoke01comp compartment **********/

/********** spoke02comp compartment **********/
variable "spoke02comp_compartment_name" {
  description = "Defines the display name of compartment"

}

variable "spoke02comp_compartment_description" {
  description = "Enters a description of the compartment"

}

variable "spoke02comp_enable_delete" {
  description = "Defines if this compartment can be programatically deleted by terraform destroy"

}
/********** spoke02comp compartment **********/

/********** ARTIFACT HUB 01 compartment **********/
variable "artifact_hub01comp_compartment_name" {
  description = "Compartment Display Name"
}

variable "artifact_hub01comp_compartment_description" {
  description = "Compartment Description"
}

variable "artifact_hub01comp_enable_delete" {
  description = "Defines if this compartment can be programatically deleted by terraform destroy"
}
/********** ARTIFACT HUB 01 compartment **********/

/********** NETWORK HUB 01 compartment **********/
variable "network_hub01comp_compartment_name" {
  description = "Compartment Display Name"
}

variable "network_hub01comp_compartment_description" {
  description = "Compartment Description"
}

variable "network_hub01comp_enable_delete" {
  description = "Defines if this compartment can be programatically deleted by terraform destroy"
}
/********** NETWORK HUB 01 compartment **********/


/********** ARTIFACT SPOKE 01 compartment **********/
variable "artifact_spoke01comp_compartment_name" {
  description = "Compartment Display Name"
}

variable "artifact_spoke01comp_compartment_description" {
  description = "Compartment Description"
}

variable "artifact_spoke01comp_enable_delete" {
  description = "Defines if this compartment can be programatically deleted by terraform destroy"
}
/********** ARTIFACT SPOKE 01 compartment **********/

/********** NETWORK SPOKE 01 compartment **********/
variable "network_spoke01comp_compartment_name" {
  description = "Compartment Display Name"
}

variable "network_spoke01comp_compartment_description" {
  description = "Compartment Description"
}

variable "network_spoke01comp_enable_delete" {
  description = "Defines if this compartment can be programatically deleted by terraform destroy"
}
/********** NETWORK SPOKE 01 compartment **********/


/********** ARTIFACT SPOKE 02 compartment **********/
variable "artifact_spoke02comp_compartment_name" {
  description = "Compartment Display Name"
}

variable "artifact_spoke02comp_compartment_description" {
  description = "Compartment Description"
}

variable "artifact_spoke02comp_enable_delete" {
  description = "Defines if this compartment can be programatically deleted by terraform destroy"
}
/********** ARTIFACT SPOKE 02 compartment **********/

/********** NETWORK SPOKE 02 compartment **********/
variable "network_spoke02comp_compartment_name" {
  description = "Compartment Display Name"
}

variable "network_spoke02comp_compartment_description" {
  description = "Compartment Description"
}

variable "network_spoke02comp_enable_delete" {
  description = "Defines if this compartment can be programatically deleted by terraform destroy"
}
/********** NETWORK SPOKE 02 compartment **********/