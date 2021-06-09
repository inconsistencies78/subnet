resource "azurerm_subnet" "subnet" {
  for_each                                       = var.subnets
  name                                           = lookup(each.value, "subnet_name")
  resource_group_name                            = lookup(each.value, "subnet_resource_group_name")
  virtual_network_name                           = lookup(each.value, "vnet_name")
  address_prefixes                               = lookup(each.value, "subnet_address_prefixes")
  enforce_private_link_endpoint_network_policies = lookup(each.value, "subnet_enforce_private_link_endpoint_network_policies")
  enforce_private_link_service_network_policies  = lookup(each.value, "subnet_enforce_private_link_service_network_policies")
  service_endpoints                              = lookup(each.value, "service_endpoints", null)

  dynamic "delegation" {
    for_each = each.value.service_delegations
    content {
      name = delegation.key

      dynamic "service_delegation" {
        for_each = delegation.value
        content {
          name    = each.key
          actions = each.value
        }
      }
    }
  }
}
  # delegation_name                                = lookup(each.value, "delegation_name", null)
  # service_delegation_name                        = lookup(each.value, "delegation_name", null)
  # service_delegation_actions                     = lookup(each.value, "service_delegation_actions", null)


/*
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.subnet_resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.subnet_address_prefixes

  delegation {
    name = var.delegation_name

    service_delegation {
      name    = var.service_delegation_name
      actions = var.service_delegation_actions
    }
  }
}



resource "azurerm_subnet" "subnet" {
  for_each                                       = var.subnet
  name                                           = lookup(each.value, "subnet_name")
  resource_group_name                            = lookup(each.value, "subnet_resource_group_name")
  virtual_network_name                           = lookup(each.value, "vnet_name")
  address_prefixes                               = lookup(each.value, "subnet_address_prefixes")
  enforce_private_link_endpoint_network_policies = lookup(each.value, "subnet_enforce_private_link_endpoint_network_policies")
  enforce_private_link_service_network_policies  = lookup(each.value, "subnet_enforce_private_link_service_network_policies")
  service_endpoints                              = lookup(each.value, "service_endpoints")
  # delegation_name                                = lookup(each.value, "delegation_name", null)
  # service_delegation_name                        = lookup(each.value, "delegation_name", null)
  # service_delegation_actions                     = lookup(each.value, "service_delegation_actions", null)

}

/*
  delegation {
    name = var.delegation_name

    service_delegation {
      name    = var.service_delegation_name
      actions = var.service_delegation_actions
    }
  }
*/

