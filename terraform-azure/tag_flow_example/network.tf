resource "azurerm_virtual_network" "myfirstvn" {
	name                = "${var.student}-VN"
	address_space       = "${var.vn_address_space}"
	location            = "${var.vn_location}"
	resource_group_name = "${azurerm_resource_group.myfirstrg.name}"
}

resource "azurerm_subnet" "myterraformsubnet" {
  name                 = "${var.student}-Subnet"
  resource_group_name  = "${azurerm_resource_group.myfirstrg.name}"
  virtual_network_name = "${azurerm_virtual_network.myfirstvn.name}"
  address_prefix       = "10.0.1.0/24"
}

# Create public IPs
resource "azurerm_public_ip" "myterraformpublicip" {
  name                         = "${var.student}-myPublicIP"
  location                     = "${var.resource_group_location}"
  resource_group_name          = "${azurerm_resource_group.myfirstrg.name}"
  public_ip_address_allocation = "dynamic"

  tags {
    environment = "${var.environment_tag}"
    ttl         = "${var.ttl_tag}"
    owner       = "${var.owner_tag}"
  }
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "myterraformnsg" {
  name                = "${var.student}-myNetworkSecurityGroup"
  location            = "${var.resource_group_location}"
  resource_group_name = "${azurerm_resource_group.myfirstrg.name}"

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags {
    environment = "${var.environment_tag}"
    ttl         = "${var.ttl_tag}"
    owner       = "${var.owner_tag}"
  }
}

# Create network interface
resource "azurerm_network_interface" "myterraformnic" {
  name                      = "${var.student}-myNIC"
  location                  = "${var.resource_group_location}"
  resource_group_name       = "${azurerm_resource_group.myfirstrg.name}"
  network_security_group_id = "${azurerm_network_security_group.myterraformnsg.id}"

  ip_configuration {
    name                          = "${var.student}-myNicConfiguration"
    subnet_id                     = "${azurerm_subnet.myterraformsubnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.myterraformpublicip.id}"
  }

  tags {
    environment = "${var.environment_tag}"
    ttl         = "${var.ttl_tag}"
    owner       = "${var.owner_tag}"
  }
}

output "vn_address_space" {
	value = "${azurerm_virtual_network.myfirstvn.address_space}"
}
