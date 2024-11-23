module "rg_module" {
  source = "../../Module/Azurerm_ResourecGroup"
  rg_var = var.rg_var_module
}

module "stg_module" {
  depends_on = [ module.rg_module ]
  source = "../../Module/Azurerm_StorageAccount"
  stg_var = var.stg_var_module
}

module "vnet_module" {
  depends_on = [ module.rg_module ]
  source = "../../Module/Azurerm_VirtualNetwork"
  vnet_var = var.vnet_var_module
}

module "sub_module" {
  depends_on = [ module.vnet_module ]
  source = "../../Module/Azurerm_Subnet"
  sub_var = var.sub_var_module
}

module "bastion_module" {
  depends_on = [ module.sub_module]
  source = "../../Module/Azurerm_Bastion"
  bastion_var = var.bastion_var_module
}

module "vm_module" {
  depends_on = [ module.sub_module ]
  source = "../../Module/Azurerm_VirtualMachine"
  vm_var = var.vm_var_module
}