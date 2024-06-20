/* This is the core configuration. Part of core module, originaly created 6/16/2024 11:26:45 PM */
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.108.0"
    }
  }
}


provider "azurerm" {
  features {}
}
