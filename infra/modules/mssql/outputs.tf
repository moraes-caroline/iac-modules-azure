output "sql_server_id" {
  value = azurerm_mssql_server.sql_server.id
}
output "database_id" {
  value = azurerm_mssql_database.this.id
}

output "fqdn" {
  value = azurerm_mssql_server.this.fully_qualified_domain_name
}