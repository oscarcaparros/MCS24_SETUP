##############################################################################################################
# IMPORTANT - Update variables with you group member and user
##############################################################################################################

// UPDATE owner with your AWS IAM user name
variable "tags" {
  description = "Attribute for tag Enviroment"
  type        = map(any)
  default = {
    Name    = "server-test"
    Project = "mcs24"
  }
}

// Name of existing key-pair, if null, it will create a new one
variable "key-pair_name" {
  description = "Key-Pair name in region to deploy"
  type        = string
  default     = null
}

// Server network interface
variable "eni-server" {
  type = map(any)
  default = {
    "id" = "ni-xxxx"
    "ip" = "x-x-x-x"
  }
}

// Git APP url 
variable "git_uri" {
  description = "Git APP repo uri"
  type        = string
  default     = "https://github.com/jmvigueras/xpertsummit22_setup.git"
}

// Path in git uri to module server lab
variable "git_uri_app-path" {
  description = "Path to APP in git repo"
  type        = string
  default     = "/xpertsummit22_setup/0_modules/hub-server/"
}

// LAB fqdn
variable "lab_fqdn" {
  description = "DNS FQDN lab portal"
  type        = string
  default     = "http://cloudlab.jvigueras-fortinet-site.com"
}

// LAB fqdn
variable "random-url-db" {
  description = "Random string part of url access to DB"
  type        = string
  default     = "admindb"
}

// External Token ID
variable "externalid-token" {
  description = "External Id token for accesing the lab"
  type        = string
  default     = "externalid"
}

// DB details
variable "db" {
  type = map(any)
  default = {
    db_host  = "mysqldb"
    db_user  = "root"
    db_pass  = "password"
    db_name  = "students"
    db_table = "students"
    db_port  = "3306"
  }
}

// instance typ
variable "instance_type" {
  type    = string
  default = "t3.large"
}

