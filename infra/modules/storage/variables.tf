variable "storage_account_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "LRS"
}

variable "access_tier" {
  type    = string
  default = "Hot"
}

variable "public_network_access_enabled" {
  type    = bool
  default = false
}

variable "containers" {
  type    = list(string)
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}   