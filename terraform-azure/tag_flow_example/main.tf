# Create a resource group if it doesn’t exist
resource "azurerm_resource_group" "myfirstrg" {
  name     = "${var.student}-ResourceGroup"
  location = "${var.resource_group_location}"

  tags {
    environment = "${var.environment_tag}"
    ttl         = "${var.ttl_tag}"
    owner       = "${var.owner_tag}"
  }
}
