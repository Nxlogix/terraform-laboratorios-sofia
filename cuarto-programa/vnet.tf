resource "azurerm_virtual_network" "vnet_lz_prod" {
  name                = "vnet-lz-prod"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_lz_prod.name
}

resource "azurerm_subnet" "snet_vm" {
  name                 = "snet-vm"
  resource_group_name  = azurerm_resource_group.rg_lz_prod.name
  virtual_network_name = azurerm_virtual_network.vnet_lz_prod.name
  address_prefixes     = ["10.0.3.0/24"]
}

resource "azurerm_subnet" "snet_db" {
  name                 = "snet-db"
  resource_group_name  = azurerm_resource_group.rg_lz_prod.name
  virtual_network_name = azurerm_virtual_network.vnet_lz_prod.name
  address_prefixes     = ["10.0.2.0/24"]

  delegation {
    name = "postgres-flexible-server"
    service_delegation {
      name    = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}

resource "azurerm_subnet" "bastion_subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.rg_lz_prod.name
  virtual_network_name = azurerm_virtual_network.vnet_lz_prod.name
  address_prefixes     = ["10.0.5.0/24"]
}
