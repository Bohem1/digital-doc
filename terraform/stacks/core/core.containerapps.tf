
resource "azurerm_resource_group" "containerapps" {
  name     = "containerapps-resources"
  location = var.location
}

resource "azurerm_container_app" "backend_1" {
  name                         = "backend-service-1"
  container_app_environment_id = azurerm_container_app_environment.containerapps_env.id
  resource_group_name          = azurerm_resource_group.containerapps.name
  revision_mode                = "Multiple"

  template {

    container {
      name   = "backend"
      image  = "mcr.microsoft.com/azuredocs/aci-helloworld"
      cpu    = 0.25
      memory = "0.5Gi"
    }

    container {
      name   = "database"
      image  = "mcr.microsoft.com/azuredocs/aci-helloworld"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
}

resource "azurerm_container_app" "backend_2" {
  name                         = "backend-service-2"
  container_app_environment_id = azurerm_container_app_environment.containerapps_env.id
  resource_group_name          = azurerm_resource_group.containerapps.name
  revision_mode                = "Multiple"

  template {

    container {
      name   = "backend"
      image  = "mcr.microsoft.com/azuredocs/aci-helloworld"
      cpu    = 0.25
      memory = "0.5Gi"
    }

    container {
      name   = "database"
      image  = "mcr.microsoft.com/azuredocs/aci-helloworld"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
}

resource "azurerm_container_app" "frontend_spa" {
  name                         = "frontend-spa"
  container_app_environment_id = azurerm_container_app_environment.containerapps_env.id
  resource_group_name          = azurerm_resource_group.containerapps.name
  revision_mode                = "Multiple"

  template {

    container {
      name   = "frontend-spa"
      image  = "mcr.microsoft.com/azuredocs/aci-helloworld"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }

}
