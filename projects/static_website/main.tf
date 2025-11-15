terraform {
  required_version = ">=1.13.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create resource group
resource "azurerm_resource_group" "resource_group" {
  name     = "terrarg"
  location = "switzerlandnorth"
}

# Create storage account
resource "azurerm_storage_account" "storage_account" {
  name                     = "kevwestorage"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_account_static_website" "static_website" {
  storage_account_id = azurerm_storage_account.storage_account.id
  index_document     = "index.html"
  error_404_document = "404.html"
}

resource "azurerm_storage_blob" "blob" {
  name                   = "index.html" // Should be same as the index document of the static website
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "<h1> Testing terraform deployment <h1>"
  depends_on             = [azurerm_storage_account_static_website.static_website]

}
