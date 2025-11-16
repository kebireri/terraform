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

variable "log_analytics_workspace_name" {
  description = "Name of log analytics workspace"
}

variable "log_analytics_retention_in_days" {
  description = "Duration for keeping log data"
  default     = 30
}

variable "monitor_diagnostic_setting_name" {
  description = "Name of diagnostic setting"
}
