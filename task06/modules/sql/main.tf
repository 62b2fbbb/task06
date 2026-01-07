#azurerm_mssql_server
#azurerm_mssql_firewall_rule
#azurerm_mssql_database
#random_password
#key_vault_secret

data "azurerm_key_vault" "kv" {
  name                = var.kv_name
  resource_group_name = var.kv_rg_name
}

resource "random_password" "pass" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_key_vault_secret" "sql_login" {
  name         = "sql-admin-name"
  value        = "admuser"
  key_vault_id = data.azurerm_key_vault.kv.id
  tags         = var.tags
}

resource "azurerm_key_vault_secret" "sql_pass" {
  name         = "sql-admin-password"
  value        = random_password.pass.result
  key_vault_id = data.azurerm_key_vault.kv.id
  tags         = var.tags
}

resource "azurerm_mssql_server" "srv" {
  name                         = var.name
  resource_group_name          = var.rg_name
  location                     = var.rg_loc
  version                      = "12.0"
  administrator_login          = azurerm_key_vault_secret.sql_login.value
  administrator_login_password = azurerm_key_vault_secret.sql_pass.value
  minimum_tls_version          = "1.2"
  tags                         = var.tags

}

resource "azurerm_mssql_firewall_rule" "fw" {
  name             = var.sql_fwr_name
  server_id        = azurerm_mssql_server.srv.id
  start_ip_address = var.allowed_ip_address
  end_ip_address   = var.allowed_ip_address

}

resource "azurerm_mssql_firewall_rule" "allow_azure_services" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.srv.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_mssql_database" "db" {
  name         = var.sql_db_name
  server_id    = azurerm_mssql_server.srv.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = var.sql_sku
  enclave_type = "VBS"

  tags = var.tags

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = false
  }
}

