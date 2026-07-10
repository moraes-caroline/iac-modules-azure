variable "name" {
  description = "Nome do Diagnostic Setting."
  type        = string
}

variable "target_resource_id" {
  description = "ID do recurso que receberá Diagnostic Settings."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "ID do Log Analytics Workspace."
  type        = string
  default     = null
}

variable "storage_account_id" {
  description = "ID do Storage Account para arquivamento de logs. Opcional."
  type        = string
  default     = null
}

variable "log_analytics_destination_type" {
  description = "Tipo de destino no Log Analytics."
  type        = string
  default     = "Dedicated"
}

variable "enabled_log_categories" {
  description = "Categorias de logs habilitadas."
  type        = list(string)
  default     = []
}

variable "enabled_metric_categories" {
  description = "Categorias de métricas habilitadas."
  type        = list(string)
  default     = ["AllMetrics"]
}