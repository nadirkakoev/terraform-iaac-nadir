resource "azurerm_virtual_network" "vnet1" {
  name                = "${var.vnet_name}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.example.name}" //rule of thumb create resource of group first then resources
  address_space       = ["${var.address_space}"]
}
