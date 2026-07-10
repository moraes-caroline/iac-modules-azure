module "key_vault" {
  source = "git::https://github.com/moraes-caroline/iac-modules-azure.git//infra/modules/key-vault?ref=main"

  key_vault_name     = var.key_vault_name
  resource_group_name = module.resource_group.name
  location            = var.location
  tenant_id           = data.azurerm_client_config.current.tenant_id

  admin_password = var.admin_password

  tags = local.tags
}