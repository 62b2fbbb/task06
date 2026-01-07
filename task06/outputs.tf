output "sql_server_fqdn" {
  value       = module.SQLserver.sql_server_fqdn
  description = "The Fully Qualified Domain Name (FQDN) of the Azure SQL Server."

}

output "app_hostname" {
  value       = module.webapp.app_hostname
  description = "The default hostname of the created Linux Web Application."

}