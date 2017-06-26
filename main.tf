##############################################################################
# Require terraform 0.9.3 or greater
##############################################################################
terraform {
  required_version = ">= 0.9.3"
}
##############################################################################
# IBM Cloud Provider
##############################################################################
# See the README for details on ways to supply these values
provider "ibmcloud" {
  bluemix_api_key = "${var.bxapikey}"
}

resource "ibmcloud_cf_service_instance" "cloudant" {
  name              = "cloudant"
  space_guid        = "dev"
  service           = "cloudantNoSQLDB"
  plan              = "Shared"
}

variable bxapikey {
  description = "Your Bluemix API Key."
}

##############################################################################
# Outputs
##############################################################################
output "cloudant_key" {
  value = "${ibmcloud_cf_service_instance.cloudant.credentials}"
}
