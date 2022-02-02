# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# output.tf
#
# Purpose: The following script defines the output for system created


output "SQLDeveloperPublicApexURL" {
    description = "Public SQL Developer URL via ORDS"
    value = module.apex01.SQLDeveloperPublicURL
}

output "ApexURL" {
    description = "Public URL containing Apex"
    value = module.apex01.APEXPublicURL
}
