variable "location" {
  type        = string
  description = "The Azure region where all resources will be deployed (e.g., westeurope)."
}

variable "student_email" {
  type        = string
  description = "The student email address used for tagging resources."
}

variable "rg_name" {
  type        = string
  description = "The name of the Azure Resource Group to be created."
}

variable "kv_rg_name" {
  type        = string
  description = "The name of the Resource Group containing the existing Key Vault."
}

variable "kv_name" {
  type        = string
  description = "The name of the existing Key Vault used to store SQL secrets."
}

variable "sql_admin_secret_name" {
  type        = string
  description = "The name of the Key Vault secret that stores the SQL admin username."
}

variable "sql_admin_secret_password" {
  type        = string
  description = "The name of the Key Vault secret that stores the SQL admin password."
}

variable "sql_server_name" {
  type        = string
  description = "The name of the Azure SQL Server instance."
}

variable "sql_db_name" {
  type        = string
  description = "The name of the Azure SQL Database."
}

variable "sql_sku" {
  type        = string
  description = "The SKU (pricing tier) for the SQL Database (e.g., Basic, S0)."
}

variable "sql_fwr_name" {
  type        = string
  description = "The name of the SQL Server Firewall Rule."
}

variable "asp_name" {
  type        = string
  description = "The name of the Azure App Service Plan."
}

variable "asp_sku" {
  type        = string
  description = "The SKU (pricing tier) for the App Service Plan (e.g., F1, B1)."
}

variable "app_name" {
  type        = string
  description = "The name of the Linux Web Application."
}

variable "app_dotnet_version" {
  type        = string
  description = "The version of the .NET stack to be used in the Web App (e.g., 6.0)."
}

variable "allowed_ip_address" {
  type        = string
  description = "The public IP address allowed to access the SQL Server through the firewall."
}

variable "tags" {
  type        = map(string)
  description = "Tags for resources"
  default = {
    CreatedBy   = "zakhar@example.com"
    Environment = "Lab"
  }
}