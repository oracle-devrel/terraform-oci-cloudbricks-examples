# Copyright (c) 2021 Oracle and/or its affiliates.
#!/bin/bash
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# generate_self_signed-certs.sh 
#
# Purpose: Generate SSC following this document: Oracle Cloud Infrastructure - How Create a SSL Certificate for a Load Balancer (Doc ID 2617046.1)
#          Self signed certificates are not production safe. Be sure to use a real certificate once you put this environment in production


openssl genrsa -out ca.key 2048
openssl req -new -key ca.key -out ca.csr -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=selfsignedcert"
openssl x509 -req -in ca.csr -signkey ca.key -out ca.crt
openssl genrsa -out loadbalancer.key 2048
openssl req -new -key loadbalancer.key -out loadbalancer.csr -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=root"
openssl x509 -req -in loadbalancer.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out loadbalancer.crt -days 50000
openssl x509 -in loadbalancer.crt -text
