resource "azurerm_storage_account" "storage" {
  name                     = "storagelzprod"
  resource_group_name      = azurerm_resource_group.rg_lz_prod.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
