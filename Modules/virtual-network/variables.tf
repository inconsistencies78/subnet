variable "vnet_name" {
  type        = string
  description = "The name of the virtual network. Changing this forces a new resource to be created."
}

variable "vnet_location" {
  type        = string
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
}

variable "vnet_resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the virtual network."
}

variable "vnet_address_space" {
  type        = list(string)
  description = "The address space that is used the virtual network. You can supply more than one address space."
}

variable "vnet_dns_servers" {
  type        = list(string)
  description = "(Optional) List of IP addresses of DNS servers"
}

variable "vnet_tags" {
  type        = map(any)
  description = "(Optional) A mapping of tags to assign to the resource."
}
