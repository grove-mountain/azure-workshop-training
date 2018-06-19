# Create virtual machine
resource "azurerm_virtual_machine" "myterraformvm" {
  name                  = "${var.student}-VM"
  location              = "${var.resource_group_location}"
  resource_group_name   = "${azurerm_resource_group.myfirstrg.name}"
  network_interface_ids = ["${azurerm_network_interface.myterraformnic.id}"]
  vm_size               = "Standard_D1_v2"

  storage_os_disk {
    name              = "myOsDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04.0-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "${var.student}-VM"
    admin_username = "azureuser"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/azureuser/.ssh/authorized_keys"
      key_data = "${var.ssh_public_key}"
    }
  }

  boot_diagnostics {
    enabled     = "true"
    storage_uri = "${azurerm_storage_account.mystorageaccount.primary_blob_endpoint}"
  }

  tags {
    environment = "${var.environment_tag}"
    ttl         = "${var.ttl_tag}"
    owner       = "${var.owner_tag}"
  }
}
