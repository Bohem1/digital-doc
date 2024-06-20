resource "azurerm_resource_group" "acr_rg" {
  name     = "container-resources"
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name                = "projectrioregistry"
  resource_group_name = azurerm_resource_group.acr_rg.name
  location            = azurerm_resource_group.acr_rg.location
  sku                 = "Basic"
  admin_enabled       = false
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}
