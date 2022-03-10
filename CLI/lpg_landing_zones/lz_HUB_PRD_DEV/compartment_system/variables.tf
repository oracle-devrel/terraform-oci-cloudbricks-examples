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

/********** hub01 compartment **********/
variable "hub01_compartment_name" {
  description = "Defines the display name of compartment"

}
variable "hub01_compartment_description" {
  description = "Enters a description of the compartment"

}
variable "hub01_enable_delete" {
  description = "Defines if this compartment can be programatically deleted by terraform destroy"

}

/********** hub01 compartment **********/


/********** prd01 compartment **********/
variable "prd01_compartment_name" {
  description = "Defines the display name of compartment"

}
variable "prd01_compartment_description" {
  description = "Enters a description of the compartment"

}
variable "prd01_enable_delete" {
  description = "Defines if this compartment can be programatically deleted by terraform destroy"

}

/********** prd01 compartment **********/

/********** dev01 compartment **********/
variable "dev01_compartment_name" {
  description = "Defines the display name of compartment"

}

variable "dev01_compartment_description" {
  description = "Enters a description of the compartment"

}

variable "dev01_enable_delete" {
  description = "Defines if this compartment can be programatically deleted by terraform destroy"

}
/********** dev01 compartment **********/

/********** ARTIFACT HUB 01 compartment **********/
variable "hub01_artifacts_compartment_name" {
  description = "Compartment Display Name"
}

variable "hub01_artifacts_compartment_description" {
  description = "Compartment Description"
}

variable "hub01_artifacts_enable_delete" {
  description = "Defines if this compartment can be programatically deleted by terraform destroy"
}
/********** ARTIFACT HUB 01 compartment **********/

/********** NETWORK HUB 01 compartment **********/
variable "hub01_network_compartment_name" {
  description = "Compartment Display Name"
}

variable "hub01_network_compartment_description" {
  description = "Compartment Description"
}

variable "hub01_network_enable_delete" {
  description = "Defines if this compartment can be programatically deleted by terraform destroy"
}
/********** NETWORK HUB 01 compartment **********/


/********** ARTIFACT SPOKE 01 compartment **********/
variable "prd01_artifacts_compartment_name" {
  description = "Compartment Display Name"
}

variable "prd01_artifacts_compartment_description" {
  description = "Compartment Description"
}

variable "prd01_artifacts_enable_delete" {
  description = "Defines if this compartment can be programatically deleted by terraform destroy"
}
/********** ARTIFACT SPOKE 01 compartment **********/

/********** NETWORK SPOKE 01 compartment **********/
variable "prd01_network_compartment_name" {
  description = "Compartment Display Name"
}

variable "prd01_network_compartment_description" {
  description = "Compartment Description"
}

variable "prd01_network_enable_delete" {
  description = "Defines if this compartment can be programatically deleted by terraform destroy"
}
/********** NETWORK SPOKE 01 compartment **********/


/********** ARTIFACT SPOKE 02 compartment **********/
variable "dev01_artifacts_compartment_name" {
  description = "Compartment Display Name"
}

variable "dev01_artifacts_compartment_description" {
  description = "Compartment Description"
}

variable "dev01_artifacts_enable_delete" {
  description = "Defines if this compartment can be programatically deleted by terraform destroy"
}
/********** ARTIFACT SPOKE 02 compartment **********/

/********** NETWORK SPOKE 02 compartment **********/
variable "dev01_network_compartment_name" {
  description = "Compartment Display Name"
}

variable "dev01_network_compartment_description" {
  description = "Compartment Description"
}

variable "dev01_network_enable_delete" {
  description = "Defines if this compartment can be programatically deleted by terraform destroy"
}
/********** NETWORK SPOKE 02 compartment **********/