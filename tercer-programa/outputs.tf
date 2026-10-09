output "resource_group_name" {
  value = azurerm_resource_group.qa.name
}

output "web_app_url" {
  value = azurerm_linux_web_app.qa.default_hostname
}

output "application_insights_key" {
  value     = azurerm_application_insights.qa.instrumentation_key
  sensitive = true
}
