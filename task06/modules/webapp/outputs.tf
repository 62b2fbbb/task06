output "app_hostname" {
  value       = azurerm_linux_web_app.app.default_hostname
  description = "The default hostname of the created Linux Web Application."
}