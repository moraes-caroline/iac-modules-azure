resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name

  address_space = var.address_space
}

#################################################
# API APP SERVICE
#################################################

resource "azurerm_subnet" "api" {
  name                 = "snet-appservice-api"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name

  address_prefixes = ["10.10.1.0/24"]

  delegation {
    name = "appservice-api"

    service_delegation {
      name = "Microsoft.Web/serverFarms"

      actions = [
        "Microsoft.Network/virtualNetworks/subnets/action"
      ]
    }
  }
}

#################################################
# FRONTEND APP SERVICE
#################################################

resource "azurerm_subnet" "frontend" {
  name                 = "snet-appservice-front"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name

  address_prefixes = ["10.10.2.0/24"]

  delegation {
    name = "appservice-front"

    service_delegation {
      name = "Microsoft.Web/serverFarms"

      actions = [
        "Microsoft.Network/virtualNetworks/subnets/action"
      ]
    }
  }
}

#################################################
# PRIVATE ENDPOINTS
#################################################

resource "azurerm_subnet" "private_endpoints" {
  name                 = "snet-private-endpoints"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name

  address_prefixes = ["10.10.3.0/24"]

  private_endpoint_network_policies = "Disabled"
}
