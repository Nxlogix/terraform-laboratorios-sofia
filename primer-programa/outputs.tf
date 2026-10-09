# outputs.tf

output "application_name" {
  value = random_string.suffix.result
}

output "unique_name" {
  value = local.unique_name
}

# Nuevos outputs de las variables

output "length_output" {
  description = "Valor de la variable length"
  value       = var.length
}

output "environment_output" {
  description = "Entorno de despliegue"
  value       = var.environment
}

output "enable_monitoring_output" {
  description = "Estado del monitoreo"
  value       = var.enable_monitoring
}

output "regions_output" {
  description = "Regiones donde se desplegará la infraestructura"
  value       = var.regions
}

output "environment_tags_output" {
  description = "Etiquetas del entorno"
  value       = var.environment_tags
}

output "application_config_output" {
  description = "Configuración de la aplicación"
  value       = var.aplication_config
}

output "allowed_networks_output" {
  description = "Redes permitidas para acceder a la aplicación"
  value       = var.allowed_networks
}
