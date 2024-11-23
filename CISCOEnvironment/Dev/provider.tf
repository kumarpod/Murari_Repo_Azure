# terraform {
# # backend "azurerm" {
# #     resource_group_name  = ""  # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
# #     storage_account_name = ""                      # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
# #     container_name       = ""                       # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
# #     key                  = ""        # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
# #   }
#   required_providers {
#     azurerm = {
#       source = "hashicorp/azurerm"
#       version = "4.0.1"
#     }
#   }
# }
provider "azurerm" {
  subscription_id = "87439ba6-909d-463e-a3cd-37a82d8f8168"
  features {

  }
}