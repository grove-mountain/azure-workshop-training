resource "azurerm_virtual_network" "myfirstvn" {
	name                = "${var.student}-VN"
	address_space       = "${var.vn_address_space}"
	location            = "${var.vn_location}"
	resource_group_name = "${azurerm_resource_group.myfirstrg.name}"
}

output "vn_address_space" {
    value = "${azurerm_virtual_network.myfirstvn.address_space}"
}
