terraform {
  required_providers {
    # api ={
    #   source = "Azure/azapi"
    # }
    azurerm = {
      source = "hashicorp/azurerm"
      version ="3.104.0"
    }
  }
}

provider "azurerm" {

  features {
  }
}

