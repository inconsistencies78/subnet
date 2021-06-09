
variable "subnets" {
  type = map(object({
    subnet_name                                           = string
    subnet_resource_group_name                            = string
    vnet_name                                             = string
    subnet_address_prefixes                               = list(string) # description = "(Optional) The address prefix to use for the subnet."
    subnet_enforce_private_link_endpoint_network_policies = bool         # description = "(Optional) Enable or Disable network policies for the private link endpoint on the subnet. Default value is false. Conflicts with enforce_private_link_service_network_policies."
    subnet_enforce_private_link_service_network_policies  = bool         # description = "(Optional) Enable or Disable network policies for the private link service on the subnet. Default valule is false. Conflicts with enforce_private_link_endpoint_network_policies."
    service_endpoints                                     = list(string) # description = "(Optional) The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage and Microsoft.Web."
#    service_delegations                                   = map(map(list(string)))
    # delegation_name                                       = string
    # service_delegations_name                              = string
    # service_delegations_actions                           = list(string)
  }))
  description = "Define an Azure subnet"
  default     = {}
}



# variable "subnet_name" {
#   type = string
#   description = ""
# }

# variable "subnet_resource_group_name" {
#   type = string
#   description = ""
# }

# variable "vnet_name" {
#   type = string
#   description = ""
# }

# variable "subnet_address_prefixes" {
#   type = list(string)
#   description = ""
# }


# variable "delegation_name" {
#   type = string
# }

# variable "service_delegation_name" {
#   type = string
# }

# variable "service_delegation_actions" {
#   type = list(string)
# }

/*
variable "subnet" {
  type = map(object({
    subnet_name                                           = string
    subnet_resource_group_name                            = string
    vnet_name                                             = string
    subnet_address_prefixes                               = list(string) # description = "(Optional) The address prefix to use for the subnet."
    subnet_enforce_private_link_endpoint_network_policies = bool         # description = "(Optional) Enable or Disable network policies for the private link endpoint on the subnet. Default value is false. Conflicts with enforce_private_link_service_network_policies."
    subnet_enforce_private_link_service_network_policies  = bool         # description = "(Optional) Enable or Disable network policies for the private link service on the subnet. Default valule is false. Conflicts with enforce_private_link_endpoint_network_policies."
    service_endpoints                                     = list(string) # description = "(Optional) The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage and Microsoft.Web."
    # delegation_name                                       = string
    # service_delegations_name                              = string
    # service_delegations_actions                           = list(string)
  }))
  description = "Define an Azure subnet"
  default     = {}
}
*/