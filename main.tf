
resource "azurerm_resource_group" "azure_gp" {
  name     = var.resource_group_name
  location = var.locations
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = var.virtual_network_name
  address_space       = var.ip_add
  location            = var.locations
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.azure_gp.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = var.subnet_ip

}

resource "azurerm_network_interface" "network_interface" {
  name                = var.interface_name
  location            = var.locations
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ip_configuration
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
}

resource "azurerm_linux_virtual_machine" "example_vm" {
  name = var.vm_name
  #count               = 3
  resource_group_name   = var.resource_group_name
  location              = var.locations
  size                  = var.sizes
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = [azurerm_network_interface.network_interface.id]

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.versions
  }

  os_disk {
    #caching = "ReadWrite"
    #storage_account_type = "Standard_LRS"
    caching              = var.caching
    storage_account_type = var.storage_account_type
  }


}
