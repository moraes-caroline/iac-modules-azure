variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "service_plan_id" {
  type = string
}

variable "api_subnet_id" {
  type = string
}

variable "frontend_subnet_id" {
  type = string
}

variable "environment" {
  type = string
}

variable "api" {
  type = object({
    app_name     = string
    node_version = string
    always_on    = bool
    app_settings = map(string)
  })
}

variable "frontend" {
  type = object({
    app_name     = string
    node_version = string
    always_on    = bool
    api_url      = string
    app_settings = map(string)
  })
}

variable "tags" {
  type    = map(string)
  default = {}
}
