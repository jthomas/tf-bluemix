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

data "ibmcloud_cf_service_key" "serviceKeydata" {
  name  = "twilio"
  service_instance_name = "twilio"
}

variable bxapikey {
  description = "Your Bluemix API Key."
}

##############################################################################
# Outputs
##############################################################################
output "twilio_key" {
  value = "${ibmcloud_cf_service_key.serviceKeydata.twilio.credentials}"
}
