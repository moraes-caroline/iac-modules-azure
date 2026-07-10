variable "sql_server_name" {}
variable "database_name" {}

variable "resource_group_name" {}
variable "location" {}

variable "admin_login" {}

variable "admin_password" {
  sensitive = true
}

variable "sku_name" {}

variable "tags" {
  type = map(string)
}