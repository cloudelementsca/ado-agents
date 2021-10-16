/*
* Resource Gruop
*/
rg = {
  name     = "SelfHostedAgentRg"
  location = "canadacentral"
}

/*
* VNET
*/
vnet = {
  name          = "agentvnet"
  address_space = ["192.168.1.0/24"]

  subnet = {
    name           = "agentsubnet"
    address_prefix = "192.168.1.0/25"
  }
}

/*
  Azure Container Registry
*/
acr = {
  name = "cloudelementsacr"
  sku  = "Standard"
}



