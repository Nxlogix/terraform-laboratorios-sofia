variable "resource_group_name" {
  default = "rg-lz-prod"
}

variable "location" {
  default = "centralus"
}

variable "db_password" {
  description = "Contraseña del servidor PostgreSQL"
  sensitive   = true
}

variable "postgres_allowed_ip" {
  description = "IP permitida para acceder a PostgreSQL"
  default     = "189.203.45.67"
}


