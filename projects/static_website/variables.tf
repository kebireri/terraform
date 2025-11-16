// Generate variables to prevent hard-coding values 

variable "location" {
  description = "The Azure region in which all resources will be created"
}

variable "resource_group_name" {
  description = "Name of resource group for storage account"
}

variable "storage_account_name" {
  description = "Name of storage account to create"
}

variable "source_content" {
  description = "content of the index.html file"
}
