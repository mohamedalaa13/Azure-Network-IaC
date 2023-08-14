resource "azurerm_route_table" "rt-App" {
  name                = "rt-APP"
  location            = var.location
  resource_group_name = azurerm_resource_group.BMAPS-Network.name
  route {
    name                   = "default"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.5.201.4"
  }
  route {
    name                   = "to-hub"
    address_prefix         = "10.5.200.0/22"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.5.201.4"
  }
}

resource "azurerm_subnet_route_table_association" "rt-APP" {
  subnet_id      = azurerm_subnet.App-Subnet.id
  route_table_id = azurerm_route_table.rt-App.id
}

resource "azurerm_route_table" "rt-DB" {
  name                = "rt-DB"
  location            = var.location
  resource_group_name = azurerm_resource_group.BMAPS-Network.name
  route {
    name                   = "default"
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.5.201.4"
  }
  route {
    name                   = "to-hub"
    address_prefix         = "10.5.200.0/22"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.5.201.4"
  }
}

resource "azurerm_subnet_route_table_association" "rt-DB" {
  subnet_id      = azurerm_subnet.DB-Subnet.id
  route_table_id = azurerm_route_table.rt-DB.id
}
