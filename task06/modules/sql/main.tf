#azurerm_mssql_server
#azurerm_mssql_firewall_rule
#azurerm_mssql_database
#random_password
#key_vault_secret

resource "random_password" "pass" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

data "azurerm_key_vault" "kv" {
  name                = var.kv_name
  resource_group_name = var.kv_rg_name
}

resource "random_string" "user" {
  length  = 8
  special = false
  upper   = false
  numeric = false
}

resource "azurerm_key_vault_secret" "sql_login" {
  name         = var.sql_admin_secret_name
  value        = "adm${random_string.user.result}"
  key_vault_id = data.azurerm_key_vault.kv.id
}

resource "azurerm_key_vault_secret" "sql_pass" {
  name         = var.sql_admin_secret_password
  value        = random_password.pass.result
  key_vault_id = data.azurerm_key_vault.kv.id
}

resource "azurerm_mssql_server" "SQLserver" {
  name                         = var.name
  resource_group_name          = var.rg_name
  location                     = var.rg_loc
  version                      = "12.0"
  administrator_login          = azurerm_key_vault_secret.sql_login.value
  administrator_login_password = azurerm_key_vault_secret.sql_pass.value
  minimum_tls_version          = "1.2"
}

resource "azurerm_mssql_firewall_rule" "fw" {
  name             = var.sql_fwr_name
  server_id        = azurerm_mssql_server.SQLserver.id
  start_ip_address = var.allowed_ip_address
  end_ip_address   = var.allowed_ip_address

}

resource "azurerm_mssql_database" "db" {
  name         = var.sql_db_name
  server_id    = azurerm_mssql_server.SQLserver.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = var.sql_sku
  enclave_type = "VBS"

  tags = {
    foo = "bar"
  }

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = false
  }
}

