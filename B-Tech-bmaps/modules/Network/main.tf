terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.49.0"
    }
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

resource "azurerm_resource_group" "BMAPS-Network" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_virtual_network" "BMAPS-spoke" {
  name                ="vnet-BMAPS-prod-spoke"
  address_space       = var.virtual_network_address_space
  location            = var.location
  resource_group_name = azurerm_resource_group.BMAPS-Network.name
  dns_servers         = var.dns_servers
  tags = var.tags
}

resource "azurerm_subnet" "App-Subnet" {
  name                              = var.App_subnet_name
  resource_group_name               = var.resource_group_name
  virtual_network_name              = azurerm_virtual_network.BMAPS-spoke.name
  address_prefixes                  = var.App_subnet_address_space
}

resource "azurerm_subnet" "DB-Subnet" {
  name                              = var.DB_subnet_name
  resource_group_name               = var.resource_group_name
  virtual_network_name              = azurerm_virtual_network.BMAPS-spoke.name
  address_prefixes                  = var.DB_subnet_address_space
}