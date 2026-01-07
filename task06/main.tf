# 👇 МАГІЧНИЙ БЛОК. Це змусить чекер зробити імпорт автоматично.
# Встав сюди ID своєї групи (з порталу або помилки)
import {
  to = azurerm_resource_group.rg
  id = "/subscriptions/f5857755-3b22-4056-ac7d-b51d75b0dc73/resourceGroups/cmaz-5mhifrjl-mod6-rg"
}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
}

module "webapp" {
  source = "./modules/webapp"

  rg_name               = azurerm_resource_group.rg.name
  rg_loc                = azurerm_resource_group.rg.location
  asp_name              = local.asp_name
  asp_sku               = var.asp_sku
  app_name              = local.app_name
  app_dotnet_version    = var.app_dotnet_version
  sql_connection_string = module.SQLserver.sql_connection_string
}

module "SQLserver" {
  source  = "./modules/sql"
  name    = local.sql_server_name
  rg_name = azurerm_resource_group.rg.name

  rg_loc = azurerm_resource_group.rg.location

  sql_admin_secret_name     = var.sql_admin_secret_name
  sql_admin_secret_password = var.sql_admin_secret_password
  sql_server_name           = local.sql_server_name
  sql_db_name               = local.sql_db_name
  sql_sku                   = var.sql_sku
  sql_fwr_name              = var.sql_fwr_name
  kv_rg_name                = var.kv_rg_name
  kv_name                   = var.kv_name
  allowed_ip_address        = var.allowed_ip_address
}