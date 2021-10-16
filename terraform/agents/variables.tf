variable "resource_groups" {
  description = "Resource Groups"
  type        = map(string)

}

variable "aci_vnet" {
  description = "Virtual network for the ACI"
  type = object({
    name   = string
    rg_key = string
  })
}

/* Subnet for container group */
variable "aci_subnet" {
  description = "Subnet name where ACI group will be created."
  type = object({
    name             = string
    address_prefixes = list(string)
    rg_key           = string
    delegation = object({
      name                    = string
      service_delegation_name = string
      actions                 = list(string)
    })
  })
}

/* Tags */
variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default = {
    Organization = "CloudElements Canada"
    Environment  = "CloudElements Subscription"
    Project      = "Self-Hosted Agents Demo"
  }
}


variable "windowsCg" {
  description = "Container group configurations"
  type = object({
    name            = string
    location        = string
    rgname          = string
    os_type         = string
    ip_address_type = string
    container = object({
      name     = string
      image    = string
      cpu      = number
      memory   = number
      port     = number
      protocol = string
    })
    azure_devops_org_url  = string
    personal_access_token = string
    agent_pool_name       = string

    number_of_agents = number
  })
}

variable "linuxCg" {
  description = "Container group configurations"
  type = object({
    name            = string
    location        = string
    rgname          = string
    os_type         = string
    ip_address_type = string
    container = object({
      name     = string
      image    = string
      cpu      = number
      memory   = number
      port     = number
      protocol = string
    })
    azure_devops_org_url  = string
    personal_access_token = string
    agent_pool_name       = string

    number_of_agents = number
  })
}

variable "acr" {
  description = "container registry"
  type = object({
    name           = string
    resource_group = string
  })
} 