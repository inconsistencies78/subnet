output "virtual_network_id" {
  value = azurerm_virtual_network.virtual-network.id
}

output "virtual_network_name" {
  value = var.vnet_name

  depends_on = [
    # Create output variable for further use in other modules
    # to make dependencies easier.
    azurerm_virtual_network.virtual-network,
  ]
}