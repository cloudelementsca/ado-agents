/*  Resource Group */
variable "rg" {
  description = "Resource Group"
  type = object({
    name     = string
    location = string
  })
}

variable "acr" {
  description = "Azure Container Registry settings"
  type = object({
    name = string
    sku  = string
  })
  default = {
    name           = "CsExampleContainerRegistry"
    sku            = "standard"
    resource_group = "CsExampleRg"
  }
}

/* Tags */
variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default = {
    Organization = "CloudElements Canada"
    Environment  = "CloudElements Subscription"
    Project      = "Self-Hosted Agent Demo"
  }
}
