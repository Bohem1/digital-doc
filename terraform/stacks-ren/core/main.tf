/* This is the core configuration. Part of core module, originaly created 6/16/2024 11:26:45 PM */

resource "azurerm_resource_group" "core" {
  name     = "core-resources"
  location = var.location
}
