variable "rg_name" {
  type        = string
  description = "The name of the Resource Group for web resources."
}

variable "asp_name" {
  type        = string
  description = "The name of the App Service Plan to be created."
}

variable "rg_loc" {
  type        = string
  description = "The Azure region where web resources will be deployed."
}

variable "asp_sku" {
  type        = string
  description = "The pricing tier (SKU) for the App Service Plan."
}

variable "app_name" {
  type        = string
  description = "The name of the Azure Web App."
}

variable "app_dotnet_version" {
  type        = string
  description = "The .NET version for the application stack."
}

variable "sql_connection_string" {
  type        = string
  description = "Connection string for the SQL Database"
  sensitive   = true
}

variable "tags" {
  type = map(string)
}