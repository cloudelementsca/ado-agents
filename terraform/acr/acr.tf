/*
* Create resource group
*/
resource "azurerm_resource_group" "agentrg" {
  name     = var.rg.name
  location = var.rg.location
}

/*
* Create Azure VNET
*/
resource "azurerm_virtual_network" "agentvent" {
  name                = var.vnet.name
  location            = azurerm_resource_group.agentrg.location
  resource_group_name = azurerm_resource_group.agentrg.name
  address_space       = var.vnet.address_space

  subnet {
    name           = var.vnet.subnet.name
    address_prefix = var.vnet.subnet.address_prefix
  }

}


/*
* Create Azure Container Registry
*/
resource "azurerm_container_registry" "acr" {
  name                = var.acr.name
  resource_group_name = azurerm_resource_group.agentrg.name
  location            = azurerm_resource_group.agentrg.location
  sku                 = var.acr.sku
  admin_enabled       = true

  tags = var.tags
}

