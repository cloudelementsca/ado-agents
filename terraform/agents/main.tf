/**
*
* ## Description
* This module creates Self-hosted agent pool in the Azure DevOps project. Running the custom agents from your Azure Container Registry.
* ### Original Authors
* Jack Wen, Nicholas Briglio
*
*/

/* Setup terraform backend*/
terraform {
  backend "azurerm" {
    resource_group_name  = "__terraformstoragerg__"
    storage_account_name = "__terraformstorageaccount__"
    container_name       = "__terraformstoragecontainername__"
    key                  = "__terraformstatename__"
    access_key           = "__storagekey__"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "> 2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
}




