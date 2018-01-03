provider "azurerm" {
  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
}

resource "azurerm_resource_group" "myfirstrg" {
  name     = "${var.resource_group_name}"
  location = "${var.resource_group_location}"

  tags {
    environment = "${var.resource_group_tag}"
  }
}

resource "azurerm_virtual_network" "myfirstvn" {
  name                = "${var.vn_name}"
  address_space       = "${var.vn_address_space}"
  location            = "${var.vn_location}"
  resource_group_name = "${var.resource_group_name}"
}

resource "azurerm_subnet" "myfirstsubnet" {
  name                 = "${var.sb_name}"
  resource_group_name  = "${azurerm_resource_group.myfirstrg.name}"
  virtual_network_name = "${azurerm_virtual_network.myfirstvn.name}"
  address_prefix       = "${var.sb_address_prefix}"
}

output "sb_address_prefix" {
  value = "${azurerm_subnet.myfirstsubnet.address_prefix}"
}
