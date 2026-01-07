resource "azurerm_service_plan" "asp" {
  name                = var.asp_name
  resource_group_name = var.rg_name
  location            = var.rg_loc
  os_type             = "Linux"
  sku_name            = var.asp_sku
  tags                = var.tags
}

# Azure Linux Web Application
resource "azurerm_linux_web_app" "app" {
  name                = var.app_name
  resource_group_name = var.rg_name
  location            = var.rg_loc
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    application_stack {
      dotnet_version = var.app_dotnet_version
    }
  }

  connection_string {
    name  = "DefaultConnection"
    type  = "SQLAzure"
    value = var.sql_connection_string
  }
  tags = var.tags

}
