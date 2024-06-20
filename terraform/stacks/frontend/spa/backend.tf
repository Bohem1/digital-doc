/* This is the spa configuration. Part of spa module, originaly created 6/16/2024 11:31:36 PM */
terraform {
  backend "azurerm" {
    resource_group_name  = "core-build-resources"
    storage_account_name = "corebuild9834059"
    container_name       = "stackstfstate"
    key                  = "frontend/spa.tfstate"
  }
}
