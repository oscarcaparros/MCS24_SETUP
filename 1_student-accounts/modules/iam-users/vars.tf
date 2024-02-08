# Prefix for all resources created for this deployment in AWS
variable "prefix" {
  description = "Provide a common tag prefix value that will be used in the name tag for all resources"
  default     = "xs22"
}

# Prefix for all resources created for this deployment in AWS
variable "tags" {
  description = "Attribute for tag Enviroment"
  type        = map(any)
  default     = {
    Project   = "xpertsummit22"
  }
}

variable "region" {
  description = "Related region to operate create iam user"
  type        = string
  default     = "eu-west-1"
}

variable "user_number" {
  description = "Number of user to create"
  type        = number
  default     = 10
}

variable "user_path-prefix" {
  description = "Path prefix for users with pattern: /path-prefix/"
  type        = string
  default     = "/"
}

variable "group_name" {
  description = "Related region to operate create iam user"
  type        = string
  default     = "xs22-group-eu-west-1"
}

variable "externalid_token" {
  description = "ExternalId token for assume role"
  type        = string
  default     = "super-secret-externalid-token"
}
