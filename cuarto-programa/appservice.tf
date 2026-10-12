resource "azurerm_service_plan" "app_plan" {
  name                = "appservice-linux-plan"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_lz_prod.name
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "app_service" {
  name                = "appservice-linux-sofia01"   # 👈 deja este o inventa otro único
  location            = "centralus"
  resource_group_name = azurerm_resource_group.rg_lz_prod.name
  service_plan_id     = azurerm_service_plan.app_plan.id

  site_config {
    always_on = false
    application_stack {
      node_version = "18-lts"
    }
  }
}
