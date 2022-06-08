resource "azurerm_resource_group" "main" {
  location = "Norway East"
  name     = format("rg-%s", var.name)
}

resource "azurerm_virtual_network" "main" {
  name                = format("vnet-%s", var.name)
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  address_space = ["10.0.0.0/24"]

  tags = local.tags
}

resource "azurerm_subnet" "servers" {
  name                 = "servers"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name

  address_prefixes = ["10.0.0.0/25"]
}
