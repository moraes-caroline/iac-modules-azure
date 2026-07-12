resource "azurerm_monitor_diagnostic_setting" "this" {
  name               = var.name
  target_resource_id = var.target_resource_id

  log_analytics_workspace_id     = var.log_analytics_workspace_id
  storage_account_id             = var.storage_account_id
  log_analytics_destination_type = var.log_analytics_destination_type

  dynamic "enabled_log" {
    for_each = toset(var.enabled_log_categories)

    content {
      category = enabled_log.value
    }
  }

  dynamic "enabled_metric" {
    for_each = toset(var.enabled_metric_categories)

    content {
      category = enabled_metric.value
    }
  }
}
