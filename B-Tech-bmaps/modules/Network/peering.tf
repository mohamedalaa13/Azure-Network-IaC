data "azurerm_resource_group" "BT-RG" {
  name     = "BT-RG"
  provider = azurerm.hub
}

data "azurerm_virtual_network" "bt-vnet-hub" {
  name  = "bt-vnet-hub"
  resource_group_name = "BT-RG"
  provider = azurerm.hub
}

resource "azurerm_virtual_network_peering" "Hub-To-BMAPS-spoke" {
  name                      = "hub-to-BMAPS-prod-spoke"
  resource_group_name       = "BT-RG"
  virtual_network_name      = "bt-vnet-hub"
  remote_virtual_network_id = azurerm_virtual_network.BMAPS-spoke.id
  allow_virtual_network_access = true
  allow_forwarded_traffic = true
  provider = azurerm.hub
}

resource "azurerm_virtual_network_peering" "BMAPs-To-Hub" {
  name                      = "BMAPS-spoke-prod-to-hub"
  resource_group_name       = azurerm_resource_group.BMAPS-Network.name
  virtual_network_name      = azurerm_virtual_network.BMAPS-spoke.name
  remote_virtual_network_id = data.azurerm_virtual_network.bt-vnet-hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic = true
}