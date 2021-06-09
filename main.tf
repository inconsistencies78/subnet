resource "azurerm_resource_group" "rg1" {
  name     = var.resource_group_name
  location = var.resource_group_location
  tags     = var.tags
}


module "virtual-network-DEV" {
  source                   = "./Modules/virtual-network"
  vnet_name                = "vnet-test-1"
  vnet_location            = "northeurope"
  vnet_resource_group_name = azurerm_resource_group.rg1.name
  vnet_address_space       = ["10.0.0.0/16"]
  vnet_dns_servers         = []
  vnet_tags = {
    author = "andreas.barthel"
  }
}


module "subnet-VNET-DEV" {
  source = "./Modules/subnet"
  subnets = {
    "subnet1" = {
      subnet_name                                           = "default-1"
      subnet_resource_group_name                            = azurerm_resource_group.rg1.name
      vnet_name                                             = module.virtual-network-DEV.virtual_network_name
      subnet_address_prefixes                               = ["10.0.1.0/24", ]
      subnet_enforce_private_link_endpoint_network_policies = false
      subnet_enforce_private_link_service_network_policies  = false
      service_endpoints                                     = []
      service_delegations = {
        acctestdelegation = {
          "Microsoft.ContainerInstance/containerGroups" = [
            "Microsoft.Network/virtualNetworks/subnets/join/action",
            "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
          ]
        }
      }
    }

    "subnet2" = {
      subnet_name                                           = "default-2"
      subnet_resource_group_name                            = azurerm_resource_group.rg1.name
      vnet_name                                             = module.virtual-network-DEV.virtual_network_name
      subnet_address_prefixes                               = ["10.0.2.0/24", ]
      subnet_enforce_private_link_endpoint_network_policies = true
      subnet_enforce_private_link_service_network_policies  = false
      service_endpoints                                     = []
      service_delegations = {
        acctestdelegation = {
          "Microsoft.ContainerInstance/containerGroups" = [
            "Microsoft.Network/virtualNetworks/subnets/join/action",
            "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
          ]
        }
      }
    }
  }
}


/*

  #   delegation_name = "delegation"
  #   service_delegation_name = "Microsoft.ContainerInstance/containerGroups"
  #   service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]  


module "subnet-VNET-DEV" {
  source = "./Modules/subnet"
  subnet_name = "example-subnet"
  subnet_resource_group_name = azurerm_resource_group.rg1.name
  vnet_name = "vnet-test-1"
  subnet_address_prefixes = ["10.0.1.0/24"]
#  delegation_name = "delegation"
#  service_delegation_name = "Microsoft.ContainerInstance/containerGroups"
#  service_delegation_actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
}

*/