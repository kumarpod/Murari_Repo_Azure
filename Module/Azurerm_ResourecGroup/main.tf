variable "rg_var" {
  type = map(any)
}

resource "azurerm_resource_group" "rg" {
  for_each = var.rg_var
  name     = each.value.name
  location = each.value.location
}

