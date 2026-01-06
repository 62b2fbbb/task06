output "sql_connection_string" {
  value     = "Server=tcp:${azurerm_mssql_server.srv.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.db.name};Persist Security Info=False;User ID=${azurerm_key_vault_secret.sql_login.value};Password=${azurerm_key_vault_secret.sql_pass.value};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  sensitive = true
}

output "sql_server_fqdn" {
  value = azurerm_mssql_server.srv.fully_qualified_domain_name
}