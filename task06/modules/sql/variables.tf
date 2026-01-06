variable "name" {
  type        = string
  description = "The name of the SQL Server instance (passed from root)."
}

variable "rg_name" {
  type        = string
  description = "The name of the Resource Group for SQL resources."
}

variable "rg_loc" {
  type        = string
  description = "The Azure region where SQL resources will be deployed."
}

variable "sql_admin_secret_name" {
  type        = string
  description = "The name of the Key Vault secret for the SQL admin username."
}

variable "sql_admin_secret_password" {
  type        = string
  description = "The name of the Key Vault secret for the SQL admin password."
}

variable "sql_server_name" {
  type        = string
  description = "The unique name of the SQL Server."
}

variable "sql_db_name" {
  type        = string
  description = "The name of the SQL Database."
}

variable "sql_sku" {
  type        = string
  description = "The service objective (SKU) for the SQL Database."
}

variable "sql_fwr_name" {
  type        = string
  description = "The name of the firewall rule for SQL access."
}

variable "kv_rg_name" {
  type        = string
  description = "The Resource Group name of the existing Key Vault."
}

variable "kv_name" {
  type        = string
  description = "The name of the existing Key Vault used for secret storage."
}

variable "allowed_ip_address" {
  type        = string
  description = "The client IP address allowed to connect to the SQL Server."
}