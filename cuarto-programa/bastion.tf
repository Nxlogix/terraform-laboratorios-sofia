resource "azurerm_public_ip" "bastion_ip" {
  name                = "bastion-public-ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_lz_prod.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion" {
  name                = "bastion-host"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_lz_prod.name

  ip_configuration {
    name                 = "bastion-ipconfig"
    subnet_id            = azurerm_subnet.bastion_subnet.id
    public_ip_address_id = azurerm_public_ip.bastion_ip.id
  }
}
