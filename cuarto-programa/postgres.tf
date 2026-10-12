resource "azurerm_postgresql_flexible_server" "postgres" {
  name                          = "postgres-flexible-sofia01"
  resource_group_name           = azurerm_resource_group.rg_lz_prod.name
  location                      = var.location
  sku_name                      = "B_Standard_B1ms"
  storage_mb                    = 32768
  administrator_login           = "adminuser"
  administrator_password        = var.db_password
  public_network_access_enabled = true
  version                       = "13"

  # ⚠️ Quitamos high_availability porque no acepta "Disabled"
  # Solo definimos la zona
  zone = "1"
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "client_ip" {
  name             = "client-ip"
  server_id        = azurerm_postgresql_flexible_server.postgres.id
  start_ip_address = var.postgres_allowed_ip
  end_ip_address   = var.postgres_allowed_ip
}
