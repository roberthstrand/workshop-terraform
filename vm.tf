module "vm" {
  source  = "crayon/vm/azurerm"
  version = "1.13.3"

  name           = format("vm%s", var.name)
  resource_group = azurerm_resource_group.main.name
  location       = azurerm_resource_group.main.location

  admin_user = {
    username = "crayonadm"
    password = var.vm_password
  }

  network_interface_subnets = [{
    name                 = azurerm_subnet.servers.name
    virtual_network_name = azurerm_virtual_network.main.name
    resource_group_name  = azurerm_resource_group.main.name
    public_ip_id         = null
    static_ip            = null
  }]

  tags = local.tags

  depends_on = [
    azurerm_subnet.servers
  ]
}

