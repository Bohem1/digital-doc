/* This is the core configuration. Part of core module, originaly created 6/16/2024 11:26:45 PM */
terraform {
  backend "azurerm" {
    resource_group_name  = "core-build-resources"
    storage_account_name = "corebuild9834059"
    container_name       = "coretfstate"
    key                  = "core.tfstate"
  }
}
