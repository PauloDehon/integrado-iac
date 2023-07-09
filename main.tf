provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg_integrado"
  location = "West Europe"
}

resource "azurerm_service_plan" "sp" {
  name                = "sp_integrado"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "lwafront" {
  name                = "lwa-frontend-integrado"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.sp.location
  service_plan_id     = azurerm_service_plan.sp.id

  site_config {}
}

resource "azurerm_linux_web_app" "lwaback" {
  name                = "lwa-backend-integrado"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.sp.location
  service_plan_id     = azurerm_service_plan.sp.id

  site_config {}
}