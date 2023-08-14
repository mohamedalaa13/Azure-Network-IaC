terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.49.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "rg-terraform"
      storage_account_name = "saterraformbmaps"
      container_name       = "tf-state"
      key                  = "terraform.tfstate"
  }
}

 
provider "azurerm" {
    features {}
    
}

provider "azurerm" {
  features {}
  tenant_id = "58191332-4582-42f1-a685-f77f77def707"
  subscription_id = "9e8b04cf-38c5-4cc8-8d1d-17dd0421ce5a"
  alias = "hub"
}


module "network" {
      source              = "./modules/Network"
      location = var.location
      resource_group_name = var.resource_group_name
      virtual_network_address_space = var.virtual_network_address_space
      App_subnet_name = var.App_subnet_name
      App_subnet_address_space = var.App_subnet_address_space
      DB_subnet_name = var.DB_subnet_name
      DB_subnet_address_space = var.DB_subnet_address_space
      tags = var.tags
      dns_servers = var.dns_servers


    }

