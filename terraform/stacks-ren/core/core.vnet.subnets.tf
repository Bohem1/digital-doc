# Define the Azure subnets
resource "azurerm_subnet" "backend_1" {
  name                 = "backend-1-subnet"
  resource_group_name  = azurerm_resource_group.core.name
  virtual_network_name = azurerm_virtual_network.core.name
  address_prefixes     = ["10.0.0.0/26"]
}

resource "azurerm_subnet" "backend_2" {
  name                 = "backend-2-subnet"
  resource_group_name  = azurerm_resource_group.core.name
  virtual_network_name = azurerm_virtual_network.core.name
  address_prefixes     = ["10.0.0.64/26"]
}

resource "azurerm_subnet" "frontend" {
  name                 = "fronted-spa-subnet"
  resource_group_name  = azurerm_resource_group.core.name
  virtual_network_name = azurerm_virtual_network.core.name
  address_prefixes     = ["10.0.0.128/26"]
}


resource "azurerm_subnet" "pe" {
  name                 = "pe-subnet"
  resource_group_name  = azurerm_resource_group.core.name
  virtual_network_name = azurerm_virtual_network.core.name
  address_prefixes     = ["10.0.0.192/26"]
}

resource "azurerm_subnet" "containerapps" {
  name                 = "containerapps-subnet"
  resource_group_name  = azurerm_resource_group.core.name
  virtual_network_name = azurerm_virtual_network.core.name
  address_prefixes     = ["10.0.8.0/21"]

  delegation {
    name = "delegation"

    service_delegation {
      name = "Microsoft.App/environments"
    }

  }
}
