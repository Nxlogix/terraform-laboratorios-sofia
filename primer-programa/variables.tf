variable "length" {
  description = "Length of the random string."
  type        = number 
  default     = 5
}

variable "application_name" {
  description = "Name of the application."
  type        = string
  default     = "integradora"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"
}

variable "enable_monitoring" {
  description = "Habilitar o deshabilitar el monitoreo"
  type        = bool
  default     = true
}

variable "regions" {
  description = "Lista de regiones donde se desplegara la infraestructura"
  type        = list(string)
  default     = ["us-east-1", "us-west-2"]
}

variable "environment_tags" {
  description = "Etiquetas para el entorno"
  type        = map(string)
  default     = {
    dev  = "Development"
    prod = "productos"
  }
}

variable "aplication_config" {
  description = "Configuración de la aplicación"
  type        = object({
    version      = string
    maintainer   = string
    dependencias = list(string)
  })
  default = {
    version      = "1.0.0"
    maintainer   = "Sofia"
    dependencias = ["dependency1", "dependency2"]
  }
}

variable "allowed_networks" {
  description = "Redes permitidas para acceder a la aplicación"
  type        = set(string)
  default     = ["33.33.33.33/32"]
}
