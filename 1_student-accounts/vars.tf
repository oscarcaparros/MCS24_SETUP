##############################################################################################################
# FortiGate Terraform deployment
# - Update variable regions with region where deploy
# - Update number of user per region to deploy
##############################################################################################################

# Prefix for all resources created for this deployment in AWS
variable "prefix" {
  description = "Provide a common tag prefix value that will be used in the name tag for all resources"
  default     = "mcs24"
}

# Prefix for all resources created for this deployment in AWS
variable "tags" {
  description = "Attribute for tag Enviroment"
  type        = map(any)
  default = {
    Project = "mcs24"
  }
}

variable "regions" {
  description = "Regions where create users"
  type        = list(string)
  default = [
    //   "eu-west-1",
    "eu-west-2",
    "eu-west-3"
  ]
}

variable "user_number-peer-region" {
  description = "Number of user to deploy peer region"
  type        = number
  default     = 15
}

variable "user_path-prefix" {
  description = "Path prefix for users with pattern: /path-prefix/"
  type        = string
  default     = "/mcs24/"
}

# Access and secret keys to your environment
variable "access_key" {}
variable "secret_key" {}