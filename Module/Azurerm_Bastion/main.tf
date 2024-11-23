variable "bastion_var" {
  type = map(any)
}



data "azurerm_subnet" "bastion-subnet" {
  for_each             = var.bastion_var
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}



resource "azurerm_public_ip" "pip" {
  for_each            = var.bastion_var
  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion" {
  for_each = var.bastion_var
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "internal"
    subnet_id            = data.azurerm_subnet.bastion-subnet[each.key].id
    public_ip_address_id = azurerm_public_ip.pip[each.key].id
  }
}
