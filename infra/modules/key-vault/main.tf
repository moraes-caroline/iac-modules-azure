resource "azurerm_key_vault" "this" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name

  tenant_id = var.tenant_id

  sku_name = "standard"

  purge_protection_enabled   = true
  soft_delete_retention_days = 7

  tags = var.tags
}

resource "azurerm_key_vault_secret" "sql_password" {
  name         = "sql-admin-password"
  value        = random_password.sql.result
  key_vault_id = azurerm_key_vault.this.id
}