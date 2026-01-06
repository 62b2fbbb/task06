output "app_hostname" {
  value       = azurerm_linux_web_app.linuxwebapp.default_hostname
  description = "The default hostname of the created Linux Web Application."
}