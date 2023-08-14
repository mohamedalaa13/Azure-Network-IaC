
variable "location" {
  description = "Specifies the location of Azure resource."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the name of the resource group."
  type        = string
}

variable "virtual_network_address_space" {
  description = "Vnet address Space "
  type        = list(string)
}


variable "App_subnet_name" {
  description = "Specifies the name of the worker node subnet."
  type        = string
}

variable "App_subnet_address_space" {
  description = "Specifies the address space of the APP node subnet."
  type        = list(string)
}

variable "DB_subnet_name" {
  description = "Specifies the name of the DB node subnet."
  type        = string
}

variable "DB_subnet_address_space" {
  description = "Specifies the address space of the DB node subnet."
  type        = list(string)
}

variable "tags" {
  description = "(Optional) Specifies tags for all the resources"
}

variable "dns_servers" {
  description = "(insert the dns Servers"
   type        = list(string)
}