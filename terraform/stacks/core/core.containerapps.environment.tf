
resource "azurerm_log_analytics_workspace" "core" {
  name                = "core-containerapps-law"
  location            = azurerm_resource_group.containerapps.location
  resource_group_name = azurerm_resource_group.containerapps.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# Container Apps environment
resource "azurerm_container_app_environment" "containerapps_env" {
  name                = "rio-environmet"
  location            = azurerm_resource_group.containerapps.location
  resource_group_name = azurerm_resource_group.containerapps.name

  log_analytics_workspace_id     = azurerm_log_analytics_workspace.core.id
  internal_load_balancer_enabled = false
  infrastructure_subnet_id       = azurerm_subnet.containerapps.id

  workload_profile {
    name                  = "Consumption"
    workload_profile_type = "Consumption"
    maximum_count         = 2
    minimum_count         = 1

  }

}

# Output
output "containerapps_environment_id" {
  value = azurerm_container_app_environment.containerapps_env.id
}
