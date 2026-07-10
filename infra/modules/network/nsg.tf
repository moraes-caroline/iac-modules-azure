resource "azurerm_network_security_group" "api" {
  name                = "nsg-api"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_group" "db" {
  name                = "nsg-db"
  location            = var.location
  resource_group_name = var.resource_group_name
}