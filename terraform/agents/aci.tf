/*
* Create new subnet for container group
*/
resource "azurerm_subnet" "containergroupsubnet" {
  name                 = var.aci_subnet.name
  resource_group_name  = data.azurerm_resource_group.rgs[var.aci_subnet.rg_key].name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  address_prefixes     = var.aci_subnet.address_prefixes

  delegation {
    name = var.aci_subnet.delegation.name

    service_delegation {
      name    = var.aci_subnet.delegation.service_delegation_name
      actions = var.aci_subnet.delegation.actions
    }
  }
}

/*
  Container Instance
*/
resource "azurerm_container_group" "windows-container-group" {
  # using count to loop and create specified number of windows agent
  count = var.windowsCg.number_of_agents

  name                = "${var.windowsCg.name}-${count.index}"
  location            = var.windowsCg.location
  resource_group_name = var.windowsCg.rgname

  # when network_profile_id is used, remove dns_name_label
  # dns_name_label      = var.dnsnamelabel
  os_type = var.windowsCg.os_type

  # Note: ip_address_type needs to be private to work
  # with network_profile_id
  ip_address_type = var.windowsCg.ip_address_type

  image_registry_credential {
    username = data.azurerm_container_registry.acr.admin_username
    password = data.azurerm_container_registry.acr.admin_password
    server   = data.azurerm_container_registry.acr.login_server
  }

  container {
    name   = "${var.windowsCg.container.name}-${count.index}"
    image  = var.windowsCg.container.image
    cpu    = var.windowsCg.container.cpu
    memory = var.windowsCg.container.memory

    ports {
      port     = var.windowsCg.container.port
      protocol = var.windowsCg.container.protocol
    }

    # using secure env variables to ensure PAT token is not displayed
    # as plain text
    secure_environment_variables = {
      "AZP_URL"        = var.windowsCg.azure_devops_org_url
      "AZP_TOKEN"      = var.windowsCg.personal_access_token
      "AZP_AGENT_NAME" = "${var.windowsCg.name}-${count.index}"
      "AZP_POOL"       = var.windowsCg.agent_pool_name
    }

  }

  depends_on = [
    azurerm_subnet.containergroupsubnet
  ]

  tags = var.tags
}


resource "azurerm_container_group" "linux-container-group" {
  # using count to loop and create specified number of windows agent
  count = var.linuxCg.number_of_agents

  name                = "${var.linuxCg.name}-${count.index}"
  location            = var.linuxCg.location
  resource_group_name = var.linuxCg.rgname

  # when network_profile_id is used, remove dns_name_label
  # dns_name_label      = var.dnsnamelabel
  os_type = var.linuxCg.os_type

  # Note: ip_address_type needs to be private to work
  # with network_profile_id
  ip_address_type = var.linuxCg.ip_address_type

  image_registry_credential {
    username = data.azurerm_container_registry.acr.admin_username
    password = data.azurerm_container_registry.acr.admin_password
    server   = data.azurerm_container_registry.acr.login_server
  }

  container {
    name   = "${var.linuxCg.container.name}-${count.index}"
    image  = var.linuxCg.container.image
    cpu    = var.linuxCg.container.cpu
    memory = var.linuxCg.container.memory

    ports {
      port     = var.linuxCg.container.port
      protocol = var.linuxCg.container.protocol
    }

    # using secure env variables to ensure PAT token is not displayed
    # as plain text
    secure_environment_variables = {
      "AZP_URL"        = var.linuxCg.azure_devops_org_url
      "AZP_TOKEN"      = var.linuxCg.personal_access_token
      "AZP_AGENT_NAME" = "${var.linuxCg.name}-${count.index}"
      "AZP_POOL"       = var.linuxCg.agent_pool_name
    }

  }

  depends_on = [
    azurerm_subnet.containergroupsubnet
  ]

  tags = var.tags
}