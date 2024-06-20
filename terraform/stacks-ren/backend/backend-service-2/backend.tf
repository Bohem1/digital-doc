/* This is the backend-service-2 configuration. Part of backend-service-2 module, originaly created 6/16/2024 11:29:34 PM */
terraform {
  backend "azurerm" {
    resource_group_name  = "core-build-resources"
    storage_account_name = "corebuild9834059"
    container_name       = "stackstfstate"
    key                  = "backend-service-2/terraform.tfstate"
  }
}
