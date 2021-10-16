data "azurerm_resource_group" "rgs" {
  for_each = var.resource_groups

  name = each.value
}

/* vnet */
data "azurerm_virtual_network" "vnet" {
  name                = var.aci_vnet.name
  resource_group_name = data.azurerm_resource_group.rgs[var.aci_vnet.rg_key].name
}

data "azurerm_container_registry" "acr" {
  name                = var.acr.name
  resource_group_name = var.acr.resource_group
}