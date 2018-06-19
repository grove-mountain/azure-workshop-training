resource "azurerm_resource_group" "myfirstrg" {
  name     = "${var.resource_group_name}"
  location = "${var.resource_group_location}"

  tags {
    environment = "${var.environment_tag}"
  }
}
