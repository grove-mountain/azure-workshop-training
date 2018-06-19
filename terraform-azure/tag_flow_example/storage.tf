# Create storage account for boot diagnostics

# Generate random text for a unique storage account name
resource "random_id" "randomId" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = "${azurerm_resource_group.myfirstrg.name}"
  }

  byte_length = 8
}

resource "azurerm_storage_account" "mystorageaccount" {
  name                     = "diag${random_id.randomId.hex}"
  resource_group_name      = "${azurerm_resource_group.myfirstrg.name}"
  location                 = "${var.resource_group_location}"
  account_replication_type = "LRS"
  account_tier             = "Standard"

  tags {
    environment = "${var.environment_tag}"
    ttl         = "${var.ttl_tag}"
    owner       = "${var.owner_tag}"
  }
}
