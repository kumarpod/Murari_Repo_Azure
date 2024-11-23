rg_var_module = {
  rg1 = {
    name     = "poddar1"
    location = "WestEurope"
  }
}


stg_var_module = {
  stg = {
    name                     = "poddar1storage"
    location                 = "West Europe"
    resource_group_name      = "poddar1"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

vnet_var_module = {
  vnet1 = {
    name                = "poddar1vnet"
    location            = "West Europe"
    resource_group_name = "poddar1"
    address_space       = ["10.10.0.0/16"]
  }
  
}


sub_var_module = {
  sub1 = {
    name                 = "poddar1frontend"
    resource_group_name  = "poddar1"
    virtual_network_name = "poddar1vnet"
    address_prefixes     = ["10.10.1.0/24"]
  }
  sub2 = {
    name                 = "poddar1backend"
    resource_group_name  = "poddar1"
    virtual_network_name = "poddar1vnet"
    address_prefixes     = ["10.10.2.0/24"]
  }
  sub3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "poddar1"
    virtual_network_name = "poddar1vnet"
    address_prefixes     = ["10.10.3.0/26"]
  }
}



bastion_var_module = {
  bastion1 = {
    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "poddar1vnet"
    resource_group_name  = "poddar1"
    pip_name             = "poddar1pip"
    location             = "west Europe"
    bastion_name         = "poddar1bastion"


  }
}

vm_var_module = {
  
    vm1 = {
      subnet_name          = "poddar1frontend"
      virtual_network_name = "poddar1vnet"
      resource_group_name  = "poddar1"
      nic_name             = "poddar1nic"
      location             = "West Europe"
      vm_name              = "poddar1vm"
      size                 = "Standard_F2"
      
    }
    vm2 = {
    subnet_name          = "poddar1frontend"
    virtual_network_name = "poddar1vnet"
    resource_group_name  = "poddar1"
    nic_name             = "poddar2nic"
    location             = "West Europe"
    vm_name              = "poddar2vm"
    size                 = "Standard_F2"
    }
  }

