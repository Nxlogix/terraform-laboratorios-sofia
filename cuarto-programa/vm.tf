resource "azurerm_network_interface" "vm_nic_sofia01" {
  name                = "vm-nic-sofia01"
  location            = "centralus"   # 👈 igual que la VNet/Subnet
  resource_group_name = azurerm_resource_group.rg_lz_prod.name

  ip_configuration {
    name                          = "vm-ipconfig"
    subnet_id                     = azurerm_subnet.snet_vm.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm_worker" {
  name                = "vm-worker"
  resource_group_name = azurerm_resource_group.rg_lz_prod.name
  location            = "centralus"   # 👈 misma región
  size                = "Standard_B1ms"
  admin_username      = "azureuser"
  network_interface_ids = [azurerm_network_interface.vm_nic_sofia01.id
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("C:/Users/sofia/.ssh/vm_worker_key.pub")
  }

  os_disk {
    name                 = "vm-worker-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}
