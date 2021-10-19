data "azurerm_resource_group" "rgs" {
  for_each = var.resource_groups

  name = each.value
}

data "azurerm_container_registry" "acr" {
  name                = var.acr.name
  resource_group_name = var.acr.resource_group
}