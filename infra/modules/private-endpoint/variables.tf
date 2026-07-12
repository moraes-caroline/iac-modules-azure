variable "name" {
  description = "Private Endpoint Name"
  type        = string
}

variable "location" {
  description = "Azure Location"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for Private Endpoint"
  type        = string
}

variable "target_resource_id" {
  description = "Resource ID to connect"
  type        = string
}

variable "subresource_names" {
  description = "Subresource names"
  type        = list(string)
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "private_dns_zone_ids" {
  type    = list(string)
  default = []
}