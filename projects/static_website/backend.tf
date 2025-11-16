// Creating remote backend - securely stores state file in an online location 

# A resource group and storage account have been created for this using CLI.

terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaterg"
    storage_account_name = "kevwestate"
    container_name       = "kevwecontainer"
    key                  = "terraform.tfstate" // refers to the state file
  }
}
