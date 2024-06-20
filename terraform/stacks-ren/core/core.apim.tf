# Provider configuration


# Resource Group
resource "azurerm_resource_group" "apim_rg" {
  name     = "apim-resources"
  location = var.location
}

# # API Management Service
# resource "azurerm_api_management" "apim" {
#   name                = "apim-service-rio"
#   resource_group_name = azurerm_resource_group.apim_rg.name
#   location            = azurerm_resource_group.apim_rg.location
#   sku_name            = "Developer_1"
#   publisher_name      = "digital-doc"
#   publisher_email     = "steinpetersen@gmail.com"
# }

# resource "azurerm_api_management_api" "apim_api" {
#   name                = "apim-api-rio"
#   resource_group_name = azurerm_resource_group.apim_rg.name
#   api_management_name = azurerm_api_management.apim.name
#   revision            = "1"
#   display_name        = "API Management API"
#   path                = "apim-api-rio"
#   protocols           = ["https"]
#   import {
#     content_format = "swagger-link-json"
#     content_value  = "https://petstore.swagger.io/v2/swagger.json"
#   }
# }

# resource "azurerm_api_management_api_operation" "apim_api_operation" {
#   operation_id        = "GetPetById"
#   api_name            = azurerm_api_management_api.apim_api.name
#   api_management_name = azurerm_api_management.apim.name
#   resource_group_name = azurerm_resource_group.apim_rg.name
#   display_name        = "Get Pet By Id"
#   method              = "GET"
#   url_template        = "/pet/{petId}"
#   response {
#     status_code = 200
#     description = "Success"
#   }
# }
