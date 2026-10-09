variable "subscription_id" {
  description = "The Azure subscription ID."
  type        = string
  sensitive   = true
}

variable "service_plan_sku_name" {
  type    = string
  default = "F1"
}

variable "application_type" {
  type    = string
  default = "web"
}

variable "node_version" {
  type    = string
  default = "24-lts"
}

variable "log_analytics_sku" {
  type    = string
  default = "PerGB2018"
}

variable "web_app_name" {
  type    = string
  default = "app-utvt-integradora-web-qa-mxc-001"
}
