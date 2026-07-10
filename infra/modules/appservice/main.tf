# Module API

resource "azurerm_linux_web_app" "api" {
  name                = var.api.app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id

  https_only = true

  site_config {
    always_on = var.api.always_on

    application_stack {
      node_version = var.api.node_version
    }
  }

  app_settings = merge(
    var.api.app_settings,
    {
      ENVIRONMENT = var.environment
    }
  )

  tags = merge(
    var.tags,
    {
      Workload = "api"
    }
  )
}

resource "azurerm_app_service_virtual_network_swift_connection" "api" {
  app_service_id = azurerm_linux_web_app.api.id
  subnet_id      = var.api_subnet_id
}

# Module Front-End
resource "azurerm_linux_web_app" "frontend" {
  name                = var.frontend.app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id

  https_only = true

  site_config {
    always_on = var.frontend.always_on

    application_stack {
      node_version = var.frontend.node_version
    }
  }

  app_settings = merge(
    var.frontend.app_settings,
    {
      ENVIRONMENT  = var.environment
      API_URL      = var.api_url
      VITE_API_URL = "https://${azurerm_linux_web_app.api.default_hostname}"
    }
  )

  tags = merge(
    var.tags,
    {
      Workload = "frontend"
    }
  )
}

resource "azurerm_app_service_virtual_network_swift_connection" "frontend" {
  app_service_id = azurerm_linux_web_app.frontend.id
  subnet_id      = var.frontend_subnet_id
}