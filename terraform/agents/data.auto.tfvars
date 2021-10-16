/*
 Resource Group 
*/
resource_groups = {
  "agentrg" = "SelfHostedAgentRg"
}


/*
  ACI VNET where container subnet located
*/
aci_vnet = {
  name   = "agentvnet"
  rg_key = "agentrg"
}

/*
  Tags
*/
tags = {
  Organization = "CloudElements Canada"
  Environment  = "CloudElements Subscription"
  Project      = "Self-hosted Agent Demo"
}

/*
  Azure Container Registry
*/
acr = {
  name           = "cloudelementsacr"
  resource_group = "SelfHostedAgentRg"
}

