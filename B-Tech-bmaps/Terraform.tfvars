location = "West Europe"
resource_group_name = "rg-bmaps-nw-prod"
virtual_network_address_space = [ "10.5.36.0/24" ]
App_subnet_name = "sn-bmaps-app-prod"
App_subnet_address_space = [ "10.5.36.0/27" ]
DB_subnet_name = "sn-bmaps-db-prod"
DB_subnet_address_space = [ "10.5.36.32/27" ]
tags = {
  createdWith = "Terraform"
    environment = "Prod"
    department  = "Digital-Platform"
    Application  = "BMAPS"
    Owner  = "OMSTeam"
    DeploymentDate = "2023-08-07"
}
dns_servers = ["10.5.23.36","10.2.10.200","10.2.10.201" ]