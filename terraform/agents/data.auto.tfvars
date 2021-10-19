/*
 Resource Group 
*/
resource_groups = {
  "agentrg" = "SelfHostedAgentRg"
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

