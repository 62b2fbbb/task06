output "sql_admin_username_secret_id" {
  description = "Key Vault secret ID for SQL admin username"
  value       = azurerm_key_vault_secret.sql_login.id
}

output "sql_admin_password_secret_id" {
  description = "Key Vault secret ID for SQL admin password"
  value       = azurerm_key_vault_secret.sql_pass.id
}

output "sql_connection_string" {
  description = "Connection string for SQL Database"
  value       = nonsensitive("Server=tcp:${azurerm_mssql_server.srv.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.db.name};Persist Security Info=False;User ID=admuser;Password=${random_password.pass.result};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;")

  sensitive = false
}

output "sql_server_fqdn" {
  value = azurerm_mssql_server.srv.fully_qualified_domain_name
}