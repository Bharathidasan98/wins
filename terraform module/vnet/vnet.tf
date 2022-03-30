
resource "azurerm_virtual_network" "rg1" {
  name                = var.vnet_name
  resource_group_name = var.res_group
  location            = var.res_group_loc
  address_space       = ["10.0.0.0/16"]
}
resource "azurerm_public_ip" "pip1" {
  name                = var.pupip
  resource_group_name = var.res_group
  location            = var.res_group_loc
  allocation_method   = "Static"
}
resource "azurerm_subnet" "rg2" {
  name                 = var.subnetv
  resource_group_name  = var.res_group
  virtual_network_name = var.vnet_name
  address_prefixes     = ["10.0.1.0/24"]
}
resource "azurerm_network_security_group" "nsg" {
  name                = "web-nsg"
  resource_group_name = var.res_group
  location            = var.res_group_loc

  security_rule {
    name                       = "Allow_SSH"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges     = ["22", "80"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }
}
resource "azurerm_subnet_network_security_group_association" "subnet-nsg" {
    subnet_id                    = azurerm_subnet.rg2.id
    network_security_group_id    = azurerm_network_security_group.nsg.id
}
resource "azurerm_network_interface" "nic" {
  name                = var.vm_nic
  location            = var.res_group_loc
  resource_group_name = var.res_group

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     =  azurerm_subnet.rg2.id
    public_ip_address_id          =  azurerm_public_ip.pip1.id
    private_ip_address_allocation = "Dynamic"
  }
}
output "nic_id" {
  value = azurerm_network_interface.nic.id
}