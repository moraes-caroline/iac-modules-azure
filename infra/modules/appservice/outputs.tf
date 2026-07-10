output "frontend_url" {
  value = "https://${azurerm_linux_web_app.frontend.default_hostname}"
}

output "api_id" {
  value = azurerm_linux_web_app.api.id
}

output "frontend_id" {
  value = azurerm_linux_web_app.frontend.id
}