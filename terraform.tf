terraform {
  cloud {
    organization = "robstr"

    workspaces {
      name = "terraform-workshop"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}
