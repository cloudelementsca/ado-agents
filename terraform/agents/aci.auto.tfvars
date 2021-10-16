/*
  Self-hosted Agent Configurations
*/

/*
  ACI Container Group Subnet 
*/
aci_subnet = {
  name             = "AgentContainerSubnet"
  address_prefixes = ["192.168.1.160/27"]
  rg_key           = "agentrg"
  delegation = {
    name                    = "aci-delegation"
    service_delegation_name = "Microsoft.ContainerInstance/containerGroups"
    actions                 = ["Microsoft.Network/virtualNetworks/subnets/action"]
  }
}

/*
  Container Group Configurations
*/
windowsCg = {
  name            = "winagent-co"
  location        = "canadacentral"
  rgname          = "SelfHostedAgentRg"
  os_type         = "Windows"
  ip_address_type = "Public"
  container = {
    name     = "winagent"
    image    = "cloudelementsacr.azurecr.io/winagent:latest"
    cpu      = 1
    memory   = 4
    port     = 443
    protocol = "TCP"
  }
  azure_devops_org_url  = "__AZP_URL__"
  personal_access_token = "__PERSONAL_ACCESS_TOKEN__"
  agent_pool_name       = "__AZP_POOL__"
  number_of_agents      = __NUMBER_OF_WINDOWS_AGENT__
}


# linux agents container group
linuxCg = {
  name            = "linuxagent-co"
  location        = "canadacentral"
  rgname          = "SelfHostedAgentRg"
  os_type         = "Linux"
  ip_address_type = "Public"
  container = {
    name     = "linuxagent"
    image    = "cloudelementsacr.azurecr.io/linuxagent:latest"
    cpu      = 1
    memory   = 4
    port     = 443
    protocol = "TCP"
  }
  azure_devops_org_url  = "__AZP_URL__"
  personal_access_token = "__PERSONAL_ACCESS_TOKEN__"
  agent_pool_name       = "__AZP_POOL__"
  number_of_agents = __NUMBER_OF_LINUX_AGENT__
}

