output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

output "api_subnet_id" {
  value = azurerm_subnet.api.id
}

output "frontend_subnet_id" {
  value = azurerm_subnet.frontend.id
}

output "database_subnet_id" {
  value = azurerm_subnet.database.id
}

output "private_endpoint_subnet_id" {
  value = azurerm_subnet.private_endpoints.id
}

output "vnet_id" {
  value = azurerm_virtual_network.this.id
}