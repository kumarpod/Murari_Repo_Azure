variable "vm_var" {
  type = map(any)
}



# data "azurerm_key_vault" "kv" {
#   for_each = var.vm_var
#   name                = "PoddarKeyVault"
#   resource_group_name = "mkp1"
# }

# data "azurerm_key_vault_secret" "username" {
#   for_each = var.vm_var
#   name         = each.value.name_username
#   key_vault_id = data.azurerm_key_vault.kv.id
# }

# data "azurerm_key_vault_secret" "password" {
#   for_each = var.vm_var
#   name         = each.value.name_password
#   key_vault_id = data.azurerm_key_vault.kv.id
# }

data "azurerm_subnet" "frontend-sub" {
  for_each             = var.vm_var
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}



resource "azurerm_network_interface" "nic" {
  for_each            = var.vm_var
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "poddar1frontend"
    subnet_id                     = data.azurerm_subnet.frontend-sub[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "vm" {
  for_each                        = var.vm_var
  name                            = each.value.vm_name
  location                        = each.value.location
  resource_group_name             = each.value.resource_group_name
  size                            = each.value.size
  admin_username                  = "adminuser"
  admin_password                  = "Adminuser@123"
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.nic[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
