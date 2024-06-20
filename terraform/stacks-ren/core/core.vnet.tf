
resource "azurerm_virtual_network" "core" {
  name                = "core-vnet"
  location            = azurerm_resource_group.core.location
  resource_group_name = azurerm_resource_group.core.name
  address_space       = ["10.0.0.0/20"]
}
